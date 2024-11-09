import 'package:flutter/material.dart';
import 'package:fruitmarket/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:fruitmarket/common/widgets/icons/circular_icon.dart';
import 'package:fruitmarket/common/widgets/images/rounded_images.dart';
import 'package:fruitmarket/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:fruitmarket/common/widgets/texts/product_price_text.dart';
import 'package:fruitmarket/common/widgets/texts/product_title_text.dart';
import 'package:fruitmarket/features/shop/models/products_model.dart';
import 'package:fruitmarket/features/shop/screens/product_details/product_details.dart';
import 'package:fruitmarket/utils/constants/colors.dart';
import 'package:fruitmarket/utils/constants/sizes.dart';
import 'package:fruitmarket/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TProductCardHorizintal extends StatelessWidget {
  const TProductCardHorizintal({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailsScreen(product: product)),
      child: Container(
        width: 310,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkerGrey : TColors.softGrey,
        ),
        child: Row(
          children: [
            //Thumbnail

            TRoundedContainer(
              height: 120,
              padding: const EdgeInsets.all(TSizes.md),
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  //Thumbnail Image
                  SizedBox(
                    width: 100,
                    height: 200,
                    child: TRoundedImage(
                        isNetworkImage: true,
                        imageUrl: product.image,
                        applyImageRadius: true),
                  ),

                  //Sale Tag
                  Positioned(
                    top: 0,
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
                  //Facvorite Icon Button

                  const Positioned(
                      top: 0,
                      right: 0,
                      child: TCircularIcon(
                        width: 25,
                        height: 25,
                        icon: Iconsax.heart5,
                        color: Colors.grey,
                      )),
                ],
              ),
            ),

            //Details
            SizedBox(
              width: 150,
              child: Padding(
                padding: const EdgeInsets.only(top: TSizes.sm, left: TSizes.sm),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TProductTitleText(
                            title: product.title.substring(0, 15),
                            smallSize: true),
                        const SizedBox(height: TSizes.spaceBtwItems / 2),
                        TBrandTitleWithVerifiedIcon(title: product.category),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //Pricing
                        Flexible(
                            child: TProductPriceText(
                                price: product.price.toString())),

                        //Add To Cart
                        Container(
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(TSizes.cardRadiusMd),
                                  bottomRight: Radius.circular(
                                      TSizes.productImageRadius)),
                              color: TColors.dark),
                          child: const SizedBox(
                            width: TSizes.iconLg * 1.2,
                            height: TSizes.iconLg * 1.2,
                            child: Center(
                              child: Icon(
                                Iconsax.add,
                                color: TColors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
