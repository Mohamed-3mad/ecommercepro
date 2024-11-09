import 'package:flutter/material.dart';
import 'package:fruitmarket/common/widgets/appbar/appbar.dart';
import 'package:fruitmarket/features/shop/controllers/cart_controller.dart';
import 'package:fruitmarket/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:get/get.dart';
import 'package:fruitmarket/features/shop/screens/checkout/checkout.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();

    return Scaffold(
      // AppBar
      appBar: TAppBar(
        showBackArrow: true,
        title: Text("Cart", style: Theme.of(context).textTheme.headlineSmall),
      ),
      // Body
      body: Obx(() {
        if (cartController.cartCount == 0) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Your cart is empty.",
                    style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(height: 20),
                Text(
                  "Looks like you haven't added anything yet. \nExplore our collection and find your perfect products!",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .color!
                            .withOpacity(0.6),
                      ),
                ),
              ],
            ),
          );
        } else {
          return const Padding(
            padding: EdgeInsets.all(16.0),
            child: TCartItems(),
          );
        }
      }),
      // Checkout Button
      bottomNavigationBar: Obx(() {
        return cartController.cartCount > 0
            ? Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () => Get.to(() => const CheckoutScreen()),
                  child: const Text("Continue"),
                ),
              )
            : const SizedBox.shrink();
      }),
    );
  }
}
