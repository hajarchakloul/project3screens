import 'package:flutter/material.dart';
import 'package:project3screens/widgets/test.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<Map<String, dynamic>> products = [
    {
      'productImage': "assets/images/profile.png",
      'productName': "Coca-Cola",
      'userImage': "https://via.placeholder.com/40",
      'userName': "Ahmed Ali",
      'time': "10:00 AM",
      'trending': true,
    },
    {
      'productImage': "assets/images/profile.png",
      'productName': "Pepsi",
      'userImage': "https://via.placeholder.com/40",
      'userName': "Sarah Mohamed",
      'time': "11:15 AM",
      'trending': false,
    },
    {
      'productImage': "assets/images/profile.png",
      'productName': "Fanta",
      'userImage': "https://via.placeholder.com/40",
      'userName': "Khaled Youssef",
      'time': "12:30 PM",
      'trending': true,
    },
    {
      'productImage': "assets/images/profile.png",
      'productName': "Sprite",
      'userImage': "https://via.placeholder.com/40",
      'userName': "Laila Hassan",
      'time': "1:45 PM",
      'trending': false,
    },
    {
      'productImage': "assets/images/profile.png",
      'productName': "7UP",
      'userImage': "https://via.placeholder.com/40",
      'userName': "Mohamed Ibrahim",
      'time': "2:00 PM",
      'trending': true,
    },
    {
      'productImage': "assets/images/profile.png",
      'productName': "Mirinda",
      'userImage': "https://via.placeholder.com/40",
      'userName': "Noura Samir",
      'time': "3:15 PM",
      'trending': false,
    },
    {
      'productImage': "assets/images/profile.png",
      'productName': "Red Bull",
      'userImage': "https://via.placeholder.com/40",
      'userName': "Amr Saeed",
      'time': "4:30 PM",
      'trending': true,
    },
    {
      'productImage': "assets/images/profile.png",
      'productName': "Lipton Ice Tea",
      'userImage': "https://via.placeholder.com/40",
      'userName': "Mona Abdullah",
      'time': "5:45 PM",
      'trending': false,
    },
    {
      'productImage': "assets/images/profile.png",
      'productName': "Tropicana",
      'userImage': "https://via.placeholder.com/40",
      'userName': "Hesham Kamal",
      'time': "6:00 PM",
      'trending': true,
    },
    {
      'productImage': "assets/images/profile.png",
      'productName': "Mecca Cola",
      'userImage': "https://via.placeholder.com/40",
      'userName': "Fatima Zahra",
      'time': "7:15 PM",
      'trending': false,
    },
  ];

  final List<Map<String, dynamic>> statsData = [
    {
      'icon': Icons.inventory_2_outlined,
      'value': '60',
      'label': 'Out of stock',
    },
    {
      'icon': Icons.warning,
      'value': '360',
      'label': 'Low stock',
    },
    {
      'icon': Icons.shopping_basket,
      'value': '360',
      'label': 'Total items',
    },
  ];

  int _currentIndex = 0;
  TextEditingController _searchController = TextEditingController();
  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    final filteredProducts = products.where((product) =>
        product['productName'].toLowerCase().contains(searchQuery)).toList();

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        leadingWidth: 70,
        leading: Container(
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(20)),
          margin: const EdgeInsets.only(left: 17, top: 4, bottom: 4, right: 5),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              "assets/images/profile.png",
              width: 60,
              height: 60,
              fit: BoxFit.fill,
              errorBuilder: (context, error, stackTrace) {
                return Icon(
                  Icons.person,
                  size: 60,
                  color: Colors.black.withOpacity(0.7),
                );
              },
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
          const Padding(padding: EdgeInsets.all(5)),
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
          ),
          const Padding(padding: EdgeInsets.all(5)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            // search row
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextField(
                      controller: _searchController,
                      decoration: const InputDecoration(
                        hintText: "Search",
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search),
                        prefixIconConstraints: BoxConstraints(minWidth: 40),
                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                      ),
                      onChanged: (value) {
                        setState(() {
                          searchQuery = value.toLowerCase();
                        });
                      },
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
            ),

            const SizedBox(height: 10),

            // stats row
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: statsData.asMap().entries.map((entry) {
                    return Container(
                      width: 150,
                      margin: const EdgeInsets.only(right: 12),
                      child: _buildStatsCard(entry.value),
                    );
                  }).toList(),
                ),
              ),
            ),

            const Padding(padding: EdgeInsets.all(5)),

            // titles row
            Row(children: [
              const Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      " Recent Documents",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.all(5)),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Text(
                      " View All",
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                  ),
                ),
              ),
            ]),

            const Padding(padding: EdgeInsets.all(10)),

            // products list
            Expanded(
              child: ListView.builder(
                itemCount: filteredProducts.length,
                itemBuilder: (context, index) {
                  final product = filteredProducts[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  blurRadius: 8,
                                  spreadRadius: 2,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    product['productImage'],
                                    width: 60,
                                    height: 60,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return const Icon(Icons.broken_image,
                                          size: 60,
                                          color: Color.fromARGB(255, 243, 232, 231));
                                    },
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        product['productName'],
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 10,
                                            backgroundImage:
                                                NetworkImage(product['userImage']),
                                            onBackgroundImageError: (_, __) =>
                                                debugPrint("Failed to load image"),
                                            child: const Icon(Icons.person, size: 12),
                                          ),
                                          const SizedBox(width: 6),
                                          Text(
                                            product['userName'],
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        product['time'],
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Icon(
                                  product['trending']
                                      ? Icons.trending_up
                                      : Icons.trending_down,
                                  color: product['trending'] ? Colors.green : Colors.red,
                                  size: 24,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: MainFloatingActionButton(
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: MainBottomNavigationBar(
        currentIndex: _currentIndex,
        context: context,
      ),
    );
  }

  Widget _buildStatsCard(Map<String, dynamic> data) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 8,
              spreadRadius: 2,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                data['icon'] as IconData,
                color: Colors.blue,
                size: 20,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              data['value'],
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              data['label'],
              style: const TextStyle(
                fontSize: 13,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
