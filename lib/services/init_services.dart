import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:studyhive/src/auth/data/remote/data_sources/auth_remote_database.dart';
import 'package:studyhive/src/auth/data/repositories/auth_repository_impl.dart';
import 'package:studyhive/src/auth/domain/repositories/auth_repository.dart';

import '../src/auth/data/local/data_sources/auth_local_database.dart';

Future<void> initServices() async {
  await Get.putAsync(() => RemoteDatabaseServices().init());
  await Get.putAsync(() => LocalDatabaseServices().init());
  await Get.putAsync(() => RepositoryServices().init());
}

class RepositoryServices extends GetxService {
  Future<RepositoryServices> init() async {
    Get.put<AuthRepository>(AuthRepositoryImpl(
      remoteDatabase: Get.find<AuthRemoteDatabase>(),
      localDatabase: Get.find<AuthLocalDatabase>(),
    ));
    return this;
  }
}

class RemoteDatabaseServices extends GetxService {
  Future<RemoteDatabaseServices> init() async {
    Get.put<AuthRemoteDatabase>(AuthRemoteDatabaseImpl());
    return this;
  }
}

class LocalDatabaseServices extends GetxService {
  Future<LocalDatabaseServices> init() async {
    await GetStorage.init('profileBox');
    Get.put<AuthLocalDatabase>(AuthLocalDatabaseImpl());
    return this;
  }
}
