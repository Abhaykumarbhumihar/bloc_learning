import 'package:bloc_learning/pages/welccome/bloc/welcm_state.dart';
import 'package:bloc_learning/pages/welccome/bloc/welcome_bloc.dart';
import 'package:bloc_learning/pages/welccome/bloc/welcome_event.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WelcomeBloc,WelcomeState>(builder: (context,state){
      print( "CHECK HEREHE EEE ${state.page}");
      return Container(
        color: Colors.white,
        child: Scaffold(
          body: Container(
            margin: EdgeInsets.only(top: 34.h),
            width: 375.w,
            child: Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                PageView(
                  scrollDirection: Axis.horizontal,
onPageChanged: (index){
                    state.page=index;
                    BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
                    print("INdex value is $index");
},
                  children: [
                    _page(
                        1,context,"Next","First See Learning",
                        "Forget about a for of paper all knowledge in one learning",
                        "assets/first_page.png"
                    ),
                    _page(
                        2,context,"Next","Connect with everyone",
                        "Always keep in touch with your tutor & friend. Lets get connect",
                        "assets/second_Page.png"
                    ),
                    _page(
                        3,context,"get started","Always Fascinated Learning",
                        "Anywhere, anytime. The time is at our discrtion so study whenever you want",
                        "assets/third_page.png"
                    ),

                  ],
                ),
                Positioned(
                    bottom: 100.h,
                    child: DotsIndicator(
                      dotsCount:3,
                      position: state.page,
                      mainAxisAlignment: MainAxisAlignment.center,
                      decorator: DotsDecorator(
                          color: Colors.grey,
                          size: Size.square(8.0),
                          activeColor: Colors.blue,
                          activeShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)
                          )
                      ),
                    ))
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _page(int index,BuildContext context, String buttoneName,String title,String subtitle,String imagepath){
    return  Column(
      children: <Widget>[
        SizedBox(
          width: 345.w,
          height: 345.w,
          child: Text(imagepath),
        ),
        Container(
          child: Text(
            "$title",
            style: TextStyle(
                color: Colors.black,
                fontSize: 24.sp,
                fontWeight: FontWeight.normal
            ),
          ),
        ),
        Container(
          width: 375.w,
          child: Padding(
            padding:  EdgeInsets.only(left:30.0.w,right: 30.w),
            child: Text(
              subtitle,
              style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.normal
              ),
            ),
          ),
        ),
        Container(

          margin: EdgeInsets.only(top: 10.h,left: 25.w,right: 25.w),
          width: 325.w,
          height: 50.h,
          decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(Radius.circular(15.w)),
              boxShadow:[
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset(0,1)
                )
              ]
          ),
          child: Center(
            child: Text(buttoneName,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 26.sp,
                  fontWeight: FontWeight.normal
              ),),
          ),
        )
      ],
    );
  }
}
