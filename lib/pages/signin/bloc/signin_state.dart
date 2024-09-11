part of 'signin_bloc.dart';

final class SigninState extends Equatable {
  final String email;
  final String passwrod;

  SigninState({this.email = '', this.passwrod = ''});

  SigninState copyWith({String? email, String? passwrod}) {
    return SigninState(
        email: email ?? this.email, passwrod: passwrod ?? this.passwrod);
  }


  @override
  List<Object> get props => [email, passwrod];
}
