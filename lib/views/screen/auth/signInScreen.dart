import 'package:fertie_app/helpers/route.dart';
import 'package:fertie_app/utils/app_colors.dart';
import 'package:fertie_app/utils/app_icons.dart';
import 'package:fertie_app/utils/app_strings.dart';
import 'package:fertie_app/utils/style.dart';
import 'package:fertie_app/views/base/custom_button.dart';
import 'package:fertie_app/views/base/custom_text.dart';
import 'package:fertie_app/views/base/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';


class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text("Sign In",style: AppStyles.fontSize18()),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40.h),
              // Text sections

              SizedBox(height: 20.h),
              CustomTextField(
                  filColor: AppColors.white,
                  hintText: 'Enter Email',
                  controller: emailCtrl),
              SizedBox(height: 16.h),
              CustomTextField(
                  filColor: AppColors.white,
                  hintText: 'Enter name',
                  controller: passCtrl),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //=================================> Forgot Password Button <================================
                  TextButton(
                    onPressed: () {
                    //  Get.toNamed(AppRoutes.FORGET_PASSWORD);
                    },
                    child: CustomText(
                      fontWeight: FontWeight.bold,
                      text: 'Forgot Password?',
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20.h),
              /// Sing In Button
              CustomButton(
                onTap: () {
                  Get.toNamed(AppRoutes.homeScreen);
                },
                text:'Sign In',
              ),
              ///==================>> Don't have and Account <===================
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${AppStrings.doNotHaveAccount.tr}"),
                  TextButton(
                      onPressed: () {
                       // Get.toNamed(AppRoutes.SIGNUP);
                      },
                      child: CustomText(
                        text: "Sign Up",
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w600,
                      ))
                ],
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }
}
