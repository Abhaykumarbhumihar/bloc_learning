part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

}


class TriggerAppEvent extends AppEvent{
  final int index;
  TriggerAppEvent(this.index):super();

  @override
  List<Object?> get props => [index];
}