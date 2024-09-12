import 'package:bloc_learning/pages/signin/bloc/signin_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        } else {
          toastInfo(message: 'you are not a user on this app');
        }
      } on FirebaseAuthException catch (e) {
        switch (e.code) {
          case 'user-not-found':
            toastInfo(message: "Invalid user. Please check your credentials.");
            break;
          case 'wrong-password':
            toastInfo(message: "Incorrect password. Please try again.");
            break;
          case 'invalid-email':
            toastInfo(message: "Invalid email address. Please verify and try again.");
            break;
          case 'too-many-requests':
            toastInfo(message: "Too many requests. Please wait a moment and try again.");
            break;
          case 'user-disabled':
            toastInfo(message: "This user has been disabled. Please contact support.");
            break;
          case 'network-request-failed':
            toastInfo(message: "Network error. Check your internet connection and try again.");
            break;
          case 'operation-not-allowed':
            toastInfo(message: "This operation is not allowed. Please contact support.");
            break;
          default:
            toastInfo(message: "An unknown error occurred. Please try again.");
            break;
        }
      }
    } catch (e) {}
  }
}
