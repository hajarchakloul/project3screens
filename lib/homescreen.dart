import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
          backgroundColor: Colors.grey[300],
          leading: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: SizedBox(

              child: ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: Image.network(
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e1/FullMoon2010.jpg/640px-FullMoon2010.jpg",
                  fit: BoxFit.cover, // تغطية المساحة مع الحفاظ على التناسب
                ),
              ),
            ),
          ),
          actions: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.notifications)),
            ),
            const Padding(
              padding: EdgeInsets.all(5),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
            ),
            const Padding(
              padding: EdgeInsets.all(5),
            ),
          ]),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            // الصف الأول
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: "Search",
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search),
                        prefixIconConstraints: BoxConstraints(minWidth: 40),
                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.tune),
                  ),
                ),
              ],
            ), // انتهاء الصف الأول
            const Padding(
              padding: EdgeInsets.all(5),
            ),
            // الصف الثاني المضاف
            Row(
              children: [
                Expanded(
                    child: Container(
                  width: 40,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                )),
                const Padding(
                  padding: EdgeInsets.all(5),
                ),
                Expanded(
                    child: Container(
                  width: 40,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                )),
                const Padding(
                  padding: EdgeInsets.all(5),
                ),
                Expanded(
                    child: Container(
                  width: 40,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                )),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: Colors.white, // لون الخلفية
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add),
                label: 'Add item',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.inventory),
                label: 'Inventory',
              ),
            ],
            currentIndex: 0,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: true,
            backgroundColor: Colors.transparent, // جعل الخلفية شفافة
            elevation: 0, // إزالة الظل الافتراضي
          ),
        ),
      ),
    );
  }
}
