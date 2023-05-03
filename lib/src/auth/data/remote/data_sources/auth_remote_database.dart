import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../account/domain/entities/profile.dart';

abstract class AuthRemoteDatabase {
  Future<void> save(Profile profile);

  Future<Profile> retrieve(String id);

  Future<void> delete(String id);
}

class AuthRemoteDatabaseImpl implements AuthRemoteDatabase {
  @override
  Future<void> save(Profile profile) async {
    await FirebaseFirestore.instance
        .collection('profiles')
        .doc(profile.id)
        .set(profile.toJson(), SetOptions(merge: true));
  }

  @override
  Future<Profile> retrieve(String id) async {
    final results = await FirebaseFirestore.instance.collection('profiles').doc(id).get();
    return Profile.fromJson(results.data()!);
  }

  @override
  Future<void> delete(String id) async {
    await FirebaseFirestore.instance.collection('profiles').doc(id).delete();
  }
}
