import 'dart:developer';

import 'package:cinebox/core/result/result.dart';
import 'package:google_sign_in/google_sign_in.dart';

import './google_signin_service.dart';

class GoogleSigninServiceImpl implements GoogleSigninService {
  @override
  Future<Result<String>> isSignIn() async {
    try {
      final logged = await GoogleSignIn.instance
          .attemptLightweightAuthentication();

      if (logged case GoogleSignInAuthentication(:final idToken?)) {
        return Success(idToken);
      }

      return Failure(Exception('User is not signed in'));
    } catch (err, stackTrace) {
      log(
        'Error checking Google sign-in status',
        name: 'GoogleSigninService',
        error: err,
        stackTrace: stackTrace,
      );
      return Failure(Exception('Failed to check sign-in status'));
    }
  }

  @override
  Future<Result<String>> signIn() async {
    try {
      final auth = await GoogleSignIn.instance.authenticate(
        scopeHint: ['email', 'profile', 'openid'],
      );

      if (auth.authentication case GoogleSignInAuthentication(
        :final idToken?,
      )) {
        return Success(idToken);
      }

      return Failure(Exception('Failed to sign in with Google'));
    } catch (err, stackTrace) {
      log(
        'Error signing in with Google',
        name: 'GoogleSigninService',
        error: err,
        stackTrace: stackTrace,
      );
      return Failure(Exception('Failed to sign in with Google'));
    }
  }

  @override
  Future<Result<Unit>> signOut() async {
    try {
      await GoogleSignIn.instance.signOut();
      return successOfUnit();
    } catch (err, stackTrace) {
      log(
        'Error signing out from Google',
        name: 'GoogleSigninService',
        error: err,
        stackTrace: stackTrace,
      );
      return Failure(Exception('Failed to sign out from Google'));
    }
  }
}
