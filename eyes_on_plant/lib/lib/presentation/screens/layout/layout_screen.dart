import 'package:eyes_on_plant/lib/core/utils/app_colors.dart';
import 'package:eyes_on_plant/lib/presentation/screens/layout/cubit/layout_cubit.dart';
import 'package:eyes_on_plant/lib/presentation/screens/layout/screens/diagnose_screen.dart';
import 'package:eyes_on_plant/lib/presentation/screens/layout/screens/home_screen.dart';
import 'package:eyes_on_plant/lib/presentation/screens/layout/screens/my_garden_screen.dart';
import 'package:eyes_on_plant/lib/presentation/screens/layout/screens/settings_screen.dart';
import 'package:eyes_on_plant/lib/presentation/screens/layout/states/layout_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../routes.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<LayoutCubit>(context);
    return BlocConsumer<LayoutCubit, LayoutStates>(
      builder:
          (context, state) => Scaffold(
            appBar: AppBar(
              title: Text(
                cubit.titles[cubit.currentIndex],
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.japaneseLaurel10,
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
              actions: [
                if (cubit.currentIndex == 0) IconButton(
                  onPressed: () {
                  },
                  icon: Image.asset(
                    "assets/images/ic_notification.png",
                    color: AppColors.japaneseLaurel,
                    height: 25,
                    width: 25,
                  ),
                ),
              ],
            ),
            body: PageView(
              controller: cubit.pageController,
              onPageChanged: (value) => cubit.onValueChange(value),
              children: [
                HomeScreen(),
                DiagnoseScreen(),
                MyGardenScreen(),
                SettingsScreen(),
              ],
            ),

            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: cubit.currentIndex,
              onTap: (index) => cubit.onBottomNavChange(index),
              iconSize: 24,
              showUnselectedLabels: true,
              selectedFontSize: 12,
              selectedIconTheme: IconThemeData(
                color: AppColors.japaneseLaurel10,
              ),
              unselectedIconTheme: IconThemeData(color: AppColors.sisal),
              selectedItemColor: AppColors.japaneseLaurel10,
              unselectedItemColor: AppColors.sisal,
              showSelectedLabels: true,
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset(
                    "assets/images/ic_home.png",
                    width: 30,
                    height: 30,
                  ),
                  label: "Home",
                  activeIcon: Image.asset(
                    "assets/images/ic_home.png",
                    width: 30,
                    height: 30,
                    color: AppColors.japaneseLaurel10,
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    "assets/images/ic_diagnose.png",
                    width: 30,
                    height: 30,
                  ),
                  label: "Diagnose",
                  activeIcon: Image.asset(
                    "assets/images/ic_diagnose.png",
                    width: 30,
                    height: 30,
                    color: AppColors.japaneseLaurel10,
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.camera_alt_outlined,
                    color: AppColors.sisal,
                  ),
                  label: "Scan",
                  activeIcon:Icon(
                    Icons.camera_alt_outlined,
                    color: AppColors.japaneseLaurel10,

                  ) ,
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    "assets/images/ic_more.png",
                    width: 30,
                    height: 30,
                  ),
                  label: "More",
                  activeIcon: Image.asset(
                    "assets/images/ic_more.png",
                    width: 30,
                    height: 30,
                    color: AppColors.japaneseLaurel10,
                  ),
                ),
              ],
            ),
          ),
      listener: (context, state) {
        if(state is OnSuccess){
          context.replace(AppRoutePaths.chooseWay);
        }
      },
      buildWhen:
          (previous, current) =>
              current is OnScreenChange ||
              current is OnLoading ||
              current is OnError ||
              current is OnSuccess,
    );
  }
}
