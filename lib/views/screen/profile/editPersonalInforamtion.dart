import 'package:fertie_app/utils/app_colors.dart';
import 'package:fertie_app/utils/style.dart';
import 'package:fertie_app/views/base/custom_button.dart';
import 'package:fertie_app/views/base/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class EditPersonalInformationScreen extends StatefulWidget {
  const EditPersonalInformationScreen({super.key});

  @override
  State<EditPersonalInformationScreen> createState() =>
      _EditPersonalInformationScreenState();
}

class _EditPersonalInformationScreenState
    extends State<EditPersonalInformationScreen> {
  TextEditingController nameCTRl = TextEditingController();
  TextEditingController birthdayCTRl = TextEditingController();
  TextEditingController emailCTRl = TextEditingController();

  int age = 0;

  @override
  void initState() {
    super.initState();
    nameCTRl.text = 'Mahafujer';
    emailCTRl.text = 'linfsay@example.com';
    birthdayCTRl.text = 'April 15,2022';
  }

  // Function to calculate age
  void calculateAge(String birthDate) {
    try {
      DateTime birthDateTime = DateFormat('dd-MM-yyyy').parse(birthDate);
      DateTime currentDate = DateTime.now();
      int years = currentDate.year - birthDateTime.year;
      if (currentDate.month < birthDateTime.month ||
          (currentDate.month == birthDateTime.month &&
              currentDate.day < birthDateTime.day)) {
        years--;
      }
      setState(() {
        age = years;
      });
    } catch (e) {
      print("Error parsing date: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Edit Personal Information'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Name Section
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: Text('Name'),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: CustomTextField(controller: nameCTRl),
              ),

              // Email Section
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: Text('Email'),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: CustomTextField(controller: emailCTRl),
              ),

              // Age Section
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: Text('Age'),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      child: TextFormField(
                        controller: birthdayCTRl,
                        onChanged: (value) {
                          calculateAge(value);
                        },
                        decoration: InputDecoration(
                          hintText: 'Select Birth Date',
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.calendar_month),
                    onPressed: () async {
                      DateTime? selectedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      );
                      if (selectedDate != null) {
                        String formattedDate =
                        DateFormat('MMMM dd,yyyy').format(selectedDate);
                        setState(() {
                          birthdayCTRl.text = formattedDate;
                          calculateAge(formattedDate);
                        });
                      }
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    child: Text('$age Years'),
                  ),

                ],
              ),
              SizedBox(height: 16.h),
              CustomButton(onTap: (){}, text: "Save"),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }
}
