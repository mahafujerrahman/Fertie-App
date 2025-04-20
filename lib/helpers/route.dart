import 'package:fertie_app/onboarding_screen.dart';
import 'package:fertie_app/splash_screen.dart';
import 'package:fertie_app/views/screen/auth/signInScreen.dart';
import 'package:fertie_app/views/screen/calenderScreen.dart';
import 'package:fertie_app/views/screen/notificationScreen.dart';
import 'package:fertie_app/views/screen/homeScreen.dart';
import 'package:fertie_app/views/screen/profileScreen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

class AppRoutes{
  static String splashScreen = "/splash_screen";
  static String onboardingScreen = "/Onboarding_screen";
  static String signInScreen = "/signIn_screen";
  static String homeScreen = "/homeScreen";

  static String calenderScreen = "/calenderScreen";
  static String profileScreen = "/profileScreen";
  static String notificationScreen = "/notificationScreen";



 static List<GetPage> page=[

   //SplashScreen
   GetPage(name:splashScreen, page: ()=>const SplashScreen(),transition: Transition.noTransition),
   // GetPage(name:splashScreen, page: ()=>const SplashScreen(),transition: Transition.noTransition),
   GetPage(name:onboardingScreen, page: ()=> OnboardingScreen(),transition: Transition.noTransition),
   GetPage(name:signInScreen, page: ()=> SignInScreen(),transition: Transition.noTransition),

   //Home
   GetPage(name:homeScreen, page: ()=> HomeScreen(),transition: Transition.noTransition),

   //Calender
   GetPage(name:calenderScreen, page: ()=> CalenderScreen(),transition: Transition.noTransition),

   //Profile
   GetPage(name:profileScreen, page: ()=> ProfileScreen(),transition: Transition.noTransition),


   //Notification
   GetPage(name:notificationScreen, page: ()=> NotificationScreen(),transition: Transition.noTransition),


  ];
}