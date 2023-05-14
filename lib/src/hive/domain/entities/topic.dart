import 'package:freezed_annotation/freezed_annotation.dart';

part 'topic.freezed.dart';
part 'topic.g.dart';

@freezed
class Topic with _$Topic {
  const factory Topic({
    /// Unique ID of the topic
    required String id,

    /// Name of the topic
    required String name,

    /// Description of the topic
    String? description,

    /// The ID of the user who created the topic
    required String createdBy,

    /// The date the topic was created
    required DateTime createdAt,
  }) = _Topic;

  factory Topic.fromJson(Map<String, dynamic> json) => _$TopicFromJson(json);

  factory Topic.empty() => Topic(
        id: '',
        name: '',
        createdBy: '',
        createdAt: DateTime.now(),
      );
}
