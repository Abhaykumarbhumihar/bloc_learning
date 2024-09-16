import 'package:bloc_learning/pages/signUp/domain/repositery/signup_repositery.dart';

import '../../../signin/domain/entities/user.dart';

class SignUpUseCase{
  final SignUpRepositery repositery;
  SignUpUseCase(this.repositery);

  Future<User?>executeSignUp(String email,String password,String userName){
    return repositery.signUp(email, password, userName);
  }
}