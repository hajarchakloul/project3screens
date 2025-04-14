import 'package:flutter/material.dart';
// import 'package:project3screens/screens/addItemsscreen.dart';
import 'package:project3screens/screens/homescreen.dart';
import 'package:project3screens/screens/inventoryscreen.dart';
import 'package:project3screens/screens/reportsscreen.dart';
import 'package:project3screens/screens/settingsscreen.dart';

class AppRoutes {
  static const String homescreen = '/';
  static const String inventoryscreen = '/inventory';
  // static const String addItemsscreen = '/addItems';
  static const String reportsscreen = '/reports';
  static const String settingsscreen = '/settings';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homescreen:
        return MaterialPageRoute(builder: (_) => const Homescreen());
      case inventoryscreen:
        return MaterialPageRoute(builder: (_) => const Inventoryscreen());
      // case addItemsscreen:
      //   return MaterialPageRoute(builder: (_) => const Additemsscreen());
      case reportsscreen:
        return MaterialPageRoute(builder: (_) => const Reportsscreen());
      case settingsscreen:
        return MaterialPageRoute(builder: (_) => const Settingsscreen());

      default:
        // في حال لم يطابق أي مسار
        return MaterialPageRoute(builder: (_) => const Homescreen());
    }
  }
}
