import 'package:get_storage/get_storage.dart';

import '../../../domain/entities/hive.dart';

abstract class HiveLocalDatabase {
  /// Returns a list of all the Hives
  Stream<List<Hive>> list();

  /// Saves a list of Hives
  Future<String> save(List<Hive> hives);

  /// Retrieves a Hive
  Future<Hive> retrieve(String hiveId);
}

class HiveLocalDatabaseImpl implements HiveLocalDatabase {
  final boxName = 'hiveBox';
  final hivesContainer = 'hives';

  @override
  Stream<List<Hive>> list() async* {
    final box = GetStorage(boxName);
    final hives = box.read(hivesContainer);
    final List<Hive> data = hives != null ? hives.map((hive) => Hive.fromJson(hive)).toList() : [];
    yield data;
  }

  @override
  Future<Hive> retrieve(String hiveId) async {
    final box = GetStorage(boxName);
    final hives = box.read(hivesContainer);
    final hive = hives.firstWhere((hive) => hive.id == hiveId);
    return hive;
  }

  @override
  Future<String> save(List<Hive> hives) async {
    final box = GetStorage(boxName);
    final hivesMap = hives.map((hive) => hive.toJson()).toList();
    await box.write(hivesContainer, hivesMap);
    return 'Success';
  }
}
