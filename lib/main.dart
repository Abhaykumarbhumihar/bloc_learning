import 'package:bloc_learning/pages/application/application.dart';
import 'package:bloc_learning/pages/bloc_providers.dart';
import 'package:bloc_learning/pages/signUp/sign_up.dart';
import 'package:bloc_learning/pages/signin/signin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'common/values/colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyB1F-rdst3N8Zcg03iPfHfZRtIT0Ge-NqA",
      authDomain: "firereal-fffc4.firebaseapp.com",
      // Constructed from the project ID
      databaseURL: "https://firereal-fffc4.firebaseio.com",
      projectId: "firereal-fffc4",
      storageBucket: "firereal-fffc4.appspot.com",
      messagingSenderId: "230877096711",
      // This would be the project number
      appId:
          "1:230877096711:android:5be8a76326c7a47ed9b3a2", // Pick one of the client app IDs
    ),
  );

  runApp(MultiBlocProvider(
      providers: AppBlocProviders.allBlocProviders,
      child: ScreenUtilInit(
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              appBarTheme: const AppBarTheme(
                iconTheme: IconThemeData(
                  color: AppColors.primaryText,
                ),
                  elevation: 0, backgroundColor: Colors.white)),
          home: const ApplicationPage(),
          routes: {
            "signIn": (context) => const SignIn(),
            "register":(context)=>SignUp(),
          },
        ),
      )));
}
