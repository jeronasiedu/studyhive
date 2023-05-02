import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:studyhive/shared/error/failure.dart';
import 'package:studyhive/src/auth/data/remote/data_sources/auth_remote_data_source.dart';
import 'package:studyhive/src/auth/domain/repositories/auth_repository.dart';
import 'package:studyhive/src/profile/domain/entities/profile.dart';

class AuthRepositoryImpl implements AuthRepository {
  final RemoteDatasourceRepository remoteDatasource;

  AuthRepositoryImpl({required this.remoteDatasource});

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
      final results = await remoteDatasource.save(profile.copyWith(id: userCredential.user!.uid));
      return Right(results);
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
