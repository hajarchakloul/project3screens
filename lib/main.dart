import 'package:flutter/material.dart';
import 'package:project3screens/routes/route.dart';
import 'package:project3screens/screens/homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
            initialRoute: AppRoutes.homescreen,

      // الربط مع الدالة التي تولد الصفحات
      onGenerateRoute: AppRoutes.generateRoute,

      // اختياري: بإمكانك ضبط الثيم وغيره

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home:  const Homescreen(),
    );
  }
}