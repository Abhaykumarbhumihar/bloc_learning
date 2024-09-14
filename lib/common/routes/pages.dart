import 'package:bloc_learning/common/routes/routes.dart';
import 'package:bloc_learning/pages/signUp/bloc/sign_up_bloc.dart';
import 'package:bloc_learning/pages/signUp/sign_up.dart';
import 'package:bloc_learning/pages/signin/bloc/signin_bloc.dart';
import 'package:bloc_learning/pages/signin/signin.dart';
import 'package:bloc_learning/pages/welccome/bloc/welcome_bloc.dart';
import 'package:bloc_learning/pages/welccome/welcome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
        route: AppRoutes.INITIAL,
        page: Welcome(),
        bloc: BlocProvider(
          create: (_) => WelcomeBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.SIGNIN,
        page: SignIn(),
        bloc: BlocProvider(
          create: (_) => SigninBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.SIGNUP,
        page: SignUp(),
        bloc: BlocProvider(
          create: (_) => SignUpBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.APPLICATION,
        page: SignUp(),
        bloc: null,
      ),
    ];
  }

  static List<dynamic> allblocProviders(BuildContext context) {
    List<dynamic> blocProvider = <dynamic>[];
    for (var blocEntity in routes()) {
      if (blocEntity.bloc != null){
        blocProvider.add(blocEntity.bloc);
      }

    }
    return blocProvider;
  }

  static MaterialPageRoute GenerateRouteSettingss(RouteSettings settings){
    if(settings.name!=null){
      var result=routes().where((element) => element.route==settings.name);
      if(result.isNotEmpty){
        print("valid route name ${settings.name} ${settings.arguments}");

        return MaterialPageRoute(builder: (_)=>result.first.page,settings: settings);
      }
    }
    print("In valid route name ${settings.name}");
    return MaterialPageRoute(builder: (_)=>SignIn());
  }
}

//unify BLocProvider and routes and pages

class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({required this.page, this.bloc, required this.route});
}
