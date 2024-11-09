import 'package:flutter/material.dart';
import 'package:fruitmarket/common/widgets/appbar/appbar.dart';
import 'package:fruitmarket/common/widgets/icons/circular_icon.dart';
import 'package:fruitmarket/common/widgets/images/rounded_images.dart';
import 'package:fruitmarket/common/widgets/texts/product_price_text.dart';
import 'package:fruitmarket/common/widgets/texts/product_title_text.dart';
import 'package:fruitmarket/features/shop/controllers/wishlist_controller.dart';
import 'package:fruitmarket/features/shop/screens/all_products/all_products.dart';
import 'package:fruitmarket/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Ensure WishlistController is initialized
    final wishlistController =
        Get.put(WishlistController()); // Initialize WishlistController

    return Scaffold(
      appBar: TAppBar(
        title:
            Text("Wishlist", style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          TCircularIcon(
            icon: Iconsax.add,
            onPressed: () => Get.to(const AllProductsScreen()),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              Obx(() {
                // Check if the wishlist is empty
                if (wishlistController.wishlistItems.isEmpty) {
                  return const Center(child: Text("No items in Wishlist"));
                }

                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: wishlistController.wishlistItems.length,
                  itemBuilder: (_, index) {
                    final product = wishlistController.wishlistItems[index];
                    return ListTile(
                      leading: SizedBox(
                        child: TRoundedImage(
                            width: 100,
                            height: 100,
                            imageUrl: product.image,
                            isNetworkImage: true),
                      ),
                      title: TProductTitleText(title: product.title),
                      subtitle:
                          TProductPriceText(price: product.price.toString()),
                      trailing: IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          wishlistController.removeFromWishlist(
                              product); // Remove item from wishlist
                        },
                      ),
                    );
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
