import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fruitmarket/common/widgets/appbar/appbar.dart';
import 'package:fruitmarket/common/widgets/custom_shapes/curved_edges/curved_edge_widget.dart';
import 'package:fruitmarket/common/widgets/icons/circular_icon.dart';
import 'package:fruitmarket/features/shop/models/products_model.dart';
import 'package:fruitmarket/utils/constants/colors.dart';
import 'package:fruitmarket/utils/constants/sizes.dart';
import 'package:fruitmarket/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({
    super.key,
    required this.productModel,
  });
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return TCurvedEdgeWidget(
      child: Container(
        color: dark ? TColors.darkerGrey : TColors.white,
        child: Stack(
          children: [
            //AppBar Icons
            const TAppBar(
              showBackArrow: true,
              actions: [
                TCircularIcon(icon: Iconsax.heart5, color: Colors.grey),
              ],
            ),
            //Main Large Image
            SizedBox(
                height: 400,
                child: Padding(
                  padding: const EdgeInsets.all(TSizes.productImageRadius * 2),
                  child: Center(
                      child: CachedNetworkImage(imageUrl: productModel.image)),
                )),
            //Image Slider
            // Positioned(
            //   right: 0,
            //   bottom: 30,
            //   left: TSizes.defaultSpace,
            //   child: SizedBox(
            //     height: 100,
            //     child: ListView.separated(
            //       shrinkWrap: true,
            //       scrollDirection: Axis.horizontal,
            //       physics: const AlwaysScrollableScrollPhysics(),
            //       itemCount: 6,
            //       separatorBuilder: (_, __) => const SizedBox(
            //         width: TSizes.spaceBtwItems,
            //       ),
            //       itemBuilder: (_, index) => TRoundedImage(
            //         backgroundColor: dark ? TColors.dark : TColors.white,
            //         width: 100,
            //         imageUrl: imageUrl,
            //         border: Border.all(color: TColors.primaryColor),
            //         padding: const EdgeInsets.all(TSizes.sm),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
