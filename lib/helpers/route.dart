import 'package:fertie_app/onboarding_screen.dart';
import 'package:fertie_app/splash_screen.dart';
import 'package:fertie_app/views/screen/auth/signInScreen.dart';
import 'package:fertie_app/views/screen/homeScreen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

class AppRoutes{
  static String splashScreen = "/splash_screen";
  static String onboardingScreen = "/Onboarding_screen";
  static String signInScreen = "/signIn_screen";
  static String homeScreen = "/homeScreen";



 static List<GetPage> page=[

   //SplashScreen
   GetPage(name:splashScreen, page: ()=>const SplashScreen(),transition: Transition.noTransition),
   // GetPage(name:splashScreen, page: ()=>const SplashScreen(),transition: Transition.noTransition),
   GetPage(name:onboardingScreen, page: ()=> OnboardingScreen(),transition: Transition.noTransition),
   GetPage(name:signInScreen, page: ()=> SignInScreen(),transition: Transition.noTransition),
   GetPage(name:homeScreen, page: ()=> HomeScreen(),transition: Transition.noTransition),


  ];
}