import 'package:fertie_app/helpers/route.dart';
import 'package:fertie_app/utils/app_colors.dart';
import 'package:fertie_app/utils/app_icons.dart';
import 'package:fertie_app/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class PersonalInformationScreen extends StatelessWidget {
  const PersonalInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondColor,
      appBar: AppBar(
        backgroundColor: AppColors.secondColor,
        centerTitle: true,
        title: Text('Personal Information'),
      ),
      body: Padding(
        padding:  EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: AppColors.white,
                border: Border.all(width: 1.w, color: AppColors.greyColor),
              ),
              child: Padding(
                padding:  EdgeInsets.all(16.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Personal Information'),
                        Row(
                          children: [
                            Text('Edit',style: AppStyles.fontSize16(fontWeight: FontWeight.w600,color: AppColors.primaryColor)),
                            SizedBox(width: 8.w),
                            InkWell(
                              onTap: (){
                                Get.toNamed(AppRoutes.editPersonalInformationScreen);
                              },
                                child: SvgPicture.asset(AppIcons.editIcon,color:AppColors.primaryColor))
                          ],
                        ),
                        
                      ],
                    ),
                    SizedBox(height: 16.h),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
