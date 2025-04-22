import 'package:fertie_app/utils/app_colors.dart';
import 'package:fertie_app/utils/app_icons.dart';
import 'package:fertie_app/utils/style.dart';
import 'package:fertie_app/views/base/custom_text_field.dart';
import 'package:fertie_app/views/screen/bottomMenuBar/user_bottom_menu..dart';
import 'package:fertie_app/views/screen/calender/datStatusWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';


class CalenderScreen extends StatefulWidget {
  const CalenderScreen({super.key});

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  TextEditingController textEditingController = TextEditingController();
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  Map<DateTime, List<String>> _events = {};

  @override
  void initState() {
    super.initState();
    _events = {
      DateTime.utc(2025, 4, 5): ['ovulation'],
      DateTime.utc(2025, 4, 10): ['dot', 'menstruation'],
      DateTime.utc(2025, 4, 12): ['ovulation'],
      DateTime.utc(2025, 4, 16): ['ovulation'],
      DateTime.utc(2025, 4, 17): ['ovulation'],
      DateTime.utc(2025, 4, 18): ['ovulation'],
      DateTime.utc(2025, 4, 2): ['menstruation'],
      DateTime.utc(2025, 4, 3): ['menstruation'],
      DateTime.utc(2025, 4, 4): ['menstruation'],
      DateTime.utc(2025, 4, 1): ['menstruation'],
      DateTime.utc(2025, 4, 5): ['ovulation', 'menstruation'],
    };
  }

  List<String> _getEventsForDay(DateTime day) {
    return _events[day] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondColor,
      bottomNavigationBar: UserBottomMenu(1),
      appBar: AppBar(
        backgroundColor: AppColors.secondColor,
        title:  Text('Calendar',style: AppStyles.fontSize24(fontWeight: FontWeight.w600)),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                height: 28.h,
                decoration: BoxDecoration(
                  color: AppColors.colorF7D6D1,
                  borderRadius: BorderRadius.circular(8.h),
                ),
                child: Center(
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 4,vertical: 2.h),
                    child: Row(
                      children: [
                        SvgPicture.asset(AppIcons.touchIcon),
                        SizedBox(width: 4.w),
                        Text('Tap on the date to view or edit your cycle insights.',style: AppStyles.fontSize14()),
                      ],
                    ),
                  ),
                ),
              ),
              TableCalendar(
                firstDay: DateTime.utc(2024, 10, 20),
                lastDay: DateTime.utc(2030, 10, 20),
                focusedDay: _focusedDay,
                calendarFormat: _calendarFormat,
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                },
                onFormatChanged: (format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                },
                onPageChanged: (focusedDay) {
                  _focusedDay = focusedDay;
                },
                calendarStyle: CalendarStyle(
                  selectedDecoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  selectedTextStyle: TextStyle(color: Colors.white),
                  todayDecoration: BoxDecoration(
                    color: Colors.blue[200],
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  defaultDecoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  weekendDecoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                ),
                headerStyle: HeaderStyle(
                  titleCentered: true,
                  formatButtonVisible: false,
                  titleTextFormatter:
                      (date, locale) => DateFormat.yMMMM(locale).format(date),
                ),
                calendarBuilders: CalendarBuilders(
                  markerBuilder: (context, day, events) {
                    List<String> dayEvents = _getEventsForDay(day);

                    if (dayEvents.isNotEmpty) {
                      return Positioned(
                        bottom: 5,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children:
                          dayEvents.map((event) {
                            if (event == 'dot') {
                              return Container(
                                height: 5.h,
                                width: 5.w,
                                margin: EdgeInsets.symmetric(horizontal: 0.5),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  shape: BoxShape.circle,
                                ),
                              );
                            } else if (event == 'ovulation') {
                              return Icon(
                                Icons.linear_scale,
                                color: AppColors.color7D9EBB,
                                size: 20.sp,
                              );
                            } else if (event == 'menstruation') {
                              return Icon(
                                Icons.linear_scale,
                                color: Colors.red,
                                size: 20.sp,
                              );
                            }
                            return SizedBox.shrink();
                          }).toList(),
                        ),
                      );
                    }
                    return null;
                  },

                  defaultBuilder: (context, day, focusedDay) {
                    if (_getEventsForDay(day).isNotEmpty) {
                      return Padding(
                        // Add Padding
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFFEEAEA),
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                          child: Center(
                            child: Text(
                              day.day.toString(),
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      );
                    }
                    return null;
                  },
                  todayBuilder: (context, day, focusedDay) {
                    if (_getEventsForDay(day).isNotEmpty) {
                      return Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFFEEAEA),
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                          child: Center(
                            child: Text(
                              day.day.toString(),
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      );
                    }
                    return null;
                  },
                  selectedBuilder: (context, day, focusedDay) {
                    if (_getEventsForDay(day).isNotEmpty) {
                      return Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFFEEAEA),
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                          child: Center(
                            child: Text(
                              day.day.toString(),
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      );
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 8.h),
                child: Divider(thickness: .5),
              ),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DayStatusWidget(
                            color: AppColors.colorF7D6D1,
                            title: 'Today',
                          ),

                          SizedBox(height: 8.h),
                          DayStatusWidget(
                            color: AppColors.colorDFC7FF,
                            title: 'Fertile Day',
                           ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          DayStatusWidget(
                            color: AppColors.colorFF5653,
                            title: 'Menstruation'
                          ),
                          SizedBox(height: 8.h),
                          DayStatusWidget(
                            color: AppColors.color7D9EBB,
                            title: 'Ovulation'
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
