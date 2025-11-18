import 'package:flutter/material.dart';
import 'package:activia_goodz/screens/menu.dart';
import 'package:activia_goodz/screens/productentry_form.dart';
import 'package:activia_goodz/screens/list_productentry.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          // Drawer Header
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color(0xFF1F2937), // Gray-800
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo (optional - jika ada logo)
                const Icon(
                  Icons.store,
                  size: 48,
                  color: Colors.white,
                ),
                const SizedBox(height: 12),
                const Text(
                  'Activia Goodz',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'The easiest way to get the best Goodz',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[300],
                  ),
                ),
              ],
            ),
          ),

          // Home
          ListTile(
            leading: const Icon(
              Icons.home_outlined,
              color: Color(0xFF374151), // Gray-700
            ),
            title: const Text(
              'Halaman Utama',
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(),
                ),
              );
            },
          ),

          // Divider
          Divider(
            thickness: 1,
            color: Colors.grey[300],
            indent: 16,
            endIndent: 16,
          ),

          // Section Title - Categories
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 8, bottom: 4),
            child: Text(
              'CATEGORIES',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.grey[600],
                letterSpacing: 0.5,
              ),
            ),
          ),

          // All Products
          ListTile(
            leading: const Icon(
              Icons.grid_view,
              color: Color(0xFF374151),
            ),
            title: const Text(
              'All Products',
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProductEntryPage(
                    category: '',
                    categoryName: 'All Products',
                  ),
                ),
              );
            },
          ),

          // Women
          ListTile(
            leading: const Icon(
              Icons.woman,
              color: Color(0xFF374151),
            ),
            title: const Text(
              'Women',
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProductEntryPage(
                    category: 'women',
                    categoryName: 'Women',
                  ),
                ),
              );
            },
          ),

          // Men
          ListTile(
            leading: const Icon(
              Icons.man,
              color: Color(0xFF374151),
            ),
            title: const Text(
              'Men',
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProductEntryPage(
                    category: 'men',
                    categoryName: 'Men',
                  ),
                ),
              );
            },
          ),

          // Kids
          ListTile(
            leading: const Icon(
              Icons.child_care,
              color: Color(0xFF374151),
            ),
            title: const Text(
              'Kids',
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProductEntryPage(
                    category: 'kids',
                    categoryName: 'Kids',
                  ),
                ),
              );
            },
          ),

          // Equipment
          ListTile(
            leading: const Icon(
              Icons.sports_soccer,
              color: Color(0xFF374151),
            ),
            title: const Text(
              'Equipment',
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProductEntryPage(
                    category: 'equipment',
                    categoryName: 'Equipment',
                  ),
                ),
              );
            },
          ),

          // Divider
          Divider(
            thickness: 1,
            color: Colors.grey[300],
            indent: 16,
            endIndent: 16,
          ),

          // Section Title - Actions
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 8, bottom: 4),
            child: Text(
              'ACTIONS',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.grey[600],
                letterSpacing: 0.5,
              ),
            ),
          ),

          // Tambah Produk
          ListTile(
            leading: const Icon(
              Icons.add_shopping_cart,
              color: Color(0xFF10B981), // Green-600
            ),
            title: const Text(
              'Tambah Produk',
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProductEntryFormPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}