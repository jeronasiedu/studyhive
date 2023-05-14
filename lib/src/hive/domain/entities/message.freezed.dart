// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Message _$MessageFromJson(Map<String, dynamic> json) {
  return _Message.fromJson(json);
}

/// @nodoc
mixin _$Message {
  /// Unique ID of the message
  String get id => throw _privateConstructorUsedError;

  /// ID of the user who sent the message
  String get senderId => throw _privateConstructorUsedError;

  /// Text of the message
  String? get text => throw _privateConstructorUsedError;

  /// Media attached to the message
  List<Media> get media => throw _privateConstructorUsedError;

  /// Question type if the message is a question
  QuestionType? get questionType => throw _privateConstructorUsedError;

  /// Topic object if the message is a question or a material
  Topic? get topic => throw _privateConstructorUsedError;

  /// List of options if the message is a poll
  List<String> get options => throw _privateConstructorUsedError;

  /// The date the message was sent
  DateTime get sentAt => throw _privateConstructorUsedError;

  /// The type of the message
  MessageType get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageCopyWith<Message> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageCopyWith<$Res> {
  factory $MessageCopyWith(Message value, $Res Function(Message) then) =
      _$MessageCopyWithImpl<$Res, Message>;
  @useResult
  $Res call(
      {String id,
      String senderId,
      String? text,
      List<Media> media,
      QuestionType? questionType,
      Topic? topic,
      List<String> options,
      DateTime sentAt,
      MessageType type});

  $TopicCopyWith<$Res>? get topic;
}

/// @nodoc
class _$MessageCopyWithImpl<$Res, $Val extends Message>
    implements $MessageCopyWith<$Res> {
  _$MessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? senderId = null,
    Object? text = freezed,
    Object? media = null,
    Object? questionType = freezed,
    Object? topic = freezed,
    Object? options = null,
    Object? sentAt = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      media: null == media
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as List<Media>,
      questionType: freezed == questionType
          ? _value.questionType
          : questionType // ignore: cast_nullable_to_non_nullable
              as QuestionType?,
      topic: freezed == topic
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as Topic?,
      options: null == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<String>,
      sentAt: null == sentAt
          ? _value.sentAt
          : sentAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MessageType,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TopicCopyWith<$Res>? get topic {
    if (_value.topic == null) {
      return null;
    }

    return $TopicCopyWith<$Res>(_value.topic!, (value) {
      return _then(_value.copyWith(topic: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MessageCopyWith<$Res> implements $MessageCopyWith<$Res> {
  factory _$$_MessageCopyWith(
          _$_Message value, $Res Function(_$_Message) then) =
      __$$_MessageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String senderId,
      String? text,
      List<Media> media,
      QuestionType? questionType,
      Topic? topic,
      List<String> options,
      DateTime sentAt,
      MessageType type});

  @override
  $TopicCopyWith<$Res>? get topic;
}

/// @nodoc
class __$$_MessageCopyWithImpl<$Res>
    extends _$MessageCopyWithImpl<$Res, _$_Message>
    implements _$$_MessageCopyWith<$Res> {
  __$$_MessageCopyWithImpl(_$_Message _value, $Res Function(_$_Message) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? senderId = null,
    Object? text = freezed,
    Object? media = null,
    Object? questionType = freezed,
    Object? topic = freezed,
    Object? options = null,
    Object? sentAt = null,
    Object? type = null,
  }) {
    return _then(_$_Message(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      media: null == media
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as List<Media>,
      questionType: freezed == questionType
          ? _value.questionType
          : questionType // ignore: cast_nullable_to_non_nullable
              as QuestionType?,
      topic: freezed == topic
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as Topic?,
      options: null == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<String>,
      sentAt: null == sentAt
          ? _value.sentAt
          : sentAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MessageType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Message implements _Message {
  const _$_Message(
      {required this.id,
      required this.senderId,
      this.text,
      this.media = const [],
      this.questionType,
      this.topic,
      this.options = const [],
      required this.sentAt,
      required this.type});

  factory _$_Message.fromJson(Map<String, dynamic> json) =>
      _$$_MessageFromJson(json);

  /// Unique ID of the message
  @override
  final String id;

  /// ID of the user who sent the message
  @override
  final String senderId;

  /// Text of the message
  @override
  final String? text;

  /// Media attached to the message
  @override
  @JsonKey()
  final List<Media> media;

  /// Question type if the message is a question
  @override
  final QuestionType? questionType;

  /// Topic object if the message is a question or a material
  @override
  final Topic? topic;

  /// List of options if the message is a poll
  @override
  @JsonKey()
  final List<String> options;

  /// The date the message was sent
  @override
  final DateTime sentAt;

  /// The type of the message
  @override
  final MessageType type;

  @override
  String toString() {
    return 'Message(id: $id, senderId: $senderId, text: $text, media: $media, questionType: $questionType, topic: $topic, options: $options, sentAt: $sentAt, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Message &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.text, text) || other.text == text) &&
            const DeepCollectionEquality().equals(other.media, media) &&
            (identical(other.questionType, questionType) ||
                other.questionType == questionType) &&
            (identical(other.topic, topic) || other.topic == topic) &&
            const DeepCollectionEquality().equals(other.options, options) &&
            (identical(other.sentAt, sentAt) || other.sentAt == sentAt) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      senderId,
      text,
      const DeepCollectionEquality().hash(media),
      questionType,
      topic,
      const DeepCollectionEquality().hash(options),
      sentAt,
      type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MessageCopyWith<_$_Message> get copyWith =>
      __$$_MessageCopyWithImpl<_$_Message>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MessageToJson(
      this,
    );
  }
}

abstract class _Message implements Message {
  const factory _Message(
      {required final String id,
      required final String senderId,
      final String? text,
      final List<Media> media,
      final QuestionType? questionType,
      final Topic? topic,
      final List<String> options,
      required final DateTime sentAt,
      required final MessageType type}) = _$_Message;

  factory _Message.fromJson(Map<String, dynamic> json) = _$_Message.fromJson;

  @override

  /// Unique ID of the message
  String get id;
  @override

  /// ID of the user who sent the message
  String get senderId;
  @override

  /// Text of the message
  String? get text;
  @override

  /// Media attached to the message
  List<Media> get media;
  @override

  /// Question type if the message is a question
  QuestionType? get questionType;
  @override

  /// Topic object if the message is a question or a material
  Topic? get topic;
  @override

  /// List of options if the message is a poll
  List<String> get options;
  @override

  /// The date the message was sent
  DateTime get sentAt;
  @override

  /// The type of the message
  MessageType get type;
  @override
  @JsonKey(ignore: true)
  _$$_MessageCopyWith<_$_Message> get copyWith =>
      throw _privateConstructorUsedError;
}
