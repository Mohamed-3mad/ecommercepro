import 'package:flutter/material.dart';
import 'package:fruitmarket/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:fruitmarket/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:fruitmarket/common/widgets/layouts/grid_layout.dart';
import 'package:fruitmarket/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:fruitmarket/common/widgets/texts/section_heading.dart';
import 'package:fruitmarket/features/shop/controllers/product_controller.dart';
import 'package:fruitmarket/features/shop/screens/all_products/all_products.dart';
import 'package:fruitmarket/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:fruitmarket/features/shop/screens/home/widgets/home_categories.dart';
import 'package:fruitmarket/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:fruitmarket/utils/constants/colors.dart';
import 'package:fruitmarket/utils/constants/image_strings.dart';
import 'package:fruitmarket/utils/constants/sizes.dart';
import 'package:get/get.dart';

// // class HomeScreen extends StatelessWidget {
// //   const HomeScreen({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     final productController = Get.put(ProductController());
// //     return Scaffold(
// //       body: SingleChildScrollView(
// //         child: Column(
// //           children: [
// //             TPrimaryHeaderContainer(
// //               child: Column(
// //                 children: [
// //                   //AppBar
// //                   const THomeAppBar(),

// //                   const SizedBox(height: TSizes.spaceBtwSections),

// //                   // Search Bar with onChanged event for search functionality
// //                   TSearchContainer(
// //                     text: "Search in Store",
// //                     onChanged: (query) {
// //                       productController.searchProducts(query);
// //                     },
// //                   ),

// //                   const SizedBox(height: TSizes.spaceBtwSections),

// //                   // Categories
// //                   const Padding(
// //                     padding: EdgeInsets.only(left: TSizes.defaultSpace),
// //                     child: Column(
// //                       children: [
// //                         TSectionHeading(
// //                             title: "Popular Categories",
// //                             textColor: TColors.white,
// //                             showActionButton: false),
// //                         SizedBox(height: TSizes.spaceBtwItems),
// //                         THomeCategories(),
// //                       ],
// //                     ),
// //                   ),
// //                   const SizedBox(height: TSizes.spaceBtwSections),
// //                 ],
// //               ),
// //             ),
// //             Padding(
// //               padding: const EdgeInsets.all(TSizes.defaultSpace),
// //               child: Column(
// //                 children: [
// //                   // Slider
// //                   const TPromoSlider(banners: [
// //                     TImages.elecBanner,
// //                     TImages.menBanner,
// //                   ]),
// //                   const SizedBox(height: TSizes.spaceBtwSections),

// //                   // Heading for Popular Products
// //                   TSectionHeading(
// //                       title: 'Popular Products',
// //                       onPressed: () => Get.to(() => const AllProductsScreen())),
// //                   const SizedBox(height: TSizes.spaceBtwItems),

// //                   // Popular Products List
// //                   Obx(() {
// //                     if (productController.isLoading.value) {
// //                       return const Center(child: CircularProgressIndicator());
// //                     }

// //                     if (productController.filteredProducts.isEmpty) {
// //                       return const Center(child: Text("No Products Available"));
// //                     }

