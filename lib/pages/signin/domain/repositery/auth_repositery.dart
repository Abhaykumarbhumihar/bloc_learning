import 'package:bloc_learning/pages/signin/domain/entities/user.dart';

abstract class AuthRepository {
  Future<User?> signIn(String email, String password);
  Future<void> signOut();
  Future<bool> isLoggedIn();
}
