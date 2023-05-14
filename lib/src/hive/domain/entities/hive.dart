import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:studyhive/src/hive/domain/entities/message.dart';

part 'hive.freezed.dart';
part 'hive.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class Hive with _$Hive {
  const factory Hive({
    /// Unique ID of the Hive
    required String id,

    /// Name of the Hive
    required String name,

    /// Description of the Hive
    String? description,

    /// Photo URL of the Hive
    String? photoUrl,

    /// Members of the Hive
    @Default([]) List<String> members,

    /// The ID of the user who created the Hive
    required String createdBy,
    // The date the Hive was created
    required DateTime createdAt,
    // The date the Hive was last updated
    required DateTime updatedAt,

    /// conversations of the Hive
    @Default([]) List<Message> conversations,

    /// Admins of the Hive
    @Default([]) List<String> admins,
  }) = _Hive;

  factory Hive.fromJson(Map<String, dynamic> json) => _$HiveFromJson(json);

  factory Hive.empty() => Hive(
        id: '',
        name: '',
        createdBy: '',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
}
