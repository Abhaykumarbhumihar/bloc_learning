part of 'sign_up_bloc.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object?> get props => [];
}

// Event for username change
class UsernameChanged extends SignUpEvent {
  final String username;

  const UsernameChanged(this.username);

  @override
  List<Object?> get props => [username];
}

// Event for email change
class EmailChanged extends SignUpEvent {
  final String email;

  const EmailChanged(this.email);

  @override
  List<Object?> get props => [email];
}

// Event for password change
class PasswordChanged extends SignUpEvent {
  final String password;

  const PasswordChanged(this.password);

  @override
  List<Object?> get props => [password];
}

// Event for re-entering the password
class RePasswordChanged extends SignUpEvent {
  final String rePassword;

  const RePasswordChanged(this.rePassword);

  @override
  List<Object?> get props => [rePassword];
}
