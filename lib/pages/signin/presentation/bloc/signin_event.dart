part of 'signin_bloc.dart';

abstract class SigninEvent extends Equatable {
  const SigninEvent();
}

class EmailEvent extends SigninEvent{
  final String email;
  const EmailEvent(this.email);
  @override
  List<Object?> get props => [email];
}

class PasswordEvent extends SigninEvent{
  final String password;
  const PasswordEvent(this.password);
  @override
  List<Object?> get props => [password];
}

class SubmitLoginEvent extends SigninEvent {
  const SubmitLoginEvent();

  @override
  List<Object?> get props => [];
}
