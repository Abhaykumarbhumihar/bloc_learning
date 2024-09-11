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
    return BlocBuilder<WelcomeBloc, WelcomeState>(builder: (context, state) {
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
                  controller:
                      BlocProvider.of<WelcomeBloc>(context).pageController,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index) {
                    BlocProvider.of<WelcomeBloc>(context)
                        .add(WelcomeEvent(index));
                  },
                  children: [
                    _page(
                        state.page,
                        context,
                        "Next",
                        "First See Learning",
                        "Forget about a for of paper all knowledge in one learning",
                        "assets/first_page.png"),
                    _page(
                        state.page,
                        context,
                        "Next",
                        "Connect with everyone",
                        "Always keep in touch with your tutor & friend. Lets get connect",
                        "assets/second_Page.png"),
                    _page(
                        state.page,
                        context,
                        "get started",
                        "Always Fascinated Learning",
                        "Anywhere, anytime. The time is at our discrtion so study whenever you want",
                        "assets/third_page.png"),
                  ],
                ),
                Positioned(
                    bottom: 100.h,
                    child: DotsIndicator(
                      dotsCount: 3,
                      position: state.page,
                      mainAxisAlignment: MainAxisAlignment.center,
                      decorator: DotsDecorator(
                          color: Colors.grey,
                          size: const Size.square(8.0),
                          activeColor: Colors.blue,
                          activeSize: const Size.square(8.0),
                          activeShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(70.0))),
                    ))
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _page(currentpage, BuildContext context, String buttoneName,
      String title, String subtitle, String imagepath) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 75.h,
        ),
        Image.asset(
          "$imagepath",
          height: 300.h,
          width: 300.h,
          fit: BoxFit.fill,
        ),
        Container(
          child: Text(
            "$title",
            style: TextStyle(
                color: Colors.black,
                fontSize: 24.sp,
                fontWeight: FontWeight.normal),
          ),
        ),
        Container(
          width: 375.w,
          child: Padding(
            padding: EdgeInsets.only(left: 30.0.w, right: 30.w),
            child: Text(
              subtitle,
              style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.normal),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (currentpage < 2) {
              BlocProvider.of<WelcomeBloc>(context)
                  .add(WelcomeEvent(currentpage + 1));
              BlocProvider.of<WelcomeBloc>(context)
                  .pageController
                  .animateToPage(currentpage + 1,
                      duration: const Duration(milliseconds: 1000),
                      curve: Curves.decelerate);
            } else {
              Navigator.of(context).pushNamedAndRemoveUntil("signIn", (route) => false);
              // BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent(0));
              // BlocProvider.of<WelcomeBloc>(context)
              //     .pageController
              //     .animateToPage(0,
              //         duration: const Duration(milliseconds: 1000),
              //         curve: Curves.decelerate);
            }
          },
          child: Container(
            margin: EdgeInsets.only(top: 10.h, left: 25.w, right: 25.w),
            width: 325.w,
            height: 50.h,
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(15.w)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: const Offset(0, 1))
                ]),
            child: Center(
              child: Text(
                buttoneName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.normal),
              ),
            ),
          ),
        )
      ],
    );
  }
}
