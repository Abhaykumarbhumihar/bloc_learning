import 'package:flutter/material.dart';

import '../../common/utils/screenUtils.dart';


import '../../common/values/colors.dart';
import 'application_widget.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    var width = ScreenUtils.width(context);
    var height = ScreenUtils.height(context);
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: Center(
          child: buildPage(index),
        ),
        bottomNavigationBar: Container(
          width: width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.0),
                topRight: Radius.circular(12.0)
              ),
              boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                blurRadius: 1,
                spreadRadius: 2)
          ]),
          child: BottomNavigationBar(
            currentIndex: index,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: AppColors.primaryElement,
            unselectedItemColor: AppColors.primaryFourElementText,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            onTap: (value) {
              setState(() {
                index = value;
              });
            },
            items: [
              BottomNavigationBarItem(
                  label: "Home",
                  icon: SizedBox(
                    width: width * 0.04,
                    height: height * 0.03,
                    child: Icon(Icons.home_outlined),
                  ),
                  activeIcon: Icon(Icons.home_filled)),
              BottomNavigationBarItem(
                  label: "Search",
                  icon: SizedBox(
                    width: width * 0.04,
                    height: height * 0.03,
                    child: Icon(Icons.search),
                  ),
                  activeIcon: Icon(Icons.search_rounded)),
              BottomNavigationBarItem(
                  label: "Search",
                  icon: SizedBox(
                    width: width * 0.04,
                    height: height * 0.03,
                    child: Icon(Icons.search),
                  )),
              BottomNavigationBarItem(
                  label: "Search",
                  icon: SizedBox(
                    width: width * 0.04,
                    height: height * 0.03,
                    child: Icon(Icons.search),
                  )),
              BottomNavigationBarItem(
                  label: "Search",
                  icon: SizedBox(
                    width: width * 0.04,
                    height: height * 0.03,
                    child: Icon(Icons.search),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
