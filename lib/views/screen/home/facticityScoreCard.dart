import 'package:fertie_app/helpers/route.dart';
import 'package:fertie_app/utils/app_colors.dart';
import 'package:fertie_app/utils/app_icons.dart';
import 'package:fertie_app/utils/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class FactityScoreContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Lindsay', style: AppStyles.fontSize14(fontWeight: FontWeight.w600)),
        Text('Let\'s Track Smarter, Not Harder!', style: AppStyles.fontSize14(fontWeight: FontWeight.w600,color: AppColors.primaryColor)),
        SizedBox(height: 10.h),
        Container(
          width: double.infinity,
          height: 224.h,
          padding: EdgeInsets.all(8.r),
          decoration: BoxDecoration(
            color: AppColors.colorE0DCD2,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Circular Facility Score
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 140.w,
                        height: 140.h,
                        child: CircularProgressIndicator(
                          value: 0.82,
                          strokeWidth: 8,
                          backgroundColor: AppColors.white,
                          valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryColor!),
                        ),
                      ),


                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Facticity', style: AppStyles.fontSize20(fontWeight: FontWeight.w600)),
                          Text('Score', style: AppStyles.fontSize18(fontWeight: FontWeight.w600)),
                          Text('82', style: AppStyles.fontSize18(fontWeight: FontWeight.w600)),
                        ],
                      ),

                    ],
                  ),

                  Padding(
                    padding:  EdgeInsets.symmetric(vertical: 8.h),
                    child: Row(
                      children: [
                        Text('Edit Insights'),
                        SizedBox(width: 8.w),
                        InkWell(
                          onTap: (){
                            Get.toNamed(AppRoutes.editInsightsScreen);
                          },
                          child: SvgPicture.asset(AppIcons.editIcon)),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(width: 16.w),
              // Expected Period Container
              Container(
                width: 147.w,
                padding: EdgeInsets.all(16.r),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: Colors.grey[300]!),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Expected', style: AppStyles.fontSize18(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Period',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Jan, 1',
                      style: AppStyles.fontSize18(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'In 12 Days',
                        style: AppStyles.fontSize18(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 8),
              // Right arrow icon
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.grey[600],
              ),
            ],
          ),
        ),
      ],
    );
  }
}