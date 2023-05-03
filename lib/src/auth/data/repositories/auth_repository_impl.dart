import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:studyhive/shared/error/failure.dart';
import 'package:studyhive/src/auth/data/remote/data_sources/auth_remote_database.dart';
import 'package:studyhive/src/auth/domain/repositories/auth_repository.dart';
import 'package:studyhive/src/profile/domain/entities/profile.dart';

import '../local/data_sources/auth_local_database.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatabase remoteDatabase;
  final AuthLocalDatabase localDatabase;

  AuthRepositoryImpl({required this.remoteDatabase, required this.localDatabase});

  @override
  Future<Either<Failure, Profile>> continueWithApple(Profile profile) async {
    // TODO: implement continueWithApple
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> continueWithGoogle(Profile profile) async {
    // create an account with
    try {
      GoogleSignInAccount? googleSignInAccount = await GoogleSignIn().signIn();
      // Get the GoogleSignInAuthentication
      GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!.authentication;

      // Create the credential
      OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      // Sign in with the credential
      UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      final copiedProfile = profile.copyWith(
        id: userCredential.user!.uid,
        email: userCredential.user!.email!,
        name: userCredential.user!.displayName!,
        photoUrl: userCredential.user!.photoURL,
      );
      await remoteDatabase.save(copiedProfile);
      await localDatabase.save(copiedProfile);

      return const Right(null);
    } catch (error) {
      return Left(Failure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, Profile>> continueWithPhone(Profile profile) async {
    // TODO: implement continueWithPhone
    throw UnimplementedError();
  }
}
