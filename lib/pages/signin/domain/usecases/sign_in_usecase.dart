// lib/domain/usecases/sign_in_usecase.dart
import '../entities/user.dart';
import '../repositery/auth_repositery.dart';

class SignInUseCase {
  final AuthRepository repository;

  SignInUseCase(this.repository);

  Future<User?> execute(String email, String password) {
    return repository.signIn(email, password);
  }
}
