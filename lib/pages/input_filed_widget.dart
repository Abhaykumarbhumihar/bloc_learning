import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputField extends StatefulWidget {
  final String text;
  final String hintText;
  final String textType;
  final void Function(String value)? onChanged;

  const InputField({
    Key? key,
    required this.text,
    required this.hintText,
    required this.textType,
    this.onChanged,
  }) : super(key: key);

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 325.h,
      padding: EdgeInsets.only(left: 4.w),
      margin: EdgeInsets.zero,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13.w),
        border: Border.all(color: Colors.black),
      ),
      child: Row(
        children: <Widget>[
          Center(
            child: Container(
              child: Icon(
                widget.textType == "user"
                    ? Icons.account_circle_outlined
                    : Icons.lock,
              ),
            ),
          ),
          Container(
            width: 260.w,
            height: 50.h,
            child: TextField(
              keyboardType: widget.textType == "user"
                  ? TextInputType.text
                  : TextInputType.visiblePassword,
              autocorrect: false,
              onChanged: (value) => widget.onChanged!(value),
              obscureText: widget.textType == "password" ? obscureText : false,
              decoration: InputDecoration(
                isDense: true,
                hintText: widget.hintText,
                suffixIcon: widget.textType == "password"
                    ? GestureDetector(
                        onTap: () {
                          setState(() {
                            obscureText = !obscureText;
                          });
                        },
                        child: Icon(
                          obscureText ? Icons.visibility_off : Icons.visibility,
                          color: Colors.black38,
                          size: 22.h,
                        ),
                      )
                    : const SizedBox.shrink(),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                disabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                hintStyle: const TextStyle(color: Colors.grey),
              ),
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontSize: 14.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
