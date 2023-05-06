import 'package:get/get.dart';

import '../../../../shared/network/network.dart';
import '../../domain/repositories/profile_repository.dart';
import '../../domain/use_cases/retrieve.dart';
import '../local/data_sources/profile_local_database.dart';
import '../remote/data_sources/profile_remote_database.dart';
import '../repositories/profile_repository_impl.dart';

class ProfileService extends GetxService {
  Future<ProfileService> init() async {
    Get.put<ProfileLocalDatabase>(ProfileLocalDatabaseImpl());
    Get.put<ProfileRemoteDatabase>(ProfileRemoteDatabaseImpl());
    Get.put<ProfileRepository>(ProfileRepositoryImpl(
      remoteDatabase: Get.find<ProfileRemoteDatabase>(),
      localDatabase: Get.find<ProfileLocalDatabase>(),
      networkInfo: Get.find<NetworkInfo>(),
    ));
    Get.put<RetrieveProfile>(RetrieveProfile(Get.find<ProfileRepository>()));
    return this;
  }
}
