import 'package:bloc_learning/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/screenUtils.dart';

AppBar buildAppBar() {
  return AppBar(
    centerTitle: true,
    title: Text(
      "Log In",
      style: TextStyle(
          color: AppColors.primaryText,
          fontWeight: FontWeight.normal,
          fontSize: 14.sp),
    ),
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1.0),
      child: Container(
        color: AppColors.primary_bg.withOpacity(0.1),
        height: 1.0,
      ),
    ),
  );
}

Widget socialLogin(BuildContext context) {
  return Container(
    padding: EdgeInsets.only(top: 30.h),
    width: 375.w,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        socialImage("assets/google.png", () {}),
        socialImage("assets/apple_icon.png", () {}),
        socialImage("assets/facebook.png", () {}),
      ],
    ),
  );
}

Widget socialImage(imagePath, Function() func) {
  return GestureDetector(
    onTap: func,
    child: Container(
      width: 30.w,
      height: 30.w,
      child: Image.asset(imagePath),
    ),
  );
}

Widget resuableText(String text) {
  return Container(
    margin: EdgeInsets.only(bottom: 2.h, top: 5.h),
    child: Text(
      text,
      style: TextStyle(
        color: Colors.grey.withOpacity(0.5),
        fontWeight: FontWeight.normal,
        fontSize: 14.sp,
      ),
    ),
  );
}

Widget buildInputField(String text, String hinttext, String texttype) {
  bool obscureText = true;
  return Container(
    width: 325.h,
    padding: EdgeInsets.only(left: 4.w),
    margin: EdgeInsets.zero,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13.w),
        border: Border.all(color: Colors.black)),
    child: Row(
      children: <Widget>[
        Center(
          child: Container(
            child: Icon(
              texttype == "user" ? Icons.account_circle_outlined : Icons.lock,
            ),
          ),
        ),
        Container(
          width: 260.w,
          height: 50.h,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            autocorrect: false,
            obscureText: texttype == "password" ? true : false,
            decoration: InputDecoration(
                isDense: true,
                hintText: hinttext,
                suffixIcon: texttype == "password"
                    ? GestureDetector(
                        onTap: () {
                          obscureText = !obscureText;
                        },
                        child: Icon(
                          obscureText ? Icons.visibility_off : Icons.visibility,
                          color: Colors.black38,
                          size: 22.h,
                        ),
                      )
                    : const SizedBox.shrink(),
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)),
                disabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)),
                hintStyle: const TextStyle(color: Colors.grey)),
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontSize: 14.sp),
          ),
        )
      ],
    ),
  );
}

Widget forgetPassword() {
  return Container(
      width: 260.w,
      height: 44.h,
      margin: EdgeInsets.only(left: 8.h, top: 16.h),
      child: GestureDetector(
        onTap: () {},
        child: Text(
          "Forgot password",
          style: TextStyle(
              color: Colors.black,
              decoration: TextDecoration.underline,
              decorationColor: Colors.blue,
              decorationThickness: 1.h),
        ),
      ));
}

Widget buildLoginButton(String buttonName, BuildContext context) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      margin: EdgeInsets.only(
          top: ScreenUtils.height(context) * 0.002,
          left: ScreenUtils.width(context) * 0.03,
          right: ScreenUtils.height(context) * 0.03),
      width: ScreenUtils.width(context),
      height: ScreenUtils.height(context) * 0.08,
      decoration: BoxDecoration(
          color: buttonName == "Sign Up"
              ? AppColors.primaryBackground
              : AppColors.primaryElement,
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(
              color: buttonName == "Sign Up"
                  ? Colors.black38
                  : Colors.transparent),
          boxShadow: [
            BoxShadow(
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(0, 1),
                color: Colors.grey.withOpacity(0.1))
          ]),
      child: Center(
        child: Text(
          buttonName,
          style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.normal,
              color: buttonName == "Sign Up"
                  ? AppColors.primaryText
                  : AppColors.primaryBackground),
        ),
      ),
    ),
  );
}
