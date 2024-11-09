import 'package:flutter/material.dart';
import 'package:fruitmarket/common/widgets/layouts/grid_layout.dart';
import 'package:fruitmarket/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:fruitmarket/features/shop/controllers/product_controller.dart';
import 'package:fruitmarket/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TSortableProducts extends StatelessWidget {
  const TSortableProducts({super.key});

  @override
  Widget build(BuildContext context) {
    final productController = Get.put(ProductController());

    return Column(
      children: [
        // Dropdown for sorting products
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          onChanged: (value) {},
          items: [
            "Name",
            "Higher Price",
            "Lower Price",
            "Sale",
            "Newest",
            "Popularity"
          ]
              .map((option) =>
                  DropdownMenuItem(value: option, child: Text(option)))
              .toList(),
        ),
        const SizedBox(height: TSizes.spaceBtwSections),

        // Popular Products List
        Obx(() {
          if (productController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          if (productController.allProducts.isEmpty) {
            return const Center(child: Text("No Products Available"));
          }

          return TGridLayout(
            itemCount: productController.allProducts.length,
            itemBuilder: (_, index) {
              final product = productController.allProducts[index];
              return TProductCardVertical(product: product);
            },
          );
        }),
      ],
    );
  }
}
