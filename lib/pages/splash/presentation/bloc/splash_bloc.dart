import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';
import 'package:bloc_learning/global.dart';
import 'package:bloc_learning/common/values/constant.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<AppStarted>(_onAppStarted);
  }

  Future<void> _onAppStarted(AppStarted event, Emitter<SplashState> emit) async {
    // Simulate a delay for the splash screen (5 seconds)
    await Future.delayed(Duration(seconds: 5));

    // Check if the user is logged in
    bool isUserLoggedIn =true;
       // Global.storageService.getString(AppConstant.TOKEN) != null;

    if (isUserLoggedIn) {
      // Navigate to the application if user is logged in
      emit(NavigateToApplication());
    } else {
      // Otherwise, navigate to the login page
      emit(NavigateToLogin());
    }
  }
}