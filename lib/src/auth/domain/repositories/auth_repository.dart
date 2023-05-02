import '../../../profile/domain/entities/profile.dart';

abstract class AuthRepository {
  Future<Profile> continueWithGoogle(Profile profile);

  Future<Profile> continueWithApple(Profile profile);

  Future<Profile> continueWithPhone(Profile profile);
}
