import 'package:get_storage/get_storage.dart';

import '../../../../profile/domain/entities/profile.dart';

abstract class AuthLocalDatabase {
  Future<void> save(Profile profile);

  Future<Profile> retrieve(String id);

  Future<void> delete(String id);

  Future<bool> authStatus();
}

class AuthLocalDatabaseImpl implements AuthLocalDatabase {
  final boxName = 'profileBox';
  final userKey = 'profileKey';

  @override
  Future<void> delete(String id) async {
    final box = GetStorage(boxName);
    await box.erase();
  }

  @override
  Future<Profile> retrieve(String id) async {
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
}
