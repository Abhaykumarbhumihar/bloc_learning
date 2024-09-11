import 'package:bloc_learning/pages/signin/signin.dart';
import 'package:bloc_learning/pages/welccome/bloc/welcome_bloc.dart';
import 'package:bloc_learning/pages/welccome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(
    BlocProvider(create: (context)=>WelcomeBloc(),
    child: ScreenUtilInit(
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
    ),),

  );
}


