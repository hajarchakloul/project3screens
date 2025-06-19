import 'package:flutter/material.dart';
import 'package:project3screens/screens/homescreen.dart';
import 'package:project3screens/screens/inventoryscreen.dart';
import 'package:project3screens/screens/reportsscreen.dart';
import 'package:project3screens/screens/settingsscreen.dart';
import 'package:project3screens/screens/splash_screen.dart';
import 'package:project3screens/screens/onboarding_screen.dart';
import 'package:project3screens/screens/login_screen.dart';

class AppRoutes {
  // المسارات الأصلية
  static const String homescreen = '/home';
  static const String inventoryscreen = '/inventory';
  static const String reportsscreen = '/reports';
  static const String settingsscreen = '/settings';
  
  // المسارات الجديدة
  static const String splashscreen = '/splash';
  static const String onboardingscreen = '/onboarding';
  static const String loginscreen = '/login';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // المسارات الأصلية
      case homescreen:
        return MaterialPageRoute(builder: (_) => const Homescreen());
      case inventoryscreen:
        return MaterialPageRoute(builder: (_) => const Inventoryscreen());
      case reportsscreen:
        return MaterialPageRoute(builder: (_) => const Reportsscreen());
      case settingsscreen:
        return MaterialPageRoute(builder: (_) => const Settingsscreen());
      
      // المسارات الجديدة
      case splashscreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case onboardingscreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case loginscreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
        
      default:
        // في حال لم يطابق أي مسار
        return MaterialPageRoute(builder: (_) => const SplashScreen());
    }
  }
}