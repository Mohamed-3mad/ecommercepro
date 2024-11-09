import 'package:flutter/material.dart';
import 'package:fruitmarket/features/shop/controllers/cart_controller.dart';
import 'package:fruitmarket/utils/constants/sizes.dart';
import 'package:get/get.dart';

class TBillingAmountSection extends StatelessWidget {
  const TBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();
    final orderTotal = cartController.getTotalPrice() + 6 + 10;
    return Column(
      children: [
        //SubTotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Subtotal", style: Theme.of(context).textTheme.bodyMedium),
            Text("\$${cartController.getTotalPrice()}",
                style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),

        //Shipping Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Shipping Fee", style: Theme.of(context).textTheme.bodyMedium),
            Text("\$10.0", style: Theme.of(context).textTheme.labelLarge),
          ],
        ),

        const SizedBox(height: TSizes.spaceBtwItems / 2),

        //Tax Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Tax Fee", style: Theme.of(context).textTheme.bodyMedium),
            Text("\$6.0", style: Theme.of(context).textTheme.labelLarge),
          ],
        ),

        const SizedBox(height: TSizes.spaceBtwItems / 2),

        //Order Total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Order Total", style: Theme.of(context).textTheme.bodyMedium),
            Text("\$$orderTotal",
                style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ],
    );
  }
}
