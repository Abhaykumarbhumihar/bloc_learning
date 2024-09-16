import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'app_event.dart';

part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppState()) {
    on<TriggerAppEvent>(triggerAppEvet);
  }

  Future<void> triggerAppEvet(
      TriggerAppEvent event, Emitter<AppState> emit) async {
    emit(AppState(index: event.index));
  }
}
