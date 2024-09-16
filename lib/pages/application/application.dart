import 'package:bloc_learning/pages/application/bloc/app_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/utils/screenUtils.dart';

import '../../common/values/colors.dart';
import 'application_widget.dart';

class ApplicationPage extends StatelessWidget {
  const ApplicationPage({super.key});

  @override
  Widget build(BuildContext context) {
    var width = ScreenUtils.width(context);
    var height = ScreenUtils.height(context);
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: Scaffold(
            body: Center(
              child: buildPage(state.index),
            ),
            bottomNavigationBar: Container(
              width: width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.0),
                      topRight: Radius.circular(12.0)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        blurRadius: 1,
                        spreadRadius: 2)
                  ]),
              child: BottomNavigationBar(
                currentIndex: state.index,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                selectedItemColor: AppColors.primaryElement,
                unselectedItemColor: AppColors.primaryFourElementText,
                elevation: 0,
                type: BottomNavigationBarType.fixed,
                onTap: (value) {
                  context.read<AppBloc>().add(TriggerAppEvent(value));
                },
                items:<BottomNavigationBarItem>[].bottomTabs(width, height),
              ),
            ),
          ),
        );
      },
    );
  }
}
