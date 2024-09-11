import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'signin_event.dart';

part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  SigninBloc() : super(SigninState()) {
    on<EmailEvent>(emailEvent);
    on<PasswordEvent>(passwordEvent);
  }

  Future<void> emailEvent(EmailEvent event, Emitter<SigninState> emit) async {
    emit(state.copyWith(email: event.email));
  }

  Future<void> passwordEvent(
      PasswordEvent event, Emitter<SigninState> emit) async {
    emit(state.copyWith(passwrod: event.password));
  }
}
