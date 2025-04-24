import 'package:fertie_app/helpers/route.dart';
import 'package:fertie_app/utils/app_colors.dart';
import 'package:fertie_app/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class PersonalInformationScreen extends StatelessWidget {
  const PersonalInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Personal Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Name Section
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Name'),
                Text('Linfsay',style: AppStyles.fontSize16(fontWeight: FontWeight.w600)),
                SizedBox(height: 16.h),
                Text('Age'),
                Text('25',style: AppStyles.fontSize16(fontWeight: FontWeight.w600)),
                SizedBox(height: 16.h),
                Text('Email'),
                Text('linfsay@gmail.com',style: AppStyles.fontSize16(fontWeight: FontWeight.w600)),
                SizedBox(height: 16.h),
              ],
            ),
            

            // Edit Button
            Row(
            mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                   Get.toNamed(AppRoutes.editPersonalInformationScreen);
                  },
                  child: Row(
                    children: [
                      Text('Edit',style: AppStyles.fontSize20(color:AppColors.primaryColor,fontWeight: FontWeight.w600)),
                      SizedBox(width: 8.w),
                      Icon(Icons.edit_note,color: AppColors.primaryColor,size: 30.sp),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
