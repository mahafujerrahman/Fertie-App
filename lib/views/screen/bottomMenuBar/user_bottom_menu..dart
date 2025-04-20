import 'package:fertie_app/helpers/route.dart';
import 'package:fertie_app/utils/app_colors.dart';
import 'package:fertie_app/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';


class UserBottomMenu extends StatelessWidget {
  final int menuIndex;
  const UserBottomMenu(this.menuIndex, {super.key});

  Color colorByIndex(ThemeData theme, int index) {
    return index == menuIndex ? AppColors.white : AppColors.blackColor;
  }

  BottomNavigationBarItem getItem(
      String image, String title, ThemeData theme, int index) {
    return BottomNavigationBarItem(
        label: title,
        icon: Padding(
          padding:  EdgeInsets.only(top: 4.h),
          child: SvgPicture.asset(
            image,
            height: 24.h,
            width: 24.w,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    List<BottomNavigationBarItem> menuItems = [
      getItem(menuIndex == 0 ? AppIcons.homeIcon : AppIcons.homeFillUpIcon, 'Home', theme, 0),
      getItem(menuIndex == 1 ? AppIcons.calenderIcon : AppIcons.calenderfillup,'Calender', theme, 1),
      getItem(menuIndex == 2 ? AppIcons.profileIcon : AppIcons.profileFillup, 'Profile', theme, 2),
      getItem(menuIndex == 3 ? AppIcons.notificationIcon : AppIcons.notificationFillup, 'Notification', theme, 3),
    ];

    return BottomNavigationBar(
      // backgroundColor: AppColors.transparent,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.white,
      unselectedItemColor: AppColors.white,
      currentIndex: menuIndex,
      onTap: (value) {
        switch (value) {
          case 0:
            Get.offAndToNamed(AppRoutes.homeScreen);
            break;
          case 1:
            Get.offAndToNamed(AppRoutes.onboardingScreen);
            break;
          case 2:
            Get.offAndToNamed(AppRoutes.onboardingScreen);
            break;

        }
      },
      items: menuItems,
    );


  }
}

