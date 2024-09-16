import 'package:bloc_learning/pages/product/presentation/ui/produt_list.dart';
import 'package:flutter/material.dart';

Widget buildPage(int index) {
  List<Widget> _widget = [
    Product(),
    Center(
      child: Text("Search"),
    ),
    Center(
      child: Text("Course"),
    ),
    Center(
      child: Text("Chat"),
    ),
    Center(
      child: Text("Profile"),
    ),
  ];

  return _widget[index];
}

extension BottomTabsExtension on List<BottomNavigationBarItem> {
  List<BottomNavigationBarItem> bottomTabs(double width, double height) {
    return [
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
        label: "",
        icon: Container(), // Empty icon for the center spot
      ),
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
    ];
  }
}
