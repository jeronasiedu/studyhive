import 'package:get_storage/get_storage.dart';

import '../../../domain/entities/profile.dart';

abstract class ProfileLocalDatabase {
  /// Saves the [Profile] to the local database
  Future<void> save(Profile profile);

  /// Returns the [Profile] from the local database
  Future<Profile> retrieve();

  /// Deletes the [Profile] from the local database
  Future<void> delete();

  /// Returns true if the user is authenticated
  Future<bool> authStatus();

  /// Checks if the user finished the setup process
  Future<bool> finishedSetup();
}

class ProfileLocalDatabaseImpl implements ProfileLocalDatabase {
  final boxName = 'profileBox';
  final userKey = 'profileKey';

  @override
  Future<void> delete() async {
    final box = GetStorage(boxName);
    await box.erase();
  }

  @override
  Future<Profile> retrieve() async {
    final box = GetStorage(boxName);
    final userDetails = box.read(userKey);
    final user = userDetails != null ? Profile.fromJson(userDetails) : Profile.empty();
    return Future.value(user);
  }

  @override
  Future<void> save(Profile profile) async {
    final box = GetStorage(boxName);
    await box.write(userKey, profile.toJson());
  }

  @override
  Future<bool> authStatus() {
    final box = GetStorage(boxName);
    final user = box.read(userKey);
    return Future.value(user != null);
  }

  @override
  Future<bool> finishedSetup() async {
    final userDetails = await retrieve();
    return userDetails.name.isNotEmpty;
  }
}
