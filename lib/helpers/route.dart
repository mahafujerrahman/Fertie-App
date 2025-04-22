import 'package:fertie_app/onboarding_screen.dart';
import 'package:fertie_app/splash_screen.dart';
import 'package:fertie_app/views/screen/auth/forgetPassword.dart';
import 'package:fertie_app/views/screen/auth/resetPassword_screen.dart';
import 'package:fertie_app/views/screen/auth/signInScreen.dart';
import 'package:fertie_app/views/screen/auth/code_verifyEmailScreen.dart';
import 'package:fertie_app/views/screen/auth/email_verificationScreen.dart';
import 'package:fertie_app/views/screen/auth/setPasswordScreen.dart';
import 'package:fertie_app/views/screen/auth/signUpScreen.dart';
import 'package:fertie_app/views/screen/calender/calenderScreen.dart';
import 'package:fertie_app/views/screen/notification/notificationScreen.dart';
import 'package:fertie_app/views/screen/home/homeScreen.dart';
import 'package:fertie_app/views/screen/personalize/personalize_screen.dart';
import 'package:fertie_app/views/screen/profile/accessPin/confirm_accessPin_screen.dart';
import 'package:fertie_app/views/screen/profile/accessPin/new_accessPin_screen.dart';
import 'package:fertie_app/views/screen/profile/accessPin/old_accessPin_screen.dart';
import 'package:fertie_app/views/screen/profile/accessPin/remove_accesspin_screen.dart';
import 'package:fertie_app/views/screen/profile/accessPin/set_access_pin_screen.dart';
import 'package:fertie_app/views/screen/profile/editPersonalInforamtion.dart';
import 'package:fertie_app/views/screen/profile/help/helpScreen.dart';
import 'package:fertie_app/views/screen/profile/personalInformationScreen.dart';
import 'package:fertie_app/views/screen/profile/profileScreen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

class AppRoutes{
  static String splashScreen = "/splash_screen";
  static String onboardingScreen = "/Onboarding_screen";
  static String signUpScreen = "/signUpScreen";
  static String homeScreen = "/homeScreen";
  static String signInScreen = "/signInScreen";

  static String calenderScreen = "/calenderScreen";
  static String profileScreen = "/profileScreen";
  static String notificationScreen = "/notificationScreen";
  static String setPasswordScreen = "/setPasswordScreen";
  static String emailVerificationScreen = "/emailVerificationScreen";
  static String codeVerifyEmailScreen = "/CodeVerifyEmailScreen";
  static String forgetPasswordScreen = "/forgetPasswordScreen";
  static String resetPasswordScreen = "/resetPasswordScreen";
  static String personalInformationScreen = "/personalInformationScreen";
  static String editPersonalInformationScreen = "/editPersonalInformationScreen";
  static String setAccessPinScreen = "/setAccessPinScreen";
  static String removeAccessPinScreen = "/removeAccessPinScreen";
  static String helpScreen = "/help_screen";
  static String confirmAccessPinScreen = "/confirmAccessPinScreen";
  static String newAccessPinScreen = "/newAccessPinScreen";
  static String oldAccessPinScreen = "/oldAccessPinScreen";
  static String personalizeScreen = "/personalizeScreen";




 static List<GetPage> page=[

   //SplashScreen
   GetPage(name:splashScreen, page: ()=>const SplashScreen(),transition: Transition.noTransition),
   // GetPage(name:splashScreen, page: ()=>const SplashScreen(),transition: Transition.noTransition),
   GetPage(name:onboardingScreen, page: ()=> OnboardingScreen(),transition: Transition.noTransition),

   //Auth
   GetPage(name:signUpScreen, page: ()=> SignUpScreen(),transition: Transition.noTransition),
   GetPage(name:signInScreen, page: ()=> SignInScreen(),transition: Transition.noTransition),
   GetPage(name:setPasswordScreen, page: ()=> SetPasswordScreen(),transition: Transition.noTransition),
   GetPage(name:emailVerificationScreen, page: ()=> EmailVerificationScreen(),transition: Transition.noTransition),
   GetPage(name:codeVerifyEmailScreen, page: ()=> CodeVerifyEmailScreen(),transition: Transition.noTransition),
   GetPage(name:forgetPasswordScreen, page: ()=> ForgetPasswordScreen(),transition: Transition.noTransition),
   GetPage(name:resetPasswordScreen, page: ()=> ResetPasswordScreen(),transition: Transition.noTransition),

   //Home
   GetPage(name:homeScreen, page: ()=> HomeScreen(),transition: Transition.noTransition),

   //Calender
   GetPage(name:calenderScreen, page: ()=> CalenderScreen(),transition: Transition.noTransition),

   //Profile
   GetPage(name:profileScreen, page: ()=> ProfileScreen(),transition: Transition.noTransition),
   GetPage(name:personalInformationScreen, page: ()=> PersonalInformationScreen(),transition: Transition.noTransition),
   GetPage(name:editPersonalInformationScreen, page: ()=> EditPersonalInformationScreen(),transition: Transition.noTransition),
   GetPage(name:setAccessPinScreen, page: ()=> SetAccessPinScreen(),transition: Transition.noTransition),
   GetPage(name:removeAccessPinScreen, page: ()=> RemoveAccessPinScreen(),transition: Transition.noTransition),
   GetPage(name:helpScreen, page: ()=> HelpScreen(),transition: Transition.noTransition),



   /// Profile >> Access Pin
   GetPage(name:confirmAccessPinScreen, page: ()=> ConfirmAccessPinScreen(),transition: Transition.noTransition),
   GetPage(name:newAccessPinScreen, page: ()=> NewAccessPinScreen(),transition: Transition.noTransition),
   GetPage(name:oldAccessPinScreen, page: ()=> OldAccessPinScreen(),transition: Transition.noTransition),


   //Personalize Screen
   GetPage(name: personalizeScreen, page: ()=> PersonalizeScreen(),transition: Transition.noTransition),

   //Notification
   GetPage(name:notificationScreen, page: ()=> NotificationScreen(),transition: Transition.noTransition),


  ];
}