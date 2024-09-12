import 'package:bloc_learning/pages/signUp/bloc/sign_up_bloc.dart';
import 'package:bloc_learning/pages/signin/bloc/signin_bloc.dart';
import 'package:bloc_learning/pages/welccome/bloc/welcome_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocProviders{
  static get  allBlocProviders=>[
    BlocProvider(lazy: false,create: (context)=>WelcomeBloc()),
    BlocProvider(create: (context)=>SigninBloc()),
    BlocProvider(create: (context)=>SignUpBloc()),
  ];
}