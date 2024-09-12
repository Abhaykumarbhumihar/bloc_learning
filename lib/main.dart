import 'package:bloc_learning/pages/signin/bloc/signin_bloc.dart';
import 'package:bloc_learning/pages/signin/signin.dart';
import 'package:bloc_learning/pages/welccome/bloc/welcome_bloc.dart';
import 'package:bloc_learning/pages/welccome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyB1F-rdst3N8Zcg03iPfHfZRtIT0Ge-NqA",
      authDomain: "firereal-fffc4.firebaseapp.com",  // Constructed from the project ID
      databaseURL: "https://firereal-fffc4.firebaseio.com",
      projectId: "firereal-fffc4",
      storageBucket: "firereal-fffc4.appspot.com",
      messagingSenderId: "230877096711",  // This would be the project number
      appId: "1:230877096711:android:5be8a76326c7a47ed9b3a2",  // Pick one of the client app IDs
    ),
  );


  runApp(
    MultiBlocProvider(providers: [
        BlocProvider(lazy: false,create: (context)=>WelcomeBloc()),
      BlocProvider(create: (context)=>SigninBloc()),
  ], child:
    ScreenUtilInit(
      builder: (context,child)=> MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            appBarTheme: const AppBarTheme(elevation: 0,backgroundColor: Colors.white)
        ),
        home: const Welcome(),
        routes: {
          "signIn":(context)=>const SignIn()
        },
      ),
    ))

  );
}


