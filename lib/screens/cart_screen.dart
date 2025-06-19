import 'package:flutter/material.dart';

// تحويل الصفحة إلى StatefulWidget
class CartScreen extends StatefulWidget {
  final List<Map<String, dynamic>> cartItems;
  final Function(Map<String, dynamic>) onRemove;
  final Function(Map<String, dynamic>, int) onUpdateQuantity;

  const CartScreen({
    Key? key,
    required this.cartItems,
    required this.onRemove,
    required this.onUpdateQuantity,
  }) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // نسخة محلية من عناصر السلة
  late List<Map<String, dynamic>> _localCartItems;

  @override
  void initState() {
    super.initState();
    // نسخ العناصر إلى المتغير المحلي
    _localCartItems = List.from(widget.cartItems);
  }

  // حساب المجموع
  double get total => _localCartItems.fold(
        0,
        (sum, item) => sum + (double.parse(item['price']) * item['quantity']),
      );

  // دوال التحديث المحلية
  void _handleRemove(Map<String, dynamic> item) {
    setState(() {
      _localCartItems.removeWhere(
          (cartItem) => cartItem['productName'] == item['productName']);
      widget.onRemove(item); // استدعاء callback الأصلي
    });
  }

  void _handleUpdateQuantity(Map<String, dynamic> item, int quantity) {
    setState(() {
      final index = _localCartItems.indexWhere(
          (cartItem) => cartItem['productName'] == item['productName']);
      if (index != -1) {
        _localCartItems[index]['quantity'] = quantity;
        widget.onUpdateQuantity(item, quantity); // استدعاء callback الأصلي
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Shopping Cart', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false, // إزالة سهم العودة
      ),
      body: _localCartItems.isEmpty
          ? const Center(
              child: Text(
                'السلة فارغة',
                style: TextStyle(fontSize: 18, color: Colors.black54),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 8),
                    itemCount: _localCartItems.length,
                    itemBuilder: (context, index) {
                      final item = _localCartItems[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(
                            vertical: 6, horizontal: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 2,
                        color: Colors.white, // تعيين لون البطاقة إلى الأبيض
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 12),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  item['productImage'],
                                  width: 70,
                                  height: 70,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item['productName'],
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      "\$${item['price']}",
                                      style: const TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // زر إزالة المنتج
                              IconButton(
                                icon: const Icon(Icons.delete_outline,
                                    color: Colors.redAccent),
                                onPressed: () => _handleRemove(item),
                              ),
                              // تحكم بالكمية
                              Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(
                                        Icons.remove_circle_outline,
                                        color: Colors.blue),
                                    onPressed: () {
                                      if (item['quantity'] > 1) {
                                        _handleUpdateQuantity(
                                            item, item['quantity'] - 1);
                                      } else {
                                        _handleRemove(item);
                                      }
                                    },
                                  ),
                                  Text(
                                    '${item['quantity']}',
                                    style: const TextStyle(
                                        fontSize: 16, color: Colors.black87),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.add_circle_outline,
                                        color: Colors.blue),
                                    onPressed: () => _handleUpdateQuantity(
                                        item, item['quantity'] + 1),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 10,
                        offset: const Offset(0, -5),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'الإجمالي: \$${total.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // تنفيذ عملية الدفع أو الانتقال لصفحة الدفع
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF64B5F6), // نفس تدرج الأزرق في الصفحات
                          padding: const EdgeInsets.symmetric(
                            horizontal: 36,
                            vertical: 14,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                        child: const Text(
                          'الدفع',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
