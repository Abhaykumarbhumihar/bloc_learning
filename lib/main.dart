import 'package:bloc_learning/common/routes/names.dart';
import 'package:bloc_learning/common/routes/pages.dart';
import 'package:bloc_learning/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'common/values/colors.dart';

Future<void> main() async {
  await Global.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [...AppPages.allblocProviders(context)],
        child: ScreenUtilInit(
          builder: (context, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                appBarTheme: const AppBarTheme(
                    iconTheme: IconThemeData(
                      color: AppColors.primaryText,
                    ),
                    elevation: 0,
                    backgroundColor: Colors.white)),
            onGenerateRoute: AppPages.GenerateRouteSettingss,
            initialRoute: AppRoutes.SPLASH,
          ),
        ));
  }
}
