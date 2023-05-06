import 'package:get/get.dart';

import '../../../profile/data/local/data_sources/profile_local_database.dart';
import '../../../profile/data/remote/data_sources/profile_remote_database.dart';
import '../../domain/repositories/auth_repository.dart';
import '../repositories/auth_repository_impl.dart';

class AuthService extends GetxService {
  Future<AuthService> init() async {
    Get.put<AuthRepository>(AuthRepositoryImpl(
      remoteDatabase: Get.find<ProfileRemoteDatabase>(),
      localDatabase: Get.find<ProfileLocalDatabase>(),
    ));
    return this;
  }
}
