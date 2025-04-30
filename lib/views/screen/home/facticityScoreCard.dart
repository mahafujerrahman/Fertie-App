import 'dart:async';

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

class FactityScoreContainer extends StatefulWidget {
  @override
  State<FactityScoreContainer> createState() => _FactityScoreContainerState();
}

class _FactityScoreContainerState extends State<FactityScoreContainer> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();

    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 4) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Lindsay', style: AppStyles.fontSize14(fontWeight: FontWeight.w600)),
        Text('Let\'s Track Smarter, Not Harder!', style: AppStyles.fontSize14(fontWeight: FontWeight.w600,color: AppColors.primaryColor)),
        SizedBox(height: 10.h),
        Container(
          width: double.infinity,
          height: 241.h,
          decoration: BoxDecoration(
            color: AppColors.colorE0DCD2,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: 120.w,
                          height: 120.h,
                          child: CircularProgressIndicator(
                            value: 0.82,
                            strokeWidth: 8.w,
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
                      padding: EdgeInsets.symmetric(vertical: 16.h,horizontal: 8.w),
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
              ),
              Expanded(
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 16.w,vertical: 55.h),
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return CardWidget();
                    },
                  ),
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 16.sp,
                color: Colors.grey[600],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 147.w,
      height: 131.h,
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Expected', style: AppStyles.fontSize16(fontWeight: FontWeight.w600),
          ),
          Text(
            'Period',
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            'Jan, 1',
            style: AppStyles.fontSize16(fontWeight: FontWeight.w600),
          ),
          Text(
            'In 12 Days',
            style: AppStyles.fontSize16(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
