import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:studyhive/shared/utils/pick_file.dart';

part 'media.freezed.dart';
part 'media.g.dart';

@freezed
class Media with _$Media {
  const factory Media({
    required String url,
    required FileTypeOption type,
  }) = _Media;
  factory Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);
}
