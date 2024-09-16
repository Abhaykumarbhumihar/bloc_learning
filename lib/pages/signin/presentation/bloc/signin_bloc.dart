import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../common/utils/toast_info.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/sign_in_usecase.dart';


part 'signin_event.dart';

part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  final SignInUseCase signInUseCase;

  SigninBloc(this.signInUseCase) : super(SigninState()) {
    on<EmailEvent>(emailEvent);
    on<PasswordEvent>(passwordEvent);
    on<SubmitLoginEvent>(submitLoginEvent);
  }

  Future<void> emailEvent(EmailEvent event, Emitter<SigninState> emit) async {
    emit(state.copyWith(email: event.email));
  }

  Future<void> passwordEvent(PasswordEvent event, Emitter<SigninState> emit) async {
    emit(state.copyWith(password: event.password));
  }

  Future<void> submitLoginEvent(SubmitLoginEvent event, Emitter<SigninState> emit) async {
    final email = state.email;
    final password = state.password;

    // Check if the u ser has entered email and password
    if (email.isEmpty) {
      emit(state.copyWith(errorMessage: 'Please enter your email.'));
      return;
    }
    if (password.isEmpty) {
      emit(state.copyWith(errorMessage: 'Please enter your password.'));
      return;
    }

    // Start loading
    emit(state.copyWith(isLoading: true, errorMessage: null));

    try {
      final User? user = await signInUseCase.execute(email, password);
      if (user != null) {
        print("1");
        emit(state.copyWith(isAuthenticated: true, isLoading: false));
      } else {
        print("2");
        emit(state.copyWith(isLoading: false, errorMessage: 'Login failed. Please try again.'));
      }
    } catch (e) {
      print("3");
      emit(state.copyWith(isLoading: false, errorMessage: ' ${e.toString()}'));
    }
  }
}
