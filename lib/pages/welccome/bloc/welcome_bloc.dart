import 'package:bloc_learning/pages/welccome/bloc/welcm_state.dart';
import 'package:bloc_learning/pages/welccome/bloc/welcome_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeBloc extends Bloc<WelcomeEvent,WelcomeState>{
  final pageController=PageController(initialPage: 0);
  WelcomeBloc():super(WelcomeState()){
    on<WelcomeEvent>((event,emit){
      emit(WelcomeState(page: event.page));
    });
  }
}