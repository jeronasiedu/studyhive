import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.freezed.dart';
part 'message.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class Message with _$Message {
  const factory Message({
    /// Unique ID of the message
    required String id,

    /// ID of the user who sent the message
    required String senderId,

    /// Content of the message
    required String content,

    /// The date the message was sent
    required DateTime sentAt,

    /// The type of the message
    required MessageType type,
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);
}

enum MessageType {
  text,
  image,
  video,
  audio,
  file,
}
