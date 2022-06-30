import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smarttouristguide/layout/cubit/cubit.dart';
import 'package:smarttouristguide/layout/cubit/states.dart';
import 'package:smarttouristguide/modules/home/menu_drawer.dart';
import 'package:smarttouristguide/shared/components/components.dart';
import 'package:smarttouristguide/shared/styles/colors.dart';

import '../modules/profile/profile_screen.dart';

class AppLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          drawer: MenuDrawerScreen(),
          appBar: AppBar(
            foregroundColor: AppColors.primaryColor,
            actions: [
              IconButton(
                icon: Icon(
                  Icons.account_circle_rounded,
                  color: AppColors.primaryColor,
                  size: 25.5,
                ),
                onPressed: () {
                  navigateTo(
                    context: context,
                    widget: ProfileScreen(),
                  );
                },
              )
            ],
          ),
          body: cubit.bottomScreens[cubit.currentIndex],
          bottomNavigationBar: bottomNavBar(
            context,
          ),
        );
      },
    );
  }
}