import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../common/utils/screenUtils.dart';
import '../../../common_widgets.dart';
import '../../../input_filed_widget.dart';
import '../bloc/sign_up_bloc.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(builder: (context, state) {
      return Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            appBar: buildAppBar("Sign Up"),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: ScreenUtils.height(context) * 0.01,
                  ),
                  Center(
                      child: resuableText(
                          "Enter your details below & free sign up")),
                  Container(
                    margin: EdgeInsets.only(
                        top: ScreenUtils.height(context) * 0.08),
                    padding: EdgeInsets.only(left: 25.w, right: 18.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        resuableText("User name"),
                        InputField(
                            text: "Enter your user name",
                            hintText: "user",
                            textType: "user",
                            onChanged: (value) {
                              context
                                  .read<SignUpBloc>()
                                  .add(UsernameChanged(value));
                            }),
                        SizedBox(
                          height: 12.h,
                        ),
                        resuableText("Email"),
                        InputField(
                            text: "Enter your email",
                            hintText: "email",
                            textType: "user",
                            onChanged: (value) {
                              context
                                  .read<SignUpBloc>()
                                  .add(EmailChanged(value));
                            }),
                        SizedBox(
                          height: 12.h,
                        ),
                        resuableText("Password"),
                        InputField(
                            text: "Enter your passwrod",
                            hintText: "password",
                            textType: "password",
                            onChanged: (value) {
                              context
                                  .read<SignUpBloc>()
                                  .add(PasswordChanged(value));
                            }),
                        SizedBox(
                          height: 12.h,
                        ),
                        resuableText("Confirm password"),
                        InputField(
                            text: "Enter your confirm passwrod",
                            hintText: "confirm password",
                            textType: "password",
                            onChanged: (value) {
                              context
                                  .read<SignUpBloc>()
                                  .add(RePasswordChanged(value));
                            }),
                        SizedBox(
                          height: ScreenUtils.height(context) * 0.01,
                        ),
                        Center(
                            child: resuableText(
                                "By creating an account you have to agree with our term & condition")),
                        SizedBox(
                          height: ScreenUtils.height(context) * 0.04,
                        ),
                        buildLoginButton("Sign Up ", context, () {
                          context.read<SignUpBloc>().add(SubmitSignUpEvent());
                        }),
                        SizedBox(
                          height: ScreenUtils.height(context) * 0.03,
                        ),
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
