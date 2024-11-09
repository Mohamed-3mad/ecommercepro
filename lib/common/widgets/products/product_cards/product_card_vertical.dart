import 'package:flutter/material.dart';
import 'package:fruitmarket/common/styles/shadows.dart';
import 'package:fruitmarket/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:fruitmarket/common/widgets/icons/circular_icon.dart';
import 'package:fruitmarket/common/widgets/images/rounded_images.dart';
import 'package:fruitmarket/common/widgets/texts/product_price_text.dart';
import 'package:fruitmarket/common/widgets/texts/product_title_text.dart';
import 'package:fruitmarket/features/shop/controllers/wishlist_controller.dart';
import 'package:fruitmarket/features/shop/models/products_model.dart';
import 'package:fruitmarket/features/shop/screens/product_details/product_details.dart';
import 'package:fruitmarket/utils/constants/colors.dart';
import 'package:fruitmarket/utils/constants/image_strings.dart';
import 'package:fruitmarket/utils/constants/sizes.dart';
import 'package:fruitmarket/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

// class TProductCardVertical extends StatelessWidget {
//   const TProductCardVertical(
//       {super.key, required this.product, this.iconPressed = false});

//   final ProductModel product;
//   final bool iconPressed;

//   @override
//   Widget build(BuildContext context) {
//     final dark = THelperFunction.isDarkMode(context);
//     final wishlistController = Get.find<WishlistController>();

//     return GestureDetector(
//       onTap: () => Get.to(() => ProductDetailsScreen(product: product)),
//       child: Container(
//         width: 180,
//         padding: const EdgeInsets.all(1),
//         decoration: BoxDecoration(
//           boxShadow: [TShadowStyle.verticalProductShadow],
//           borderRadius: BorderRadius.circular(TSizes.productImageRadius),
//           color: dark ? TColors.darkerGrey : TColors.white,
//         ),
//         child: Column(
//           children: [
//             TRoundedContainer(
//               height: 180,
//               padding: const EdgeInsets.all(TSizes.sm),
//               backgroundColor: dark ? TColors.dark : TColors.light,
//               child: Stack(
//                 children: [
//                   TRoundedImage(
//                       isNetworkImage: true,
//                       width: 120,
//                       height: 120,
//                       imageUrl: product.image.isNotEmpty
//                           ? product.image
//                           : TImages.product1,
//                       applyImageRadius: true),
//                   //Sale Tag
//                   Positioned(
//                     bottom: 5,
//                     child: TRoundedContainer(
//                       radius: TSizes.sm,
//                       backgroundColor: TColors.secondaryColor.withOpacity(.8),
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: TSizes.sm, vertical: TSizes.xs),
//                       child: Text("25%",
//                           style: Theme.of(context)
//                               .textTheme
//                               .labelLarge!
//                               .apply(color: TColors.black)),
//                     ),
//                   ),
//                   Positioned(
//                     bottom: 12,
//                     right: 5,
//                     child: Obx(() {
//                       return TCircularIcon(
//                         width: 25,
//                         height: 25,
//                         onPressed: () {
//                           // Toggle the favorite state for the product
//                           wishlistController.toggleFavorite(product);
//                           // Ensure WishlistController is initialized
//                           if (!Get.isRegistered<WishlistController>()) {
//                             Get.put(
//                                 WishlistController()); // Put it if not registered
//                           }
//                           if (product.isFavorite.value) {
//                             wishlistController
//                                 .addToWishlist(product); // Remove from wishlist
//                           } else {
//                             wishlistController
//                                 .removeFromWishlist(product); // Add to wishlist
//                           }
//                           // Add product to wishlist
//                         },
//                         icon: Iconsax.heart5,
//                         color: product.isFavorite.value
//                             ? Colors.red // Active color
//                             : Colors.grey, // Inactive color
//                       );
//                     }),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: TSizes.spaceBtwItems / 2),
//             Padding(
//               padding: const EdgeInsets.only(left: TSizes.sm),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   TProductTitleText(title: product.title, smallSize: true),
//                   const SizedBox(height: TSizes.spaceBtwItems / 2),
//                 ],
//               ),
//             ),
//             const Spacer(),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(left: TSizes.sm),
//                   child: TProductPriceText(price: product.price.toString()),
//                 ),
//                 Container(
//                   decoration: const BoxDecoration(
//                       borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(TSizes.cardRadiusMd),
//                           bottomRight:
//                               Radius.circular(TSizes.productImageRadius)),
//                       color: TColors.dark),
//                   child: const SizedBox(
//                     width: TSizes.iconLg * 1.2,
//                     height: TSizes.iconLg * 1.2,
//                     child: Center(
//                       child: Icon(Iconsax.add, color: TColors.white),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical(
      {super.key, required this.product, this.iconPressed = false});

  final ProductModel product;
  final bool iconPressed;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    final wishlistController = Get.find<WishlistController>();

    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailsScreen(product: product)),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkerGrey : TColors.white,
        ),
        child: Column(
          children: [
            TRoundedContainer(
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  TRoundedImage(
                      isNetworkImage: true,
                      width: 120,
                      height: 120,
                      imageUrl: product.image.isNotEmpty
                          ? product.image
                          : TImages.product1,
                      applyImageRadius: true),
                  // Sale Tag
                  Positioned(
                    bottom: 5,
                    child: TRoundedContainer(
                      radius: TSizes.sm,
                      backgroundColor: TColors.secondaryColor.withOpacity(.8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: TSizes.sm, vertical: TSizes.xs),
                      child: Text("25%",
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .apply(color: TColors.black)),
                    ),
                  ),
                  Positioned(
                    bottom: 12,
                    right: 5,
                    child: Obx(() {
                      return TCircularIcon(
                        width: 25,
                        height: 25,
                        onPressed: () {
                          // Toggle the favorite state for the product
                          wishlistController.toggleFavorite(product);
                          if (!Get.isRegistered<WishlistController>()) {
                            Get.put(
                                WishlistController()); // Put it if not registered
                          }
                          if (product.isFavorite.value) {
                            wishlistController
                                .addToWishlist(product); // Remove from wishlist
                          } else {
                            wishlistController
                                .removeFromWishlist(product); // Add to wishlist
                          }
                        },
                        icon: Iconsax.heart5,
                        color: product.isFavorite.value
                            ? Colors.red // Active color
                            : Colors.grey, // Inactive color
                      );
                    }),
                  ),
                ],
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            Padding(
              padding: const EdgeInsets.only(left: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TProductTitleText(title: product.title, smallSize: true),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                ],
              ),
            ),
            // Replace Spacer with an Expanded widget to avoid overflow
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: TSizes.sm),
                    child: TProductPriceText(price: product.price.toString()),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(TSizes.cardRadiusMd),
                            bottomRight:
                                Radius.circular(TSizes.productImageRadius)),
                        color: TColors.dark),
                    child: const SizedBox(
                      width: TSizes.iconLg * 1.2,
                      height: TSizes.iconLg * 1.2,
                      child: Center(
                        child: Icon(Iconsax.add, color: TColors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
