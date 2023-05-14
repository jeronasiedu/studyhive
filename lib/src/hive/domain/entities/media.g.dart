// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Media _$$_MediaFromJson(Map<String, dynamic> json) => _$_Media(
      url: json['url'] as String,
      type: $enumDecode(_$FileTypeOptionEnumMap, json['type']),
    );

Map<String, dynamic> _$$_MediaToJson(_$_Media instance) => <String, dynamic>{
      'url': instance.url,
      'type': _$FileTypeOptionEnumMap[instance.type]!,
    };

const _$FileTypeOptionEnumMap = {
  FileTypeOption.image: 'image',
  FileTypeOption.video: 'video',
  FileTypeOption.document: 'document',
};
