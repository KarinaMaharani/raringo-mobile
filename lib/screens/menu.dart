import 'package:flutter/material.dart';
import 'package:raringo/widgets/left_drawer.dart';
import 'package:raringo/screens/productentry_form.dart';

class MyHomePage extends StatelessWidget {
  final String npm = '2306165736'; // NPM
  final String name = 'Karina Maharani'; // Nama
  final String className = 'PBP A'; // Kelas

  MyHomePage({super.key});

  final List<ItemHomepage> items = [
    ItemHomepage("Lihat Daftar Produk", Icons.filter),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        
        title: const Text(
          'RARINGO',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'Silkscreen', 
          ),
        ),

        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.white), // Ensures the icon is white
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),

        actions: [
          IconButton(
            icon: const Icon(
              Icons.logout,
              color: Colors.white,),
            onPressed: () {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  const SnackBar(content: Text("Kamu telah menekan tombol Logout!")),
                );
            },
          ),
        ],
        
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: const LeftDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Full-width banner for welcome message
            InfoCard(title: 'Welcome, $name', content: '$npm, $className'),
            const SizedBox(height: 24.0),

            // "Find Your Hobby Products!" text
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 24.0),
              child: Text(
                'Find Your Hobby Products!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            // Large centered button for "Add Product"
            Center(
              child: ElevatedButton.icon(
                icon: const Icon(Icons.open_in_new),
                label: const Text('Lihat Daftar Produk!'),
                onPressed: () {
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      const SnackBar(content: Text("Kamu telah menekan tombol Lihat Daftar Produk!")),
                    );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                  textStyle: const TextStyle(fontSize: 18.0),
                  backgroundColor: Colors.yellow[800],
                  foregroundColor: Colors.white,
                ),
                
              ),
            ),
          ],
        ),
      ),
      
      // Plus button as FloatingActionButton in the bottom-right corner
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text("Kamu telah menekan tombol Tambah Produk!")),
            );
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProductEntryFormPage())
          );
        },
        backgroundColor: Colors.indigo[600],
        child: const Icon(Icons.add),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;  // Judul kartu.
  final String content;  // Isi kartu.

  const InfoCard({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              content,
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemHomepage {
  final String name;
  final IconData icon;

  ItemHomepage(this.name, this.icon);
}
