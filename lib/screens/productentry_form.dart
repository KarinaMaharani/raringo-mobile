import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:raringo/widgets/left_drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class ProductEntryFormPage extends StatefulWidget {
  const ProductEntryFormPage({super.key});

  @override
  State<ProductEntryFormPage> createState() => _ProductEntryFormPageState();
}

class _ProductEntryFormPageState extends State<ProductEntryFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _productname = "";
  String _description = "";
  int _price = 0;
  String _tags = "";
  int _ratings = 0;
  String _imgurl = "";

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Form Tambah Produk',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'Silkscreen',
          ),
        ),
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextField(
                label: "Product Name",
                hintText: "Product Name",
                onChanged: (value) => _productname = value!,
                validator: (value) => value == null || value.isEmpty
                    ? "Nama Produk tidak boleh kosong!"
                    : null,
              ),
              _buildTextField(
                label: "Description",
                hintText: "Description",
                onChanged: (value) => _description = value!,
                validator: (value) => value == null || value.isEmpty
                    ? "Deskripsi tidak boleh kosong!"
                    : null,
              ),
              _buildTextField(
                label: "Price",
                hintText: "Price",
                keyboardType: TextInputType.number,
                onChanged: (value) => _price = int.tryParse(value!) ?? 0,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Harga tidak boleh kosong!";
                  }
                  if (int.tryParse(value) == null) {
                    return "Harga harus berupa angka!";
                  }
                  if (_price < 0) {
                    return "Harga tidak boleh bernilai negatif!";
                  }
                  return null;
                },
              ),
              _buildTextField(
                label: "Tags",
                hintText: "Tags",
                onChanged: (value) => _tags = value!,
                validator: (value) => value == null || value.isEmpty
                    ? "Tags tidak boleh kosong!"
                    : null,
              ),
              _buildTextField(
                label: "Ratings",
                hintText: "Ratings",
                keyboardType: TextInputType.number,
                onChanged: (value) => _ratings = int.tryParse(value!) ?? 0,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Ratings tidak boleh kosong!";
                  }
                  if (int.tryParse(value) == null) {
                    return "Ratings harus berupa angka bulat!";
                  }
                  if (_ratings < 0 || _ratings > 5) {
                    return "Nilai Ratings harus berada di antara 0 - 5";
                  }
                  return null;
                },
              ),
              _buildTextField(
                label: "Image URL",
                hintText: "Image URL",
                onChanged: (value) => _imgurl = value!,
                validator: (value) => value == null || value.isEmpty
                    ? "URL tidak boleh kosong!"
                    : null,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        // Collecting the current date
                        final String currentDate = DateTime.now()
                            .toIso8601String()
                            .split('T')[0];

                        final response = await request.postJson(
                          "http://127.0.0.1:8000/create-flutter/",
                          jsonEncode({
                            'name': _productname,
                            'price': _price.toString(),
                            'description': _description,
                            'time': currentDate,
                            'tags': _tags,
                            'ratings': _ratings.toString(),
                            'image_url': _imgurl,
                          }),
                        );

                        if (context.mounted) {
                          if (response['status'] == 'success') {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Produk baru berhasil disimpan!"),
                              ),
                            );
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ProductEntryFormPage()),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    "Terdapat kesalahan, silakan coba lagi."),
                              ),
                            );
                          }
                        }
                      }
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding _buildTextField({
    required String label,
    required String hintText,
    required Function(String?) onChanged,
    required String? Function(String?)? validator,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hintText,
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        onChanged: onChanged,
        validator: validator,
        keyboardType: keyboardType,
      ),
    );
  }
}
