import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddItemScreen extends StatefulWidget {
  final Function(Map<String, dynamic>) onSave;

  const AddItemScreen({super.key, required this.onSave});

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  final _formKey = GlobalKey<FormState>();
  final List<File> _selectedImages = [];
  final ImagePicker _picker = ImagePicker();

  // Controllers
  final TextEditingController _itemNameController = TextEditingController();
  final TextEditingController _departmentController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _unitPriceController = TextEditingController();
  final TextEditingController _barcodeController = TextEditingController();
  final TextEditingController _supplierDetailsController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  // Colors
  final Color primaryBlue = const Color(0xFF2979FF);
  final Color lightBlue = const Color(0xFFE3F2FD);
  final Color darkBlue = const Color(0xFF1565C0);

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImages.add(File(pickedFile.path));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Add New Item", 
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 0, 0, 0), // Dark blue color
            fontSize: 20
          ),
        ),
        automaticallyImplyLeading: false, // إزالة سهم العودة
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: darkBlue),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Image upload area
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  height: 180,
                  decoration: BoxDecoration(
                    color: lightBlue,
                    borderRadius: BorderRadius.circular(20),
                    // ignore: deprecated_member_use
                    border: Border.all(color: primaryBlue.withOpacity(0.3), width: 2),
                    boxShadow: [
                      BoxShadow(
                        // ignore: deprecated_member_use
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          // ignore: deprecated_member_use
                          color: primaryBlue.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.cloud_upload, size: 45, color: primaryBlue),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        _selectedImages.isEmpty 
                            ? "Upload Product Images"
                            : "${_selectedImages.length} image(s) selected",
                        style: TextStyle(
                          color: darkBlue,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      if (_selectedImages.isEmpty)
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            "Tap to browse gallery",
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 14,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              
              const SizedBox(height: 25),
              
              // Section title
              Padding(
                padding: const EdgeInsets.only(left: 5, bottom: 15),
                child: Text(
                  "Basic Information",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: darkBlue,
                  ),
                ),
              ),
              
              // Item Name and Department
              _buildRow([
                _buildTextField(_itemNameController, "Item Name", isRequired: true, icon: Icons.shopping_bag_outlined),
                _buildTextField(_departmentController, "Department", isRequired: true, icon: Icons.category_outlined),
              ]),
              
              const SizedBox(height: 20),
              
              // Quantity and Category
              _buildRow([
                _buildTextField(_quantityController, "Quantity", 
                  isRequired: true, keyboardType: TextInputType.number, icon: Icons.inventory_2_outlined),
                _buildTextField(_categoryController, "Category", isRequired: true, icon: Icons.folder_outlined),
              ]),
              
              const SizedBox(height: 20),
              
              // Unit Price and Barcode
              _buildRow([
                _buildTextField(_unitPriceController, "Unit Price", 
                  isRequired: true, prefix: "\$", icon: Icons.attach_money),
                _buildTextField(_barcodeController, "Barcode", isRequired: true, icon: Icons.qr_code),
              ]),
              
              const SizedBox(height: 25),
              
              // Section title
              Padding(
                padding: const EdgeInsets.only(left: 5, bottom: 15),
                child: Text(
                  "Additional Details",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: darkBlue,
                  ),
                ),
              ),
              
              // Supplier Details
              _buildTextField(_supplierDetailsController, "Supplier Details", 
                isRequired: true, icon: Icons.business_outlined),
              
              const SizedBox(height: 20),
              
              // Description
              _buildTextField(
                _descriptionController, 
                "Product Description", 
                maxLines: 4, 
                isRequired: true,
                icon: Icons.description_outlined,
                hintText: "Enter details about the product...",
              ),
              
              const SizedBox(height: 30),
              
              // Action Buttons
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        side: BorderSide(color: primaryBlue, width: 1.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        "Cancel", 
                        style: TextStyle(
                          color: primaryBlue, 
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryBlue,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: _saveItem,
                      child: const Text(
                        "Save Item", 
                        style: TextStyle(
                          color: Colors.white, 
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRow(List<Widget> children) {
    return Row(
      children: [
        Expanded(child: children[0]),
        const SizedBox(width: 15),
        Expanded(child: children[1]),
      ],
    );
  }

  Widget _buildTextField(
    TextEditingController controller, 
    String label, {
    int maxLines = 1,
    TextInputType? keyboardType,
    String? prefix,
    bool isRequired = false,
    IconData? icon,
    String? hintText,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines,
        style: const TextStyle(fontSize: 15),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: Colors.grey[700],
            fontSize: 15,
          ),
          prefixIcon: icon != null ? Icon(icon, color: primaryBlue, size: 22) : null,
          prefixText: prefix,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
          suffixIcon: isRequired 
            ? Icon(Icons.star, color: Colors.red[300], size: 10) 
            : null,
          suffixIconConstraints: const BoxConstraints(minWidth: 20, minHeight: 20),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            // ignore: deprecated_member_use
            borderSide: BorderSide(color: primaryBlue.withOpacity(0.3), width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: primaryBlue, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.red[300]!, width: 1.5),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.red[300]!, width: 2),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16, 
            vertical: maxLines > 1 ? 20 : 16
          ),
        ),
        validator: (value) {
          if (isRequired && (value == null || value.isEmpty)) {
            return 'This field is required';
          }
          return null;
        },
      ),
    );
  }

  void _saveItem() {
    if (_formKey.currentState!.validate() && _selectedImages.isNotEmpty) {
      widget.onSave({
        'name': _itemNameController.text,
        'stock': "${_quantityController.text} in Stock", // Format to match expected format
        'code': _barcodeController.text, // Use barcode as code
        'price': "\$${_unitPriceController.text}",
        'department': _departmentController.text,
        'category': _categoryController.text,
        'supplier': _supplierDetailsController.text,
        'description': _descriptionController.text,
        'images': _selectedImages, // Maintain the image files
      });
      Navigator.pop(context);
    } else if (_selectedImages.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Please upload at least one image'),
          backgroundColor: primaryBlue,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          margin: const EdgeInsets.all(10),
        ),
      );
    }
  }
}