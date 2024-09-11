import 'package:bloc_learning/pages/welccome/bloc/welcm_state.dart';
import 'package:bloc_learning/pages/welccome/bloc/welcome_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeBloc extends Bloc<WelcomeEvent,WelcomeState>{
  WelcomeBloc():super(WelcomeState()){
    on<WelcomeEvent>((event,emit){
      emit(WelcomeState(page: state.page));
    });
  }
}