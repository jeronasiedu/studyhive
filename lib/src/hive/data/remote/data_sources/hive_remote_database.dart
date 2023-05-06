import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../account/domain/entities/profile.dart';
import '../../../domain/entities/hive.dart';

abstract class HiveRemoteDatabase {
  /// Returns a list of all the Hives
  Stream<List<Hive>> list(String userId);

  /// Creates a new Hive
  Future<String> create(Hive hive);

  /// Updates an existing Hive
  Future<String> update(Hive hive);

  /// Deletes an existing Hive
  Future<String> delete(String hiveId);

  /// Joins an existing Hive
  Future<String> join({required String hiveId, required String userId});
}

class HiveRemoteDatabaseImpl implements HiveRemoteDatabase {
  @override
  Future<String> create(Hive hive) async {
    final members = hive.members.map((member) => member.id).toList();
    final hiveWithMembersIds = hive.toJson();
    hiveWithMembersIds['members'] = members;
    await FirebaseFirestore.instance.collection('hives').doc(hive.id).set(hiveWithMembersIds);
    return hive.id;
  }

  @override
  Future<String> delete(String hiveId) async {
    await FirebaseFirestore.instance.collection('hives').doc(hiveId).delete();
    return hiveId;
  }

  @override
  Future<String> join({required String hiveId, required String userId}) async {
    await FirebaseFirestore.instance.collection('hives').doc(hiveId).update({
      'members': FieldValue.arrayUnion([userId])
    });
    return hiveId;
  }

  @override
  Stream<List<Hive>> list(String userId) async* {
    final hives = FirebaseFirestore.instance.collection('hives').where('members', arrayContains: userId).snapshots();
    await for (final hive in hives) {
      final List<Profile> members = [];
      await Future.wait(hive.docs.map((hive) async {
        final memberIds = hive.data()['members'] as List<String>;
        final memberDocs = await Future.wait(
            memberIds.map((memberId) => FirebaseFirestore.instance.collection('profiles').doc(memberId).get()));
        final memberProfiles = memberDocs.map((memberDoc) => Profile.fromJson(memberDoc.data()!)).toList();
        members.addAll(memberProfiles);
      }));
      yield hive.docs.map((hive) {
        final hiveData = hive.data();
        hiveData['members'] = members;
        return Hive.fromJson(hiveData);
      }).toList();
    }
  }

  @override
  Future<String> update(Hive hive) async {
    final members = hive.members.map((member) => member.id).toList();
    final hiveWithMembersIds = hive.toJson();
    hiveWithMembersIds['members'] = members;
    await FirebaseFirestore.instance.collection('hives').doc(hive.id).update(hiveWithMembersIds);
    return hive.id;
  }
}
