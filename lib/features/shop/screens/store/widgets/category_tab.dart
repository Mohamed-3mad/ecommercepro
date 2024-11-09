// import 'package:flutter/material.dart';
// import 'package:fruitmarket/common/widgets/brands/brand_show_case.dart';
// import 'package:fruitmarket/common/widgets/layouts/grid_layout.dart';
// import 'package:fruitmarket/common/widgets/products/product_cards/product_card_vertical.dart';
// import 'package:fruitmarket/common/widgets/texts/section_heading.dart';
// import 'package:fruitmarket/features/shop/controllers/product_controller.dart';
// import 'package:fruitmarket/features/shop/models/category_model.dart';
// import 'package:fruitmarket/utils/constants/image_strings.dart';
// import 'package:fruitmarket/utils/constants/sizes.dart';
// import 'package:get/get.dart';

// class TCategoryTab extends StatelessWidget {
//   const TCategoryTab({super.key, required this.category});
//   final CategoryModel category;

//   @override
//   Widget build(BuildContext context) {
//     final productController = Get.put(ProductController());
//     return ListView(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(TSizes.defaultSpace),
//           child: Column(
//             children: [
//               //Brands
//               const TBrandShowcase(images: [
//                 TImages.product1,
//                 TImages.product2,
//                 TImages.product3
//               ]),
//               const TBrandShowcase(images: [
//                 TImages.product1,
//                 TImages.product2,
//                 TImages.product3
//               ]),
//               const SizedBox(height: TSizes.spaceBtwItems),

//               //Products
//               TSectionHeading(title: "You might like", onPressed: () {}),
//               const SizedBox(height: TSizes.spaceBtwItems),
//               // Popular Products List
//               Obx(() {
//                 if (productController.isLoading.value) {
//                   return const Center(child: CircularProgressIndicator());
//                 }

//                 if (productController.allProducts.isEmpty) {
//                   return const Center(child: Text("No Products Available"));
//                 }

//                 return TGridLayout(
//                   itemCount: productController.allProducts.length,
//                   itemBuilder: (_, index) {
//                     final product = productController.allProducts[index];
//                     return TProductCardVertical(product: product);
//                   },
//                 );
//               }),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:fruitmarket/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:fruitmarket/features/shop/models/products_model.dart';
import 'package:fruitmarket/common/widgets/layouts/grid_layout.dart';

class TCategoryTab extends StatelessWidget {
  final List<ProductModel> products;

  const TCategoryTab({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) {
      return const Center(child: Text("No products found for this category."));
    }
    return TGridLayout(
      itemCount: products.length,
      itemBuilder: (_, index) {
        final product = products[index];
        return TProductCardVertical(
            product: product); // Adjust based on your widget for products
      },
    );
  }
}
