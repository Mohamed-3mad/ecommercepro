import 'package:flutter/material.dart';
import 'package:fruitmarket/common/widgets/loaders/loaders.dart';
import 'package:fruitmarket/common/widgets/texts/product_price_text.dart';
import 'package:fruitmarket/features/shop/controllers/cart_controller.dart';
import 'package:fruitmarket/features/shop/models/products_model.dart';
import 'package:fruitmarket/common/widgets/images/rounded_images.dart';
import 'package:fruitmarket/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:fruitmarket/common/widgets/texts/product_title_text.dart';
import 'package:fruitmarket/utils/constants/colors.dart';
import 'package:fruitmarket/utils/constants/sizes.dart';
import 'package:fruitmarket/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart'; // لاستدعاء أيقونات Iconsax

class TCartItem extends StatelessWidget {
  const TCartItem({super.key, required this.product, required this.quantity});

  final ProductModel product;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    final cartController = Get.find<CartController>();
    return Row(
      children: [
        // صورة المنتج
        TRoundedImage(
          width: 60,
          height: 60,
          isNetworkImage: true,
          imageUrl: product.image,
          backgroundColor: dark ? TColors.darkerGrey : TColors.light,
        ),
        const SizedBox(width: TSizes.spaceBtwItems),

        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // اسم العلامة التجارية
              TBrandTitleWithVerifiedIcon(title: product.category),
              Flexible(
                child: TProductTitleText(title: product.title),
              ),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(
                            text: "Quantity : ",
                            style: TextStyle(fontSize: 10)),
                        TextSpan(
                            text: "$quantity",
                            style: Theme.of(context).textTheme.titleLarge),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      const Text(
                        'Price :',
                        style: TextStyle(fontSize: 10),
                      ),
                      const SizedBox(width: 5),
                      TProductPriceText(
                          price: product.price.toString(), maxLines: 1),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),

        // أيقونة الحذف
        IconButton(
          icon: const Icon(Iconsax.trash,
              color: Colors.red), // أيقونة سلة المهملات
          onPressed: () {
            cartController.removeFromCart(product); // إزالة المنتج من السلة
            TLoaders.successSnackBar(
              title: "Removed from Cart",
              message: "This product has been removed from your cart.",
            );
          },
        ),
      ],
    );
  }
}
