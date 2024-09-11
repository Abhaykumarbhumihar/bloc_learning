import 'package:equatable/equatable.dart';

class WelcomeEvent extends Equatable{
  int page;
  WelcomeEvent(this.page);
  @override
  List<Object?> get props =>[page];

}