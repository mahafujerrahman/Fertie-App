import 'package:fertie_app/utils/app_colors.dart';
import 'package:fertie_app/utils/app_icons.dart';
import 'package:fertie_app/utils/style.dart';

import 'package:fertie_app/views/screen/bottomMenuBar/user_bottom_menu..dart';
import 'package:fertie_app/views/screen/calender/datStatusWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';


class EditCycleInsightScreen extends StatefulWidget {
  const EditCycleInsightScreen({super.key});

  @override
  State<EditCycleInsightScreen> createState() => _EditCycleInsightScreenState();
}

class _EditCycleInsightScreenState extends State<EditCycleInsightScreen> {
  TextEditingController textEditingController = TextEditingController();


  @override
  void initState() {
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondColor,
      bottomNavigationBar: UserBottomMenu(1),
      appBar: AppBar(
        backgroundColor: AppColors.secondColor,
        title:  Text('Cycle Insight',style: AppStyles.fontSize24(fontWeight: FontWeight.w600)),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  Text('January 12, Thursday',style: AppStyles.fontSize16(fontWeight: FontWeight.w600)),
                ],
              ),
              SizedBox(height: 10.h),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(8.r),
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: AppColors.colorEBD7C7,
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Padding(
                                padding:  EdgeInsets.all(8.r),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Menstrual flow',style: AppStyles.fontSize14(fontWeight: FontWeight.w600)),
                                        Row(
                                          children: [
                                            SvgPicture.asset(AppIcons.bloodIcon),
                                            SizedBox(width: 4.w),
                                            Text('Light',style: AppStyles.fontSize14(fontWeight: FontWeight.w600)),
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 8.h),
                                    Padding(
                                      padding:  EdgeInsets.symmetric(vertical: 2.r),
                                      child: Text('Total : 28 days',style: AppStyles.fontSize14(fontWeight: FontWeight.w500)),
                                    ),
                                    Padding(
                                      padding:  EdgeInsets.symmetric(vertical: 2.r),
                                      child: Text('Jan 1 to Jan 28',style: AppStyles.fontSize12(color: AppColors.color88888)),
                                    ),

                                  ],
                                ),
                              ),

                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),

    );
  }
}
