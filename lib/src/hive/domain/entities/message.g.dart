// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Message _$$_MessageFromJson(Map<String, dynamic> json) => _$_Message(
      id: json['id'] as String,
      senderId: json['senderId'] as String,
      text: json['text'] as String?,
      media: (json['media'] as List<dynamic>?)
              ?.map((e) => Media.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      questionType:
          $enumDecodeNullable(_$QuestionTypeEnumMap, json['questionType']),
      topic: json['topic'] == null
          ? null
          : Topic.fromJson(json['topic'] as Map<String, dynamic>),
      options: (json['options'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      sentAt: DateTime.parse(json['sentAt'] as String),
      type: $enumDecode(_$MessageTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$_MessageToJson(_$_Message instance) =>
    <String, dynamic>{
      'id': instance.id,
      'senderId': instance.senderId,
      'text': instance.text,
      'media': instance.media,
      'questionType': _$QuestionTypeEnumMap[instance.questionType],
      'topic': instance.topic,
      'options': instance.options,
      'sentAt': instance.sentAt.toIso8601String(),
      'type': _$MessageTypeEnumMap[instance.type]!,
    };

const _$QuestionTypeEnumMap = {
  QuestionType.multipleChoice: 'multipleChoice',
  QuestionType.trueFalse: 'trueFalse',
  QuestionType.shortAnswer: 'shortAnswer',
  QuestionType.longAnswer: 'longAnswer',
};

const _$MessageTypeEnumMap = {
  MessageType.discussion: 'discussion',
  MessageType.question: 'question',
  MessageType.announcement: 'announcement',
  MessageType.poll: 'poll',
  MessageType.material: 'material',
  MessageType.text: 'text',
};
