import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../common/routes/names.dart';
import '../bloc/splash_bloc.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state is NavigateToLogin) {
          Navigator.pushReplacementNamed(context, AppRoutes.SIGNIN);
        } else if (state is NavigateToApplication) {
          Navigator.pushReplacementNamed(context, AppRoutes.APPLICATION);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Image.asset(
            'assets/images/logo.png', // Your logo image
            width: 150,
            height: 150,
          ),
        ),
      ),
    );
  }
}
