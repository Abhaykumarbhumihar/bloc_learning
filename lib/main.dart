
import 'package:bloc_learning/pages/welccome/bloc/welcome_bloc.dart';
import 'package:bloc_learning/pages/welccome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(
    BlocProvider(create: (context)=>WelcomeBloc(),
    child: ScreenUtilInit(
      builder: (context,child)=>const MaterialApp(
        home: Welcome(),
      ),
    ),),

  );
}


