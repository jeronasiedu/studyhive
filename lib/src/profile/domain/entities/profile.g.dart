// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Profile _$$_ProfileFromJson(Map<String, dynamic> json) => _$_Profile(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String?,
      photoUrl: json['photoUrl'] as String?,
      bio: json['bio'] as String?,
      school: json['school'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
    );

Map<String, dynamic> _$$_ProfileToJson(_$_Profile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'photoUrl': instance.photoUrl,
      'bio': instance.bio,
      'school': instance.school,
      'phoneNumber': instance.phoneNumber,
    };
