import 'package:bloc_learning/pages/signin/bloc/signin_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInController {
  final BuildContext context;

  const SignInController({required this.context});

  Future<void> handleSignIn(String type) async {
    try {
      final state = context.read<SigninBloc>().state;
      String emailAddress = state.email;
      String password = state.passwrod;
      if (emailAddress.isEmpty) {}
      if (password.isEmpty) {}

      try {
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: emailAddress, password: password);
        if(credential.user==null){

        }
        if(!credential.user!.emailVerified){

        }
        var user=credential.user;
        if(user!=null){

        }else{

        }

      } catch (e) {}
    } catch (e) {}
  }
}
