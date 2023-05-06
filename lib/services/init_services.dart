import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:studyhive/src/auth/domain/repositories/auth_repository.dart';
import 'package:studyhive/src/hive/data/local/data_sources/hive_local_database.dart';
import 'package:studyhive/src/hive/data/remote/data_sources/hive_remote_database.dart';
import 'package:studyhive/src/hive/data/repositories/hive_repository_impl.dart';
import 'package:studyhive/src/hive/domain/repositories/hive_repository.dart';
import 'package:studyhive/src/profile/data/remote/data_sources/profile_remote_database.dart';
import 'package:studyhive/src/profile/data/repositories/profile_repository_impl.dart';
import 'package:studyhive/src/profile/domain/repositories/profile_repository.dart';
import 'package:studyhive/src/profile/domain/use_cases/retrieve.dart';

import '../shared/network/network.dart';
import '../src/auth/data/auth_repository_impl.dart';
import '../src/profile/data/local/data_sources/profile_local_database.dart';

Future<void> initServices() async {
  await Get.putAsync(() => NetworkServices().init());
  await Get.putAsync(() => RemoteDatabaseServices().init());
  await Get.putAsync(() => LocalDatabaseServices().init());
  await Get.putAsync(() => RepositoryServices().init());
  await Get.putAsync(() => UseCaseServices().init());
}

class RepositoryServices extends GetxService {
  Future<RepositoryServices> init() async {
    Get.put<AuthRepository>(AuthRepositoryImpl(
      remoteDatabase: Get.find<ProfileRemoteDatabase>(),
      localDatabase: Get.find<ProfileLocalDatabase>(),
    ));
    Get.put<HiveRepository>(HiveRepositoryImpl(
      remoteDatabase: Get.find<HiveRemoteDatabase>(),
      localDatabase: Get.find<HiveLocalDatabase>(),
      networkInfo: Get.find<NetworkInfo>(),
    ));
    Get.put<ProfileRepository>(ProfileRepositoryImpl(
      remoteDatabase: Get.find<ProfileRemoteDatabase>(),
      localDatabase: Get.find<ProfileLocalDatabase>(),
      networkInfo: Get.find<NetworkInfo>(),
    ));

    return this;
  }
}

class RemoteDatabaseServices extends GetxService {
  Future<RemoteDatabaseServices> init() async {
    Get.put<ProfileRemoteDatabase>(ProfileRemoteDatabaseImpl());
    Get.put<HiveRemoteDatabase>(HiveRemoteDatabaseImpl());
    Get.put<ProfileRemoteDatabase>(ProfileRemoteDatabaseImpl());
    return this;
  }
}

class LocalDatabaseServices extends GetxService {
  Future<LocalDatabaseServices> init() async {
    await GetStorage.init('profileBox');
    await GetStorage.init('hiveBox');
    Get.put<ProfileLocalDatabase>(ProfileLocalDatabaseImpl());
    Get.put<HiveLocalDatabase>(HiveLocalDatabaseImpl());
    Get.put<ProfileLocalDatabase>(ProfileLocalDatabaseImpl());
    return this;
  }
}

class NetworkServices extends GetxService {
  Future<NetworkServices> init() async {
    Get.put<NetworkInfo>(NetworkInfoImpl());
    return this;
  }
}

class UseCaseServices extends GetxService {
  Future<UseCaseServices> init() async {
    Get.put<RetrieveProfile>(RetrieveProfile(Get.find<ProfileRepository>()));
    return this;
  }
}
