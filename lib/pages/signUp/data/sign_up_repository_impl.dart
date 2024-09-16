import 'package:bloc_learning/pages/signin/domain/entities/user.dart';

import '../domain/repositery/signup_repositery.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;

class SignUpRepositeryImple implements SignUpRepositery {
  final firebase.FirebaseAuth firebaseAuth;

  SignUpRepositeryImple(this.firebaseAuth);

  @override
  Future<User?> signUp(String email, String password, String userName) async {
    try {
      final credential = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      final firebase.User? firebaseUser = credential.user;

      if (firebaseUser != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(userName);
        return User(id: firebaseUser.uid, email: email, isEmailVerified: false);
      }
    } on firebase.FirebaseAuthException catch (e) {
      _handleFirebaseAuthError(e);
    }
  }

  String _handleFirebaseAuthError(firebase.FirebaseAuthException e) {
    switch (e.code) {
      case 'email-already-in-use':
        return "This email is already in use. Please try another.";
      case 'invalid-email':
        return "The email address is invalid. Please check and try again.";
      case 'user-token-expired':
        return "Your session has expired. Please log in again.";
      case 'too-many-requests':
        return "Too many requests. Please try again later.";
      case 'weak-password':
        return "Your password is too weak. Please choose a stronger password.";
      case 'network-request-failed':
        return "Network error. Please check your internet connection and try again.";
      case 'operation-not-allowed':
        return "This operation is not allowed. Please contact support.";
      default:
        return "An unknown error occurred. Please try again.";
    }
  }
}
