// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hive.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Hive _$HiveFromJson(Map<String, dynamic> json) {
  return _Hive.fromJson(json);
}

/// @nodoc
mixin _$Hive {
  /// Unique ID of the Hive
  String get id => throw _privateConstructorUsedError;

  /// Name of the Hive
  String get name => throw _privateConstructorUsedError;

  /// Description of the Hive
  String? get description => throw _privateConstructorUsedError;

  /// Photo URL of the Hive
  String? get photoUrl => throw _privateConstructorUsedError;

  /// Members of the Hive
  List<String> get members => throw _privateConstructorUsedError;

  /// The ID of the user who created the Hive
  String get createdBy =>
      throw _privateConstructorUsedError; // The date the Hive was created
  DateTime get createdAt =>
      throw _privateConstructorUsedError; // The date the Hive was last updated
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// conversations of the Hive
  List<Message> get conversations => throw _privateConstructorUsedError;

  /// Admins of the Hive
  List<String> get admins => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HiveCopyWith<Hive> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HiveCopyWith<$Res> {
  factory $HiveCopyWith(Hive value, $Res Function(Hive) then) =
      _$HiveCopyWithImpl<$Res, Hive>;
  @useResult
  $Res call(
      {String id,
      String name,
      String? description,
      String? photoUrl,
      List<String> members,
      String createdBy,
      DateTime createdAt,
      DateTime updatedAt,
      List<Message> conversations,
      List<String> admins});
}

/// @nodoc
class _$HiveCopyWithImpl<$Res, $Val extends Hive>
    implements $HiveCopyWith<$Res> {
  _$HiveCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? photoUrl = freezed,
    Object? members = null,
    Object? createdBy = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? conversations = null,
    Object? admins = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      members: null == members
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      conversations: null == conversations
          ? _value.conversations
          : conversations // ignore: cast_nullable_to_non_nullable
              as List<Message>,
      admins: null == admins
          ? _value.admins
          : admins // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HiveCopyWith<$Res> implements $HiveCopyWith<$Res> {
  factory _$$_HiveCopyWith(_$_Hive value, $Res Function(_$_Hive) then) =
      __$$_HiveCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String? description,
      String? photoUrl,
      List<String> members,
      String createdBy,
      DateTime createdAt,
      DateTime updatedAt,
      List<Message> conversations,
      List<String> admins});
}

/// @nodoc
class __$$_HiveCopyWithImpl<$Res> extends _$HiveCopyWithImpl<$Res, _$_Hive>
    implements _$$_HiveCopyWith<$Res> {
  __$$_HiveCopyWithImpl(_$_Hive _value, $Res Function(_$_Hive) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? photoUrl = freezed,
    Object? members = null,
    Object? createdBy = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? conversations = null,
    Object? admins = null,
  }) {
    return _then(_$_Hive(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      members: null == members
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      conversations: null == conversations
          ? _value.conversations
          : conversations // ignore: cast_nullable_to_non_nullable
              as List<Message>,
      admins: null == admins
          ? _value.admins
          : admins // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Hive implements _Hive {
  const _$_Hive(
      {required this.id,
      required this.name,
      this.description,
      this.photoUrl,
      this.members = const [],
      required this.createdBy,
      required this.createdAt,
      required this.updatedAt,
      this.conversations = const [],
      this.admins = const []});

  factory _$_Hive.fromJson(Map<String, dynamic> json) => _$$_HiveFromJson(json);

  /// Unique ID of the Hive
  @override
  final String id;

  /// Name of the Hive
  @override
  final String name;

  /// Description of the Hive
  @override
  final String? description;

  /// Photo URL of the Hive
  @override
  final String? photoUrl;

  /// Members of the Hive
  @override
  @JsonKey()
  final List<String> members;

  /// The ID of the user who created the Hive
  @override
  final String createdBy;
// The date the Hive was created
  @override
  final DateTime createdAt;
// The date the Hive was last updated
  @override
  final DateTime updatedAt;

  /// conversations of the Hive
  @override
  @JsonKey()
  final List<Message> conversations;

  /// Admins of the Hive
  @override
  @JsonKey()
  final List<String> admins;

  @override
  String toString() {
    return 'Hive(id: $id, name: $name, description: $description, photoUrl: $photoUrl, members: $members, createdBy: $createdBy, createdAt: $createdAt, updatedAt: $updatedAt, conversations: $conversations, admins: $admins)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Hive &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            const DeepCollectionEquality().equals(other.members, members) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality()
                .equals(other.conversations, conversations) &&
            const DeepCollectionEquality().equals(other.admins, admins));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      photoUrl,
      const DeepCollectionEquality().hash(members),
      createdBy,
      createdAt,
      updatedAt,
      const DeepCollectionEquality().hash(conversations),
      const DeepCollectionEquality().hash(admins));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HiveCopyWith<_$_Hive> get copyWith =>
      __$$_HiveCopyWithImpl<_$_Hive>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HiveToJson(
      this,
    );
  }
}

abstract class _Hive implements Hive {
  const factory _Hive(
      {required final String id,
      required final String name,
      final String? description,
      final String? photoUrl,
      final List<String> members,
      required final String createdBy,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      final List<Message> conversations,
      final List<String> admins}) = _$_Hive;

  factory _Hive.fromJson(Map<String, dynamic> json) = _$_Hive.fromJson;

  @override

  /// Unique ID of the Hive
  String get id;
  @override

  /// Name of the Hive
  String get name;
  @override

  /// Description of the Hive
  String? get description;
  @override

  /// Photo URL of the Hive
  String? get photoUrl;
  @override

  /// Members of the Hive
  List<String> get members;
  @override

  /// The ID of the user who created the Hive
  String get createdBy;
  @override // The date the Hive was created
  DateTime get createdAt;
  @override // The date the Hive was last updated
  DateTime get updatedAt;
  @override

  /// conversations of the Hive
  List<Message> get conversations;
  @override

  /// Admins of the Hive
  List<String> get admins;
  @override
  @JsonKey(ignore: true)
  _$$_HiveCopyWith<_$_Hive> get copyWith => throw _privateConstructorUsedError;
}
