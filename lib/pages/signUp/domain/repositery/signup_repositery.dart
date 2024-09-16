import '../../../signin/domain/entities/user.dart';

abstract class SignUpRepositery{
  Future<User?>signUp(String email,String password,String userName);

}