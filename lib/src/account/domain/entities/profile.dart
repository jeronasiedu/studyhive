import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.freezed.dart';
part 'profile.g.dart';

@freezed
class Profile with _$Profile {
  const factory Profile({
    required String id,
    required String name,
    required String email,
    String? photoUrl,
    String? bio,
    String? school,
    String? phoneNumber,
  }) = _Profile;

  factory Profile.fromJson(Map<String, dynamic> json) => _$ProfileFromJson(json);

  factory Profile.empty() => const Profile(
        id: '',
        name: '',
        email: '',
      );
}
