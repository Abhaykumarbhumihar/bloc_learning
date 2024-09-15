part of 'app_bloc.dart';


final class AppState extends Equatable{
  final int index;

 const  AppState({this.index=0});
  @override
  List<Object> get props => [
    index
  ];
}
