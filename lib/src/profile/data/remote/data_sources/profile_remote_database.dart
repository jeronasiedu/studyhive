import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../domain/entities/profile.dart';

abstract class ProfileRemoteDatabase {
  /// Saves the [Profile] to the remote database
  Future<void> save(Profile profile);

  /// Retrieves the [Profile] from the remote database
  Future<Profile> retrieve(String id);

  /// Deletes the [Profile] from the remote database
  Future<void> delete(String id);
}

class ProfileRemoteDatabaseImpl implements ProfileRemoteDatabase {
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
