import 'package:flutter/material.dart';
import 'package:project3screens/routes/route.dart';
import 'package:project3screens/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'متجرك الذكي',
      // المسار الأولي هو شاشة البداية
      initialRoute: AppRoutes.splashscreen,

      // الربط مع الدالة التي تولد الصفحات
      onGenerateRoute: AppRoutes.generateRoute,

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        fontFamily: 'Cairo', // تأكد من إضافة الخط في ملف pubspec.yaml
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            fontFamily: 'Cairo',
          ),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}