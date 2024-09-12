part of 'sign_up_bloc.dart';

class SignUpState extends Equatable {
  final String username;
  final String email;
  final String password;
  final String rePassword;
  const SignUpState(
      {this.username = '',
      this.email = '',
      this.password = '',
      this.rePassword = ''});

  SignUpState copyWith(
      {String? username, String? email, String? password, String? rePassword}) {
    return SignUpState(
        username: username ?? this.username,
        email: email ?? this.email,
        password: password ?? this.password,
        rePassword: rePassword ?? this.rePassword);
  }

  @override
  List<Object> get props => [email,username,password,rePassword];
}
