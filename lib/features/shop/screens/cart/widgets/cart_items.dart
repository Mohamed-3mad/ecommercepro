// // import 'package:flutter/material.dart';
// // import 'package:fruitmarket/common/widgets/products/cart/add_remove_button.dart';
// // import 'package:fruitmarket/common/widgets/products/cart/cart_item.dart';
// // import 'package:fruitmarket/common/widgets/texts/product_price_text.dart';
// // import 'package:fruitmarket/utils/constants/sizes.dart';

// // class TCartItems extends StatelessWidget {
// //   const TCartItems({super.key, this.showAddRemoveButtons = true});

// //   final bool showAddRemoveButtons;
// //   @override
// //   Widget build(BuildContext context) {
// //     return ListView.separated(
// //       shrinkWrap: true,
// //       itemCount: 2,
// //       separatorBuilder: (_, __) =>
// //           const SizedBox(height: TSizes.spaceBtwSections),
// //       itemBuilder: (_, index) => Column(
// //         children: [
// //           const TCartItem(),
// //           if (showAddRemoveButtons)
// //             const SizedBox(height: TSizes.spaceBtwItems),
// //           //Add Remove Button with total Price
// //           if (showAddRemoveButtons)
// //             const Row(
// //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //               children: [
// //                 Row(
// //                   children: [
// //                     SizedBox(width: 70),
// //                     //Add Remove Buttons
// //                     TProductQuantityWithAddRemoveButton(),
// //                   ],
// //                 ),
// //                 TProductPriceText(price: "256")
// //               ],
// //             ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:fruitmarket/features/shop/controllers/cart_controller.dart';
// import 'package:fruitmarket/common/widgets/products/cart/cart_item.dart';
// import 'package:fruitmarket/utils/constants/sizes.dart';

// class TCartItems extends StatelessWidget {
//   const TCartItems({super.key, this.showAddRemoveButtons = true});

//   final bool showAddRemoveButtons;

//   @override
//   Widget build(BuildContext context) {
//     final cartController = Get.find<CartController>();

//     return Obx(() {
//       return ListView.separated(
//         shrinkWrap: true,
//         itemCount: cartController.cartItems.length,
//         separatorBuilder: (_, __) => const SizedBox(height: TSizes.spaceBtwSections),
//         itemBuilder: (_, index) {
//           final product = cartController.cartItems[index];
//           return Column(
//             children: [
//               TCartItem(product: product),
//               if (showAddRemoveButtons) const SizedBox(height: TSizes.spaceBtwItems),
//               if (showAddRemoveButtons)
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     // Row(
//                     //   children: [
//                     //     const SizedBox(width: 70),
//                     //     // زر إضافة/إزالة الكمية
//                     //     TProductQuantityWithAddRemoveButton(
//                     //       product: product,
//                     //     ),
//                     //   ],
//                     // ),
//                     Text('\$${product.price}', style: Theme.of(context).textTheme.bodyLarge),
//                   ],
//                 ),
//             ],
//           );
//         },
//       );
//     });
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fruitmarket/features/shop/controllers/cart_controller.dart';
import 'package:fruitmarket/common/widgets/products/cart/cart_item.dart';
import 'package:fruitmarket/utils/constants/sizes.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({super.key, this.showAddRemoveButtons = true});

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();

    return Obx(() {
      return ListView.separated(
        shrinkWrap: true,
        itemCount: cartController.cartItems.length,
        separatorBuilder: (_, __) =>
            const SizedBox(height: TSizes.spaceBtwSections),
        itemBuilder: (_, index) {
          final product = cartController.cartItems.keys.elementAt(index);
          final quantity = cartController.cartItems[product]!;

          return Column(
            children: [
              TCartItem(
                  product: product,
                  quantity: quantity), // Pass quantity to TCartItem
              if (showAddRemoveButtons)
                const SizedBox(height: TSizes.spaceBtwItems),
            ],
          );
        },
      );
    });
  }
}
