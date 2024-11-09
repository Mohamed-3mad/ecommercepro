import 'package:flutter/material.dart';
import 'package:fruitmarket/common/widgets/texts/section_heading.dart';
import 'package:fruitmarket/features/shop/models/products_model.dart'; // Import ProductModel
import 'package:fruitmarket/features/shop/screens/product_details/widgets/bottom_add_to_cart_widget.dart';
import 'package:fruitmarket/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:fruitmarket/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:fruitmarket/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:fruitmarket/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:fruitmarket/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:fruitmarket/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModel product; // Add the product parameter

  const ProductDetailsScreen(
      {super.key,
      required this.product}); // Accept the product in the constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: TBottomAddToCart(product: product),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Product Image Slider
            ProductImageSlider(
              productModel: product,
            ), // This can be updated to show images from the product

            // Product Details
            Padding(
              padding: const EdgeInsets.only(
                  right: TSizes.defaultSpace,
                  left: TSizes.defaultSpace,
                  bottom: TSizes.defaultSpace),
              child: Column(
                children: [
                  // Rating and Share Button
                  TRatingAndShare(product: product),

                  // Product Title, Price, Brand, etc.
                  TProductMetaData(
                      product: product), // Pass the product to metadata widget

                  // Attributes
                  ProductAttributes(product: product),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  // Checkout Button
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {}, child: const Text("Checkout"))),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  // Description
                  const TSectionHeading(
                      title: "Description", showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  ReadMoreText(
                    product.description, // Display product description
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Show Less',
                    moreStyle: const TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 14,
                        fontWeight: FontWeight.w800),
                    lessStyle: const TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 14,
                        fontWeight: FontWeight.w800),
                  ),

                  // Review Section
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TSectionHeading(
                          title: "Reviews(199)", showActionButton: false),
                      IconButton(
                          onPressed: () =>
                              Get.to(() => const ProductReviewsScreen()),
                          icon: const Icon(Iconsax.arrow_right_3, size: 18)),
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
