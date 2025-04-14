import 'package:flutter/material.dart';
import 'package:project3screens/widgets/test.dart';

class Settingsscreen extends StatefulWidget {
  const Settingsscreen({super.key});

  @override
  State<Settingsscreen> createState() => _SettingsscreenState();
}

class _SettingsscreenState extends State<Settingsscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('settings'),
      ),
      body: const Center(
        child: Text(
          ' settings screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
      bottomNavigationBar: MainBottomNavigationBar(
        currentIndex: 3,
        context: context, 
      ),
      floatingActionButton: MainFloatingActionButton(
        onPressed: () {
          print('تم الضغط على زر المسح!');
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

}