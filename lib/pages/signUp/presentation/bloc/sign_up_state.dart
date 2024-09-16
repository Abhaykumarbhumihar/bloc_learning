part of 'sign_up_bloc.dart';


class SignUpState extends Equatable {
  final String username;
  final String email;
  final String password;
  final String rePassword;
  final bool isLoading;
  final String errorMessage;

  const SignUpState(
      {this.username = '',
        this.email = '',
        this.password = '',
        this.rePassword = '',
        this.isLoading=false,
      this.errorMessage=''});

  SignUpState copyWith(
      {String? username, String? email, String? password, String? rePassword, bool? isLoading,String? errorMessage}) {
    return SignUpState(
        username: username ?? this.username,
        email: email ?? this.email,
        password: password ?? this.password,
        rePassword: rePassword ?? this.rePassword,
       errorMessage: errorMessage??this.errorMessage,
      isLoading: isLoading??this.isLoading
      );
  }

  @override
  List<Object> get props => [email,username,password,rePassword,errorMessage,isLoading];
}