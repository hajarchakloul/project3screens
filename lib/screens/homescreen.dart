import 'package:flutter/material.dart';
import 'package:project3screens/screens/cart_screen.dart';
import 'package:project3screens/widgets/test.dart'; // تأكد من وجود الملف المناسب

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  
  List<Map<String, dynamic>> products = [
  {
    'productImage': "assets/images/arkan.png",
    'productName': "زيت أركان",
    'price': "120.0",
    'userImage': "https://via.placeholder.com/40",
    'userName': "أمينة بنحمو",
    'time': "9:00 AM",
    'trending': true,
  },
  {
    'productImage': "assets/images/qaftan1.jpg" ,
        'productName': "قفطان مغربي",
    'price': "850.0",
    'userImage': "https://via.placeholder.com/40",
    'userName': "سفيان الإدريسي",
    'time': "10:30 AM",
    'trending': true,
  },
    {
    'productImage': "assets/images/tajin.png",
    'productName': "طاجين مغربي",
    'price': "250.0",
    'userImage': "https://via.placeholder.com/40",
    'userName': "زهرة الكتاني",
    'time': "7:30 PM",
    'trending': true,
  },
  {
    'productImage': "assets/images/atay.png",
    'productName': "شاي مغربي",
    'price': "45.0",
    'userImage': "https://via.placeholder.com/40",
    'userName': "حسناء العلوي",
    'time': "11:45 AM",
    'trending': false,
  },
  {
    'productImage': "assets/images/arkan.png",
    'productName': "زيت أركان",
    'price': "120.0",
    'userImage': "https://via.placeholder.com/40",
    'userName': "أمينة بنحمو",
    'time': "9:00 AM",
    'trending': true,
  },
  {
    'productImage': "assets/images/qaftan1.jpg" ,
        'productName': "قفطان مغربي",
    'price': "850.0",
    'userImage': "https://via.placeholder.com/40",
    'userName': "سفيان الإدريسي",
    'time': "10:30 AM",
    'trending': true,
  },
    {
    'productImage': "assets/images/tajin.png",
    'productName': "طاجين مغربي",
    'price': "250.0",
    'userImage': "https://via.placeholder.com/40",
    'userName': "زهرة الكتاني",
    'time': "7:30 PM",
    'trending': true,
  },
  {
    'productImage': "assets/images/atay.png",
    'productName': "شاي مغربي",
    'price': "45.0",
    'userImage': "https://via.placeholder.com/40",
    'userName': "حسناء العلوي",
    'time': "11:45 AM",
    'trending': false,
  },
    // ... باقي المنتجات كما في السابق
  ];

  final List<Map<String, dynamic>> statsData = [
    {
      'icon': Icons.inventory,
      'value': '120',
      'label': 'In Stock',
    },
    {
      'icon': Icons.shopping_cart,
      'value': '45',
      'label': 'Orders',
    },
    {
      'icon': Icons.attach_money,
      'value': '8500',
      'label': 'Revenue',
    },
  ];

  final int _currentIndex = 0;
  final TextEditingController _searchController = TextEditingController();
  String searchQuery = "";

  // Add these properties
  List<Map<String, dynamic>> cartItems = [];
  
  // Add this method to add items to cart
  void addToCart(Map<String, dynamic> product) {
    setState(() {
      final existingItem = cartItems.firstWhere(
        (item) => item['productName'] == product['productName'],
        orElse: () => {},
      );

      if (existingItem.isEmpty) {
        cartItems.add({
          ...product,
          'quantity': 1,
        });
      } else {
        existingItem['quantity'] += 1;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${product['productName']} added to cart'),
          duration: const Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
          action: SnackBarAction(
            label: 'View Cart',
            onPressed: () => _showCart(),
          ),
        ),
      );
    });
  }

  // Add these methods to the _HomescreenState class
  void _showCart() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CartScreen(
          cartItems: cartItems,
          onRemove: _removeFromCart,
          onUpdateQuantity: _updateCartItemQuantity,
        ),
      ),
    );
  }

  void _removeFromCart(Map<String, dynamic> item) {
    setState(() {
      cartItems.removeWhere((cartItem) => cartItem['productName'] == item['productName']);
    });
  }

  void _updateCartItemQuantity(Map<String, dynamic> item, int quantity) {
    setState(() {
      final index = cartItems.indexWhere(
        (cartItem) => cartItem['productName'] == item['productName'],
      );
      if (index != -1) {
        cartItems[index]['quantity'] = quantity;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final filteredProducts = products.where((product) =>
        product['productName'].toLowerCase().contains(searchQuery)).toList();

    return Scaffold(
      drawer: _buildDrawer(),
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "My Store",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart_outlined, color: Colors.black),
                onPressed: _showCart,
              ),
              if (cartItems.isNotEmpty)
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 20,
                      minHeight: 20,
                    ),
                    child: Text(
                      '${cartItems.length}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextField(
                controller: _searchController,
                onChanged: (value) {
                  setState(() {
                    searchQuery = value.toLowerCase();
                  });
                },
                decoration: const InputDecoration(
                  hintText: "Search products...",
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Statistics
            SizedBox(
              height: 120,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: statsData.length,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  return _buildStatsCard(statsData[index]);
                },
              ),
            ),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Popular Products", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text("See All", style: TextStyle(color: Colors.grey)),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.only(top: 10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.75,
                ),
                itemCount: filteredProducts.length,
                itemBuilder: (context, index) {
                  final product = filteredProducts[index];
                  return _buildProductCard(product);
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: MainFloatingActionButton(onPressed: () {}),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: MainBottomNavigationBar(currentIndex: _currentIndex, context: context),
    );
  }

  Widget _buildStatsCard(Map<String, dynamic> data) {
    return Container(
      width: 120,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          // ignore: deprecated_member_use
          BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 8, offset: const Offset(0, 4)),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(data['icon'], color: Colors.blue, size: 30),
          const SizedBox(height: 10),
          Text(data['value'].toString(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 4),
          Text(data['label'], style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildProductCard(Map<String, dynamic> product) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          // ignore: deprecated_member_use
          BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 8, offset: const Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: Image.asset(product['productImage'], height: 120, width: double.infinity, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(product['productName'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text("\$${product['price']}", style: const TextStyle(color: Colors.green, fontSize: 14, fontWeight: FontWeight.bold)),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      product['trending'] ? "Trending" : "New",
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.add_shopping_cart),
                  onPressed: () => addToCart(product),
                  color: Colors.blue,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

Widget _buildDrawer() {
  return Drawer(
    backgroundColor: Colors.white,
    child: Column(
      children: [
        DrawerHeader(
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
      gradient: LinearGradient(
        colors: [Color(0xFF90CAF9), Color(0xFF64B5F6)], // درجات اللون الأزرق
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
          child: Row(
            children: [
              const CircleAvatar(
                radius: 35,
                backgroundImage: AssetImage("assets/icons/app_icon.png"),
              ),
              const SizedBox(width: 12),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("مرحبًا بك 👋", style: TextStyle(fontSize: 16, color: Colors.black87)),
                  SizedBox(height: 4),
                  Text("هجر شقلول", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
                ],
              ),
            ],
          ),
        ),

        // عناصر القائمة
        _buildDrawerItem(Icons.home_outlined, "الرئيسية", () {
          Navigator.pop(context);
        }),
        _buildDrawerItem(Icons.inventory_2_outlined, "المخزون", () {
          Navigator.pushNamed(context, '/inventory');
        }),
        _buildDrawerItem(Icons.analytics_outlined, "التقارير", () {
          Navigator.pushNamed(context, '/reports');
        }),
        _buildDrawerItem(Icons.settings_outlined, "الإعدادات", () {
          Navigator.pushNamed(context, '/settings');
        }),

        const Spacer(),

        // تسجيل الخروج
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ElevatedButton.icon(
onPressed: () {
  // يمكنك إضافة كود لحذف بيانات من SharedPreferences مثلاً

Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
},

            icon: const Icon(Icons.logout, color: Colors.white),
            label: const Text("تسجيل الخروج", style: TextStyle(color: Colors.white)),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              elevation: 0,
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    ),
  );
  }
Widget _buildDrawerItem(IconData icon, String title, VoidCallback onTap) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    child: InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
Icon(icon, size: 24, color: Colors.blue), // بدل Colors.teal
            const SizedBox(width: 16),
            Text(title, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    ),
  );
}

}
