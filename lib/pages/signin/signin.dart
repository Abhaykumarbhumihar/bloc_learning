import 'package:bloc_learning/pages/signin/bloc/signin_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/screenUtils.dart';
import 'widgets/sign_in_wid.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SigninBloc, SigninState>(builder: (context, state) {
      return Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            appBar: buildAppBar(),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  socialLogin(context),
                  SizedBox(
                    height: ScreenUtils.height(context) * 0.03,
                  ),
                  Center(
                      child: resuableText("Or use your email account login")),
                  Container(
                    margin: EdgeInsets.only(top: 66.h),
                    padding: EdgeInsets.only(left: 25.w, right: 18.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        resuableText("Email"),
                        buildInputField("Enter your email", "email", "user",
                            (value) {
                          context.read<SigninBloc>().add(EmailEvent(value));
                        }),
                        SizedBox(
                          height: 12.h,
                        ),
                        resuableText("Password"),
                        buildInputField(
                            "Enter your passwrod", "password", "password",
                            (value) {
                          context.read<SigninBloc>().add(PasswordEvent(value));
                        }),
                        forgetPassword(),
                        SizedBox(
                          height: ScreenUtils.height(context) * 0.04,
                        ),
                        buildLoginButton("Log In", context),
                        SizedBox(
                          height: ScreenUtils.height(context) * 0.02,
                        ),
                        buildLoginButton("Sign Up", context)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
