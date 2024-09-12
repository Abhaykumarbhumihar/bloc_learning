import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(const SignUpState()) {
    on<UsernameChanged>(usernameChangedEvent);
    on<EmailChanged>(emailChangedEvent);
    on<PasswordChanged>(passwordChangedEvent);
    on<RePasswordChanged>(rePasswordChangedEvent);
  }

  Future<void> usernameChangedEvent(
      UsernameChanged event, Emitter<SignUpState> emit) async {
    emit(state.copyWith(username: event.username));
  }

  Future<void> emailChangedEvent(
      EmailChanged event, Emitter<SignUpState> emit) async {
    emit(state.copyWith(email: event.email));
  }

  Future<void> passwordChangedEvent(
      PasswordChanged event, Emitter<SignUpState> emit) async {
    emit(state.copyWith(password: event.password));
  }

  Future<void> rePasswordChangedEvent(
      RePasswordChanged event, Emitter<SignUpState> emit) async {
    emit(state.copyWith(rePassword: event.rePassword));
  }
}
