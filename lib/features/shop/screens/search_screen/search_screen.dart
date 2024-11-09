import 'package:flutter/material.dart';
import 'package:fruitmarket/features/shop/controllers/product_controller.dart';
import 'package:fruitmarket/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:fruitmarket/utils/constants/sizes.dart';
import 'package:get/get.dart';

class SearchScreen extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();
  final productController = Get.find<ProductController>();

  SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Products"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            // حقل البحث
            TextField(
              controller: searchController,
              onChanged: (query) {
                // استدعاء دالة البحث عند إدخال النص
                productController.searchProducts(query);
              },
              decoration: InputDecoration(
                labelText: "Search for Products",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),

            // عرض المنتجات بناءً على البحث
            Obx(() {
              if (productController.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              if (productController.filteredProducts.isEmpty) {
                return const Center(child: Text("No Products Found"));
              }

              return Expanded(
                child: ListView.builder(
                  itemCount: productController.filteredProducts.length,
                  itemBuilder: (context, index) {
                    final product = productController.filteredProducts[index];
                    return TProductCardVertical(product: product);
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
