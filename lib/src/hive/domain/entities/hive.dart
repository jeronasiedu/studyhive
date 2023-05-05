import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:studyhive/src/account/domain/entities/profile.dart';
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
    required String description,

    /// Photo URL of the Hive
    String? photoUrl,

    /// Members of the Hive
    required List<Profile> members,

    /// The ID of the user who created the Hive
    required String createdBy,
    // The date the Hive was created
    required String createdAt,
    // The date the Hive was last updated
    required String updatedAt,

    /// conversations of the Hive
    required List<Message> conversations,
  }) = _Hive;

  factory Hive.fromJson(Map<String, dynamic> json) => _$HiveFromJson(json);
}
