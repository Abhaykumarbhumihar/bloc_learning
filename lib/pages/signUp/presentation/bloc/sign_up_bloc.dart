import 'package:bloc/bloc.dart';
import 'package:bloc_learning/pages/signin/presentation/bloc/signin_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../signin/domain/entities/user.dart';
import '../../domain/usecases/sign_up_usecase.dart';
part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUpUseCase signUpUseCase;
  SignUpBloc(this.signUpUseCase) : super(SignUpState()) {
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
  Future<void>submitSignUp(SubmitSignUpEvent event,Emitter<SignUpState>emit)async{
    final email = state.email;
    final password = state.password;
    final userName=state.username;
    if(userName.isEmpty){
      emit(state.copyWith(errorMessage: 'Please enter your username.'));
      return;
    }
    if (email.isEmpty) {
      emit(state.copyWith(errorMessage: 'Please enter your email.'));
      return;
    }
    if (password.isEmpty) {
      emit(state.copyWith(errorMessage: 'Please enter your password.'));
      return;
    }

    emit(state.copyWith(isLoading: true, errorMessage: null));

    try{
      final User? user = await signUpUseCase.executeSignUp(email, password,userName);
      if (user != null) {
        print("1");
        emit(state.copyWith(isLoading: false,errorMessage: "An email has been sent to your registered email. To activate it please check your email"));
      } else {
        print("2");
        emit(state.copyWith(isLoading: false, errorMessage: 'Login failed. Please try again.'));
      }
    }catch(e){
      emit(state.copyWith(isLoading: false, errorMessage: ' ${e.toString()}'));

    }

  }
}
