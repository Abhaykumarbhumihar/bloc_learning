import 'package:bloc_learning/pages/signin/bloc/signin_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/routes/names.dart';
import '../../common/utils/toast_info.dart';

class SignInController {
  final BuildContext context;

  const SignInController({required this.context});

  Future<void> handleSignIn(String type) async {
    try {
      final state = context.read<SigninBloc>().state;
      String emailAddress = state.email;
      String password = state.passwrod;
      if (emailAddress.isEmpty) {
        toastInfo(message: 'enter email');
        return;
      }
      if (password.isEmpty) {
        toastInfo(message: 'enter password');
        return;
      }

      try {
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: emailAddress, password: password);

        if (!credential.user!.emailVerified) {
          toastInfo(message: "You need to verify your email account");
          return;
        }

        var user = credential.user;
        if (user != null) {
          print(user);
          Navigator.pushNamedAndRemoveUntil(
              context, AppRoutes.APPLICATION, (route) => false);
        } else {
          toastInfo(message: 'you are not a user on this app');
        }
      } on FirebaseAuthException catch (e) {
        switch (e.code) {
          case 'user-not-found':
            toastInfo(message: "Invalid user. Please check your credentials.");
            break;

        }
      }
    } catch (_) {}
  }
}
