import 'package:bloc_learning/common/routes/routes.dart';
import 'package:bloc_learning/common/values/constant.dart';
import 'package:bloc_learning/global.dart';
import 'package:bloc_learning/pages/application/application.dart';
import 'package:bloc_learning/pages/application/bloc/app_bloc.dart';
import 'package:bloc_learning/pages/product/presentation/bloc/product_bloc.dart';
import 'package:bloc_learning/pages/product/presentation/ui/produt_list.dart';
import 'package:bloc_learning/pages/signUp/presentation/bloc/sign_up_bloc.dart';
import 'package:bloc_learning/pages/signUp/presentation/ui/sign_up.dart';
import 'package:bloc_learning/pages/signin/presentation/ui/signin.dart';
import 'package:bloc_learning/pages/welccome/bloc/welcome_bloc.dart';
import 'package:bloc_learning/pages/welccome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../pages/signin/presentation/bloc/signin_bloc.dart';
import '../../service_locator.dart';
import 'names.dart';

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
          create: (_) => getIt<SigninBloc>(),
        ),
      ),
      PageEntity(
        route: AppRoutes.SIGNUP,
        page: SignUp(),
        bloc: BlocProvider(
          create: (_) => getIt<SignUpBloc>(),
        ),
      ),
      PageEntity(
        route: AppRoutes.APPLICATION,
        page: ApplicationPage(),
        bloc: BlocProvider(create: (_) => AppBloc()),
      ),
      PageEntity(
          route: AppRoutes.PRODUCT,
          page: Product(),
          bloc: BlocProvider(
            create: (_) => getIt<ProductBloc>()..add(FetchProduct()),
          ))
    ];
  }

  static List<dynamic> allblocProviders(BuildContext context) {
    List<dynamic> blocProvider = <dynamic>[];
    for (var blocEntity in routes()) {
      if (blocEntity.bloc != null) {
        blocProvider.add(blocEntity.bloc);
      }
    }
    return blocProvider;
  }

  static MaterialPageRoute GenerateRouteSettingss(RouteSettings settings) {
    if (settings.name != null) {
      var result = routes().where((element) => element.route == settings.name);
      if (result.isNotEmpty) {
        print("valid route name ${settings.name} ${settings.arguments}");
        bool isIntroComplete =
            Global.storageService.getBool(AppConstant.INTRO_COMPLETE);
        if (result.first.route == AppRoutes.INITIAL && isIntroComplete) {
          return MaterialPageRoute(
              builder: (_) => SignIn(), settings: settings);
        }
        return MaterialPageRoute(
            builder: (_) => result.first.page, settings: settings);
      }
    }
    print("In valid route name ${settings.name}");
    return MaterialPageRoute(builder: (_) => SignIn());
  }
}

//unify BLocProvider and routes and pages

class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({required this.page, this.bloc, required this.route});
}
