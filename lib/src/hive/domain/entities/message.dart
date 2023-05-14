import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:studyhive/src/hive/domain/entities/media.dart';
import 'package:studyhive/src/hive/domain/entities/topic.dart';

part 'message.freezed.dart';
part 'message.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class Message with _$Message {
  const factory Message({
    /// Unique ID of the message
    required String id,

    /// ID of the user who sent the message
    required String senderId,

    /// Text of the message
    String? text,

    /// Media attached to the message
    @Default([]) List<Media> media,

    /// Question type if the message is a question
    QuestionType? questionType,

    /// Topic object if the message is a question or a material
    Topic? topic,

    /// List of options if the message is a poll
    @Default([]) List<String> options,

    /// The date the message was sent
    required DateTime sentAt,

    /// The type of the message
    required MessageType type,
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);
}

enum MessageType {
  discussion,
  question,
  announcement,
  poll,
  material,
  text,
}

enum QuestionType {
  multipleChoice,
  trueFalse,
  shortAnswer,
  longAnswer,
}

extension QuestionTypeX on QuestionType {
  String get text {
    switch (this) {
      case QuestionType.multipleChoice:
        return "Multiple Choice";
      case QuestionType.trueFalse:
        return "True or False";
      case QuestionType.shortAnswer:
        return "Short Answer";
      case QuestionType.longAnswer:
        return "Long Answer";
    }
  }
}
