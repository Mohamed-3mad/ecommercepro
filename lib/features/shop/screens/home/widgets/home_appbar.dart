import 'package:flutter/material.dart';
import 'package:fruitmarket/common/widgets/appbar/appbar.dart';
import 'package:fruitmarket/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:fruitmarket/common/widgets/shimmers/shimmers_effect.dart';
import 'package:fruitmarket/features/personalization/controllers/user_controller.dart';
import 'package:fruitmarket/utils/constants/colors.dart';
import 'package:fruitmarket/utils/constants/text_strings.dart';
import 'package:get/get.dart';

import '../../cart/cart.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return TAppBar(
      title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(TTexts.homeAppbarTitle,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: TColors.grey)),
        Obx(() {
          if (controller.profileLoading.value) {
            return const TShimmerEffect(width: 80, height: 15);
          } else {
            return Text(controller.user.value.fullName,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .apply(color: TColors.white));
          }
        }),
      ]),
      actions: [
        TCartCounterIcon(
            onPressed: () => Get.to(() => const CartScreen()),
            counterBgColor: TColors.black,
            iconColor: TColors.white,
            counterTextColor: TColors.white),
      ],
    );
  }
}
