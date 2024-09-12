import 'package:bloc_learning/pages/signUp/bloc/sign_up_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/utils/toast_info.dart';

class SignUpController {
  final BuildContext context;
  const SignUpController(this.context);

  Future<void> handleEmailRegister() async {
    final state = context.read<SignUpBloc>().state;
    String userName = state.username;
    String email = state.email;
    String password = state.password;
    String rePasswrod = state.rePassword;

    if (userName.isEmpty) {
      print("Username cannot be empty");
      return;
    }

    if (email.isEmpty) {
      print("Email cannot be empty");
      return;
    }

    if (password.isEmpty) {
      print("Password cannot be empty");
      return;
    }

    if (rePasswrod.isEmpty) {
      print("Re-entered password cannot be empty");
      return;
    }

    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if(credential.user!=null){
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(userName);
        toastInfo(message: "An email has been sent to your registered email. To activate it please check your email");
        Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          toastInfo(message: "This email is already in use. Please try another.");
          break;
        case 'invalid-email':
          toastInfo(message: "The email address is invalid. Please check and try again.");
          break;
        case 'user-token-expired':
          toastInfo(message: "Your session has expired. Please log in again.");
          break;
        case 'too-many-requests':
          toastInfo(message: "Too many requests. Please try again later.");
          break;
        case 'weak-password':
          toastInfo(message: "Your password is too weak. Please choose a stronger password.");
          break;
        case 'network-request-failed':
          toastInfo(message: "Network error. Please check your internet connection and try again.");
          break;
        case 'operation-not-allowed':
          toastInfo(message: "This operation is not allowed. Please contact support.");
          break;
        default:
          toastInfo(message: "An unknown error occurred. Please try again.");
          break;
      }
    }
  }
}
