import 'package:flutter/material.dart';
import 'package:project3screens/routes/route.dart';

class MainLayout extends StatefulWidget {
  final Widget child;
  final int currentIndex;
  final PreferredSizeWidget? appBar; // جعله اختياريًا

  const MainLayout({
    Key? key,
    required this.child,
    required this.currentIndex,
    this.appBar, // إزالة required
  }) : super(key: key);

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    // نحدد الفهرس الابتدائي القادم من الشاشة
    _currentIndex = widget.currentIndex;
  }

  void _onItemTap(int index) {
    setState(() => _currentIndex = index);
    switch (index) {
      case 0:
        Navigator.pushNamed(context, AppRoutes.homescreen);
        break;
      case 1:
        Navigator.pushNamed(context, AppRoutes.inventoryscreen);
        break;
      case 2:
        Navigator.pushNamed(context, AppRoutes.reportsscreen);
        break;
      case 3:
        Navigator.pushNamed(context, AppRoutes.settingsscreen);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.appBar, // إضافة الـ AppBar هنا
      body: widget.child,

      floatingActionButton: SizedBox(
        width: 65,
        height: 65,
        child: FloatingActionButton(
          backgroundColor: Colors.blue,
          child: const Icon(
            Icons.qr_code_scanner,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            print('تم الضغط على زر المسح!');
            // يمكنك التنقل لصفحة أخرى إذا أردت
            // Navigator.pushNamed(context, AppRoutes.addItemsScreen);
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(5)),
        child: BottomAppBar(
          color: Colors.white,
          shape: AutomaticNotchedShape(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            ),
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          notchMargin: 8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _buildNavItem(0, Icons.home_rounded, 'Home'),
              _buildNavItem(1, Icons.inventory_2_rounded, 'Inventory'),
              const SizedBox(width: 15),
              _buildNavItem(2, Icons.analytics_rounded, 'Reports'),
              _buildNavItem(3, Icons.settings_rounded, 'Setting'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    bool isSelected = _currentIndex == index;
    return InkWell(
      onTap: () => _onItemTap(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              transform: Matrix4.identity()..scale(isSelected ? 1.2 : 1.0),
              child: Icon(
                icon,
                color: isSelected ? Colors.blue : Colors.grey.shade600,
                size: 24,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.blue : Colors.grey.shade600,
                fontSize: 11,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
