// import 'package:flutter/material.dart';
// import 'package:fruitmarket/utils/constants/colors.dart';
// import 'package:fruitmarket/utils/helpers/helper_functions.dart';
// import 'package:iconsax/iconsax.dart';

// class TCartCounterIcon extends StatelessWidget {
//   const TCartCounterIcon({
//     super.key,
//     this.iconColor,
//     this.counterTextColor,
//     this.counterBgColor,
//     this.onPressed,
//   });
//   final void Function()? onPressed;
//   final Color? iconColor, counterTextColor, counterBgColor;
//   @override
//   Widget build(BuildContext context) {
//     final dark = THelperFunction.isDarkMode(context);
//     return Stack(
//       children: [
//         IconButton(
//             onPressed: onPressed,
//             icon: Icon(
//               Iconsax.shopping_bag,
//               color: iconColor,
//             )),
//         Positioned(
//           right: 0,
//           child: Container(
//             width: 18,
//             height: 18,
//             decoration: BoxDecoration(
//               color: counterBgColor ?? (dark ? TColors.white : TColors.black),
//               borderRadius: BorderRadius.circular(100),
//             ),
//             child: Center(
//               child: Text(
//                 "0",
//                 style: Theme.of(context)
//                     .textTheme
//                     .labelLarge!
//                     .apply(color: TColors.white, fontSizeFactor: .8),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:fruitmarket/features/shop/controllers/cart_controller.dart';
import 'package:fruitmarket/utils/constants/colors.dart';
import 'package:fruitmarket/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TCartCounterIcon extends StatelessWidget {
  const TCartCounterIcon({
    super.key,
    this.iconColor,
    this.counterTextColor,
    this.counterBgColor,
    this.onPressed,
  });
  final void Function()? onPressed;
  final Color? iconColor, counterTextColor, counterBgColor;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    final cartController = Get.find<CartController>();

    return Stack(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            Iconsax.shopping_bag,
            color: iconColor,
          ),
        ),
        Positioned(
          right: 0,
          child: Obx(() {
            return Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                color: counterBgColor ?? (dark ? TColors.white : TColors.black),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Text(
                  '${cartController.cartCount}', // عرض العدد الإجمالي للمنتجات
                  style: Theme.of(context).textTheme.labelLarge!.apply(
                      color: counterTextColor ?? TColors.white,
                      fontSizeFactor: .8),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
