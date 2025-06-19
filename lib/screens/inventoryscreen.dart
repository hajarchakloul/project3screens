import 'package:flutter/material.dart';
import 'package:project3screens/screens/add_item_screen.dart';
import 'package:project3screens/screens/edit_item_screen.dart';
import 'package:project3screens/widgets/test.dart';

class Inventoryscreen extends StatefulWidget {
  const Inventoryscreen({super.key});

  @override
  State<Inventoryscreen> createState() => _InventoryscreenState();
}

class _InventoryscreenState extends State<Inventoryscreen> {
  final List<Map<String, dynamic>> products = [
    {
      'name': 'قفطان مغربي (ملابس)',
      'stock': '36 in Stock',
      'code': '36985214753951',
      'price': '\$15.00',
      'image': "assets/images/qaftan1.jpg",
    },
    {
      'name': 'طاجين (اكلات)',
      'stock': '30 in Stock',
      'code': '36985214753951',
      'price': '\$05.00',
      'image': "assets/images/tajin.png",
    },
    {
      'name': 'زيت اركان (زيوت)',
      'stock': '40 in Stock',
      'code': '36985214753951',
      'price': '\$12.00',
      'image': "assets/images/arkan.png",
    },
    {
      'name': 'اتاي مغربي (مشروبات)',
      'stock': '36 in Stock',
      'code': '36985214753951',
      'price': '\$15.00',
      'image': "assets/images/atay.png",
    },
    {
      'name': 'املو (اكلات)',
      'stock': '30 in Stock',
      'code': '36985214753951',
      'price': '\$05.00',
      'image': "assets/images/amlou.png",
    },
    {
      'name': 'قفطان مغربي (ملابس)',
      'stock': '36 in Stock',
      'code': '36985214753951',
      'price': '\$15.00',
      'image': "assets/images/qaftan1.jpg",
    },
    {
      'name': 'طاجين (اكلات)',
      'stock': '30 in Stock',
      'code': '36985214753951',
      'price': '\$05.00',
      'image': "assets/images/tajin.png",
    },
    {
      'name': 'زيت اركان (زيوت)',
      'stock': '40 in Stock',
      'code': '36985214753951',
      'price': '\$12.00',
      'image': "assets/images/arkan.png",
    },
    {
      'name': 'اتاي مغربي (مشروبات)',
      'stock': '36 in Stock',
      'code': '36985214753951',
      'price': '\$15.00',
      'image': "assets/images/atay.png",
    },
    {
      'name': 'املو (اكلات)',
      'stock': '30 in Stock',
      'code': '36985214753951',
      'price': '\$05.00',
      'image': "assets/images/amlou.png",
    },
  ];

  String searchQuery = '';

  List<Map<String, dynamic>> get filteredProducts {
    return products.where((product) {
      final name = product['name']?.toLowerCase().trim() ?? '';
      final query = searchQuery.toLowerCase().trim();
      return name.contains(query);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
      backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: const Text('Inventory'),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
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
                          onChanged: (value) {
                            setState(() {
                              searchQuery = value;
                            });
                          },
                          decoration: const InputDecoration(
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
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 1),
                          child: Text(
                            "Items",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 1),
                          child: Text(
                            "View All",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600]),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: filteredProducts.isEmpty
                      ? Center(
                          child: Text(
                            'No items found',
                            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                          ),
                        )
                      : ListView.builder(
                          itemCount: filteredProducts.length,
                          itemBuilder: (context, index) {
                            final product = filteredProducts[index];
                            final originalIndex = products.indexOf(product);

                            return _buildSwipeableCard(
                              productName: product['name'] ?? 'no name',
                              stock: product['stock'] ?? 'no stock',
                              price: product['price'] ?? 'no price',
                              code: product['code'] ?? 'no code',
                              image: product['image'],
                              index: originalIndex,
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 16,
            bottom: 20,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    // ignore: deprecated_member_use
                    color: Colors.blue.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: IconButton(
                onPressed: _showAddProductDialog,
                icon: const Icon(Icons.add, color: Colors.white, size: 28),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: MainBottomNavigationBar(
        currentIndex: 1,
        context: context,
      ),
      floatingActionButton: MainFloatingActionButton(
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void _deleteProduct(int index) {
    setState(() {
      products.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Product successfully deleted'),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _editProduct(int index) async {
    final updatedProduct = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditItemScreen(
          item: products[index],
          onUpdate: (updatedItem) => updatedItem,
        ),
      ),
    );

    if (updatedProduct != null) {
      setState(() {
        products[index] = updatedProduct;
      });
    }
  }

  void _showAddProductDialog() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddItemScreen(
          onSave: (newProduct) {
            setState(() {
              products.add(newProduct);
            });
          },
        ),
      ),
    );
  }

  Widget _buildSwipeableCard({
    required String productName,
    required String stock,
    required String price,
    required String code,
    String? image,
    required int index,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Dismissible(
        key: Key(productName + index.toString()),
        background: Container(
          decoration: BoxDecoration(
            color: Colors.red[50],
            borderRadius: BorderRadius.circular(15),
          ),
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 20),
          child: const Icon(Icons.delete_outline, color: Colors.red, size: 28),
        ),
        secondaryBackground: Container(
          decoration: BoxDecoration(
            color: Colors.blue[50],
            borderRadius: BorderRadius.circular(15),
          ),
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 20),
          child: const Icon(Icons.edit_outlined, color: Colors.blue, size: 28),
        ),
        confirmDismiss: (direction) async {
          if (direction == DismissDirection.endToStart) {
            final result = await _showEditConfirmation(context, productName);
            if (result == true) _editProduct(index);
            return false;
          } else if (direction == DismissDirection.startToEnd) {
            final result = await _showDeleteConfirmation(context, productName);
            if (result == true) {
              _deleteProduct(index);
              return true;
            }
            return false;
          }
          return false;
        },
        child: _buildInventoryCard(
          productName: productName,
          stock: stock,
          price: price,
          code: code,
          image: image,
        ),
      ),
    );
  }

  Widget _buildInventoryCard({
    required String productName,
    required String stock,
    required String price,
    required String code,
    String? image,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: image != null
                  ? Image.asset(image, fit: BoxFit.cover)
                  : Image.asset('assets/images/placeholder.jpg', fit: BoxFit.cover),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(productName, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                const SizedBox(height: 4),
                Text(stock, style: TextStyle(fontSize: 14, color: Colors.grey[600])),
                const SizedBox(height: 4),
                Text(code, style: TextStyle(fontSize: 12, color: Colors.grey[400])),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              price,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.blue[700]),
            ),
          ),
        ],
      ),
    );
  }

  Future<bool?> _showEditConfirmation(BuildContext context, String productName) {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.edit, color: Colors.blue),
            ),
            const SizedBox(width: 12),
            const Text('Edit Item'),
          ],
        ),
        content: Text('Would you like to edit "$productName"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text('Cancel', style: TextStyle(color: Colors.grey[700])),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            child: const Text('Edit'),
          ),
        ],
        actionsPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }

  Future<bool?> _showDeleteConfirmation(BuildContext context, String productName) {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.red[50],
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.delete, color: Colors.red),
            ),
            const SizedBox(width: 12),
            const Text('Delete Item'),
          ],
        ),
        content: Text('Are you sure you want to delete "$productName"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text('Cancel', style: TextStyle(color: Colors.grey[700])),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            child: const Text('Delete'),
          ),
        ],
        actionsPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }
}