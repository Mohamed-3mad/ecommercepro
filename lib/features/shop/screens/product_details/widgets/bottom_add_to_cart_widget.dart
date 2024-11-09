import 'package:flutter/material.dart';
import 'package:fruitmarket/common/widgets/icons/circular_icon.dart';
import 'package:fruitmarket/common/widgets/loaders/loaders.dart';
import 'package:fruitmarket/features/shop/controllers/cart_controller.dart';
import 'package:fruitmarket/features/shop/models/products_model.dart';
import 'package:fruitmarket/utils/constants/colors.dart';
import 'package:fruitmarket/utils/constants/sizes.dart';
import 'package:fruitmarket/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

// class TBottomAddToCart extends StatelessWidget {
//   const TBottomAddToCart({super.key, required this.product});
//   final ProductModel product;

//   @override
//   Widget build(BuildContext context) {
//     final dark = THelperFunction.isDarkMode(context);
//     return Container(
//       padding: const EdgeInsets.symmetric(
//           vertical: TSizes.defaultSpace, horizontal: TSizes.defaultSpace),
//       decoration: BoxDecoration(
//         color: dark ? TColors.darkerGrey : TColors.grey,
//         borderRadius: const BorderRadius.only(
//           topLeft: Radius.circular(TSizes.cardRadiusLg),
//           topRight: Radius.circular(TSizes.cardRadiusLg),
//         ),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Row(
//             children: [
//               const TCircularIcon(
//                 icon: Iconsax.minus,
//                 backgroundColor: TColors.darkerGrey,
//                 width: 40,
//                 height: 40,
//                 color: Colors.white,
//               ),
//               const SizedBox(width: TSizes.spaceBtwItems),
//               Text('2', style: Theme.of(context).textTheme.titleSmall),
//               const SizedBox(width: TSizes.spaceBtwItems),
//               const TCircularIcon(
//                 icon: Iconsax.add,
//                 backgroundColor: TColors.black,
//                 width: 40,
//                 height: 40,
//                 color: Colors.white,
//               ),
//             ],
//           ),
//           ElevatedButton(
//             onPressed: () {
//               final cartController = Get.find<CartController>();
//               cartController.addToCart(product);
//               TLoaders.successSnackBar(
//                   title: "Added to Cart",
//                   message:
//                       "You can now go to the cart to complete your purchase.");
//             },
//             style: ElevatedButton.styleFrom(
//                 padding: const EdgeInsets.all(TSizes.md),
//                 backgroundColor: TColors.black,
//                 side: const BorderSide(color: TColors.black)),
//             child: const Text("Add to Cart"),
//           ),
//         ],
//       ),
//     );
//   }
// }

class TBottomAddToCart extends StatelessWidget {
  const TBottomAddToCart({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    // استخدم Rx<int> لتخزين عدد المنتجات المتاحة في السلة
    final cartController = Get.find<CartController>();
    Rx<int> productQuantity =
        Rx<int>(cartController.getProductQuantity(product));

    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: TSizes.defaultSpace, horizontal: TSizes.defaultSpace),
      decoration: BoxDecoration(
        color: dark ? TColors.darkerGrey : TColors.grey,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(TSizes.cardRadiusLg),
          topRight: Radius.circular(TSizes.cardRadiusLg),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              // زر تقليل الكمية
              GestureDetector(
                onTap: () {
                  if (productQuantity.value > 1) {
                    productQuantity.value--; // تقليل العدد في الواجهة
                    cartController.removeFromCart(product); // تحديث السلة
                  }
                },
                child: const TCircularIcon(
                  icon: Iconsax.minus,
                  backgroundColor: TColors.darkerGrey,
                  width: 40,
                  height: 40,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: TSizes.spaceBtwItems),
              // عرض الكمية في الواجهة
              Obx(() => Text(
                    '${productQuantity.value}',
                    style: Theme.of(context).textTheme.titleSmall,
                  )),
              const SizedBox(width: TSizes.spaceBtwItems),
              // زر زيادة الكمية
              GestureDetector(
                onTap: () {
                  productQuantity.value++; // زيادة العدد في الواجهة
                  cartController.addToCart(product); // تحديث السلة
                },
                child: const TCircularIcon(
                  icon: Iconsax.add,
                  backgroundColor: TColors.black,
                  width: 40,
                  height: 40,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              // إضافة المنتج إلى السلة
              cartController.addToCart(product);
              TLoaders.successSnackBar(
                title: "Added to Cart",
                message:
                    "You can now go to the cart to complete your purchase.",
              );
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(TSizes.md),
              backgroundColor: TColors.black,
              side: const BorderSide(color: TColors.black),
            ),
            child: const Text("Add to Cart"),
          ),
        ],
      ),
    );
  }
}