// //                     return TGridLayout(
// //                       itemCount: productController.filteredProducts.length,
// //                       itemBuilder: (_, index) {
// //                         final product =
// //                             productController.filteredProducts[index];
// //                         return TProductCardVertical(product: product);
// //                       },
// //                     );
// //                   }),
// //                 ],
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:fruitmarket/common/widgets/custom_shapes/containers/primary_header_container.dart';
// import 'package:fruitmarket/common/widgets/custom_shapes/containers/search_container.dart';
// import 'package:fruitmarket/common/widgets/layouts/grid_layout.dart';
// import 'package:fruitmarket/common/widgets/products/product_cards/product_card_vertical.dart';
// import 'package:fruitmarket/common/widgets/texts/section_heading.dart';
// import 'package:fruitmarket/features/shop/controllers/product_controller.dart';
// import 'package:fruitmarket/features/shop/screens/all_products/all_products.dart';
// import 'package:fruitmarket/features/shop/screens/home/widgets/home_appbar.dart';
// import 'package:fruitmarket/features/shop/screens/home/widgets/home_categories.dart';
// import 'package:fruitmarket/features/shop/screens/home/widgets/promo_slider.dart';
// import 'package:fruitmarket/utils/constants/colors.dart';
// import 'package:fruitmarket/utils/constants/image_strings.dart';
// import 'package:fruitmarket/utils/constants/sizes.dart';
// import 'package:get/get.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final productController = Get.put(ProductController());
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             TPrimaryHeaderContainer(
//               child: Column(
//                 children: [
//                   const THomeAppBar(),
//                   const SizedBox(height: TSizes.spaceBtwSections),

//                   // Search Bar
//                   TSearchContainer(
//                     text: "Search in Store",
//                     onChanged: (query) {
//                       productController.searchProducts(query);
//                     },
//                   ),
//                   const SizedBox(height: TSizes.spaceBtwSections),

//                   // Categories
//                   const Padding(
//                     padding: EdgeInsets.only(left: TSizes.defaultSpace),
//                     child: Column(
//                       children: [
//                         TSectionHeading(
//                             title: "Popular Categories",
//                             textColor: TColors.white,
//                             showActionButton: false),
//                         SizedBox(height: TSizes.spaceBtwItems),
//                         THomeCategories(),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: TSizes.spaceBtwSections),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(TSizes.defaultSpace),
//               child: Column(
//                 children: [
//                   // Promo Slider
//                   const TPromoSlider(banners: [
//                     TImages.elecBanner,
//                     TImages.menBanner,
//                   ]),
//                   const SizedBox(height: TSizes.spaceBtwSections),

//                   // Heading for Popular Products
//                   TSectionHeading(
//                       title: 'Popular Products',
//                       onPressed: () => Get.to(() => const AllProductsScreen())),
//                   const SizedBox(height: TSizes.spaceBtwItems),

//                   // Popular Products List
//                   Obx(() {
//                     if (productController.isLoading.value) {
//                       return const Center(child: CircularProgressIndicator());
//                     }

//                     if (productController.filteredProducts.isEmpty) {
//                       return const Center(child: Text("No Products Available"));
//                     }

//                     // Ensure the GridView doesn't take more space than needed
//                     return TGridLayout(
//                       itemCount: productController.filteredProducts.length,
//                       itemBuilder: (_, index) {
//                         final product =
//                             productController.filteredProducts[index];
//                         return TProductCardVertical(product: product);
//                       },
//                     );
//                   }),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final productController = Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  const THomeAppBar(),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  // Search Bar with FocusNode
                  TSearchContainer(
                    text: "Search in Store",
                    onChanged: (query) {
                      productController.searchProducts(query);
                    },
                    focusNode: _focusNode, // Pass the focus node
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  // Show Column only when TextField is focused
                  const Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        TSectionHeading(
                            title: "Popular Categories",
                            textColor: TColors.white,
                            showActionButton: false),
                        SizedBox(height: TSizes.spaceBtwItems),
                        THomeCategories(),
                      ],
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const TPromoSlider(banners: [
                    TImages.elecBanner,
                    TImages.menBanner,
                  ]),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  TSectionHeading(
                      title: 'Popular Products',
                      onPressed: () => Get.to(() => const AllProductsScreen())),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Obx(() {
                    if (productController.isLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (productController.filteredProducts.isEmpty) {
                      return const Center(child: Text("No Products Available"));
                    }

                    return TGridLayout(
                      itemCount: productController.filteredProducts.length,
                      itemBuilder: (_, index) {
                        final product =
                            productController.filteredProducts[index];
                        return TProductCardVertical(product: product);
                      },
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
