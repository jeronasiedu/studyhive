import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:studyhive/src/auth/data/services/auth_service.dart';
import 'package:studyhive/src/hive/data/hive_service.dart';
import 'package:studyhive/src/profile/data/services/profile_service.dart';

import '../shared/network/network.dart';

Future<void> initServices() async {
  await Get.putAsync(() => NetworkServices().init());
  await Get.putAsync(() => ProfileService().init());
  await Get.putAsync(() => AuthService().init());
  await Get.putAsync(() => HiveService().init());
  await Get.putAsync(() => LocalDatabaseServices().init());
}

class LocalDatabaseServices extends GetxService {
  Future<LocalDatabaseServices> init() async {
    await GetStorage.init('profileBox');
    await GetStorage.init('hiveBox');
    return this;
  }
}

class NetworkServices extends GetxService {
  Future<NetworkServices> init() async {
    Get.put<NetworkInfo>(NetworkInfoImpl());
    return this;
  }
}
