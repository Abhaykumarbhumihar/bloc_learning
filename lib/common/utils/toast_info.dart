import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

toastInfo(
    {required String message,
    Color backgroundcolor = Colors.black,
    Color textColor = Colors.white}) {
  return Fluttertoast.showToast(
      msg: message,
      backgroundColor: backgroundcolor,
      textColor: textColor,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 2,
      fontSize: 12.sp);
}
