import 'package:activia_goodz/widgets/product_entry_card.dart';
import 'package:flutter/material.dart';
import 'package:activia_goodz/models/product_entry.dart';
import 'package:activia_goodz/screens/product_detail.dart';
import 'package:activia_goodz/widgets/left_drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class ProductEntryPage extends StatefulWidget {
  final String category;
  final String categoryName;

  const ProductEntryPage({
    super.key,
    this.category = '',
    this.categoryName = 'All Products',
  });

  @override
  State<ProductEntryPage> createState() => _ProductEntryPageState();
}

class _ProductEntryPageState extends State<ProductEntryPage> {
  String currentFilter = 'all';

  Future<List<ProductEntry>> fetchProduct(CookieRequest request) async {
    // Build URL dengan filter
    String url = 'https://nisyyah-azzahra-activiagoodz.pbp.cs.ui.ac.id/json/?filter=$currentFilter';
    
    // Tambahkan category filter jika ada
    if (widget.category.isNotEmpty) {
      url += '&category=${widget.category}';
    }
    
    final response = await request.get(url);
    
    var data = response;
    
    List<ProductEntry> listProduct = [];
    for (var d in data) {
      if (d != null) {
        listProduct.add(ProductEntry.fromJson(d));
      }
    }
    return listProduct;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName),
        backgroundColor: const Color(0xFF1F2937), // Gray-800
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Column(
        children: [
          // Filter buttons (All / My Products)
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        currentFilter = 'all';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: currentFilter == 'all' 
                        ? const Color(0xFF1F2937) // Gray-800
                        : Colors.white,
                      foregroundColor: currentFilter == 'all'
                        ? Colors.white
                        : const Color(0xFF374151), // Gray-700
                      side: BorderSide(
                        color: Colors.grey[300]!,
                        width: 1,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      elevation: 0,
                    ),
                    child: const Text('All'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        currentFilter = 'my_products';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: currentFilter == 'my_products'
                        ? const Color(0xFF1F2937) // Gray-800
                        : Colors.white,
                      foregroundColor: currentFilter == 'my_products'
                        ? Colors.white
                        : const Color(0xFF374151), // Gray-700
                      side: BorderSide(
                        color: Colors.grey[300]!,
                        width: 1,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      elevation: 0,
                    ),
                    child: const Text('My Products'),
                  ),
                ),
              ],
            ),
          ),
          
          // Category badge (if filtered by category)
          if (widget.category.isNotEmpty)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              color: const Color(0xFFF9FAFB), // Gray-50
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF06B6D4), // Cyan-600
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.filter_list,
                          size: 16,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Category: ${widget.categoryName}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          
          // Product list
          Expanded(
            child: FutureBuilder(
              future: fetchProduct(request),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Color(0xFF06B6D4), // Cyan-600
                    ),
                  );
                } else {
                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.inventory_2_outlined,
                            size: 80,
                            color: Colors.grey[400],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            currentFilter == 'my_products'
                              ? 'You haven\'t added any products yet.'
                              : 'No products found in this category.',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[600],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => ProductEntryCard(
                        product: snapshot.data![index],
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailPage(
                                product: snapshot.data![index],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}