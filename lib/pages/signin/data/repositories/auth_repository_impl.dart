import 'package:firebase_auth/firebase_auth.dart' as firebase;
import '../../domain/entities/user.dart';
import '../../domain/repositery/auth_repositery.dart';

class AuthRepositoryImpl implements AuthRepository {
  final firebase.FirebaseAuth firebaseAuth;

  AuthRepositoryImpl(this.firebaseAuth);

  @override
  Future<User?> signIn(String email, String password) async {
    try {
      final credential = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      final firebase.User? firebaseUser = credential.user;

      if (firebaseUser != null && firebaseUser.emailVerified) {
        return User(
          id: firebaseUser.uid,
          email: firebaseUser.email!,
          isEmailVerified: firebaseUser.emailVerified,
        );
      } else {
        // Handle case when email is not verified
        return Future.error('Email not verified. Please verify your email.');
      }
    } on firebase.FirebaseAuthException catch (e) {
      return Future.error(_handleFirebaseAuthError(e));
    }
    return null;
  }

  @override
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  @override
  Future<bool> isLoggedIn() async {
    final user = firebaseAuth.currentUser;
    return user != null && user.emailVerified;
  }

  // Helper function to handle FirebaseAuth errors
  String _handleFirebaseAuthError(firebase.FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        return 'The email address is not valid. Please enter a correct email.';
      case 'user-disabled':
        return 'This user account has been disabled.';
      case 'user-not-found':
        return 'No user found for that email.';
      case 'wrong-password':
        return 'Incorrect password. Please try again.';
      case 'too-many-requests':
        return 'Too many login attempts. Please try again later.';
      case 'operation-not-allowed':
        return 'This operation is not allowed. Please contact support.';
      default:
        return 'An unknown error occurred. Please try again later.';
    }
  }
}
