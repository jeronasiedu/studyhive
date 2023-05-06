import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:studyhive/shared/error/failure.dart';
import 'package:studyhive/src/auth/domain/repositories/auth_repository.dart';
import 'package:studyhive/src/profile/data/local/data_sources/profile_local_database.dart';
import 'package:studyhive/src/profile/data/remote/data_sources/profile_remote_database.dart';

import '../../../../shared/network/network.dart';
import '../../../profile/domain/entities/profile.dart';

class AuthRepositoryImpl implements AuthRepository {
  final ProfileRemoteDatabase remoteDatabase;
  final ProfileLocalDatabase localDatabase;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({required this.remoteDatabase, required this.localDatabase, required this.networkInfo});

  @override
  Future<Either<Failure, bool>> continueWithApple(Profile profile) async {
    // TODO: implement continueWithApple
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> continueWithGoogle(Profile profile) async {
    // create an account with
    try {
      if (!await networkInfo.hasInternet()) {
        return const Left(Failure("No internet connection"));
      }

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
      final userExists = await remoteDatabase.exists(copiedProfile.id);
      if (userExists) {
        final appUser = await remoteDatabase.retrieve(copiedProfile.id);
        await localDatabase.save(appUser);
      } else {
        await remoteDatabase.save(copiedProfile);
        await localDatabase.save(copiedProfile);
      }
      return Right(userExists);
    } catch (error) {
      return Left(Failure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> continueWithPhone(Profile profile) async {
    try {
      if (!await networkInfo.hasInternet()) {
        return const Left(Failure("No internet connection"));
      }

      final userExists = await remoteDatabase.exists(profile.id);
      if (userExists) {
        final appUser = await remoteDatabase.retrieve(profile.id);
        await localDatabase.save(appUser);
      } else {
        await remoteDatabase.save(profile);
        await localDatabase.save(profile);
      }
      return Right(userExists);
    } catch (error) {
      return Left(Failure(error.toString()));
    }
  }
}
