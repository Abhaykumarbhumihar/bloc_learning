import 'package:bloc_learning/common/utils/toast_info.dart';
import 'package:bloc_learning/pages/application/bloc/app_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../common/utils/screenUtils.dart';
import '../../../common_widgets.dart';
import '../../../input_filed_widget.dart';
import '../../../../common/routes/names.dart';
import '../bloc/signin_bloc.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SigninBloc, SigninState>(
      listener: (context, state) {
        // Show error message as a toast when error occurs
        if (state.errorMessage != null) {
         toastInfo(message: state.errorMessage!);
        }

        // If user is authenticated, navigate to the Application page
        if (state.isAuthenticated) {

//          BlocProvider.of<AppBloc>(context).add(TriggerAppEvent(1));
          Navigator.pushNamedAndRemoveUntil(
              context, AppRoutes.APPLICATION, (route) => false);
        }
      },
      child: BlocBuilder<SigninBloc, SigninState>(
        builder: (context, state) {
          return Stack(
            children: [
              Scaffold(
                appBar: buildAppBar("Log in"),
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
                            InputField(
                                text: "Enter your email",
                                hintText: "email",
                                textType: "user",
                                onChanged: (value) {
                                  context
                                      .read<SigninBloc>()
                                      .add(EmailEvent(value));
                                }),
                            SizedBox(
                              height: 12.h,
                            ),
                            resuableText("Password"),
                            InputField(
                                text: "Enter your password",
                                hintText: "password",
                                textType: "password",
                                onChanged: (value) {
                                  context
                                      .read<SigninBloc>()
                                      .add(PasswordEvent(value));
                                }),
                            forgetPassword(),
                            SizedBox(
                              height: ScreenUtils.height(context) * 0.04,
                            ),
                            buildLoginButton("Log In", context, () {
                              context.read<SigninBloc>().add(SubmitLoginEvent());
                            }),
                            SizedBox(
                              height: ScreenUtils.height(context) * 0.02,
                            ),
                            buildLoginButton("Sign Up", context, () {
                              Navigator.of(context).pushNamed(AppRoutes.SIGNUP,
                                  arguments: ["ABHAY KUMAR"]);
                            })
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              // Overlay loader when state is loading
              if (state.isLoading)
                const Center(
                  child: CircularProgressIndicator(),
                ),
            ],
          );
        },
      ),
    );
  }
}
