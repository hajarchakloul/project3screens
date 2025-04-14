import 'package:flutter/material.dart';
import 'package:project3screens/widgets/test.dart';

class Reportsscreen extends StatefulWidget {
  const Reportsscreen({super.key});

  @override
  State<Reportsscreen> createState() => _ReportsscreenState();
}

class _ReportsscreenState extends State<Reportsscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('reports'),
      ),
      body: const Center(
        child: Text(
          ' reports screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
      bottomNavigationBar: MainBottomNavigationBar(
        currentIndex: 2,
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
