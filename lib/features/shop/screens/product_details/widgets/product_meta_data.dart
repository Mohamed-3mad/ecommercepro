// import 'package:flutter/material.dart';
// import 'package:fruitmarket/common/widgets/custom_shapes/containers/rounded_container.dart';
// import 'package:fruitmarket/common/widgets/images/circular_image.dart';
// import 'package:fruitmarket/common/widgets/texts/brand_title_text_with_verified_icon.dart';
// import 'package:fruitmarket/common/widgets/texts/product_price_text.dart';
// import 'package:fruitmarket/common/widgets/texts/product_title_text.dart';
// import 'package:fruitmarket/utils/constants/colors.dart';
// import 'package:fruitmarket/utils/constants/enums.dart';
// import 'package:fruitmarket/utils/constants/image_strings.dart';
// import 'package:fruitmarket/utils/constants/sizes.dart';
// import 'package:fruitmarket/utils/helpers/helper_functions.dart';

// class TProductMetaData extends StatelessWidget {
//   const TProductMetaData({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final darkMode = THelperFunction.isDarkMode(context);
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         //Price & Sale Price
//         Row(
//           children: [
//             //Sale Tag
//             TRoundedContainer(
//               radius: TSizes.sm,
//               backgroundColor: TColors.secondaryColor.withOpacity(.8),
//               padding: const EdgeInsets.symmetric(
//                   horizontal: TSizes.sm, vertical: TSizes.xs),
//               child: Text("25%",
//                   style: Theme.of(context)
//                       .textTheme
//                       .labelLarge!
//                       .apply(color: TColors.black)),
//             ),
//             const SizedBox(width: TSizes.spaceBtwItems),

//             //Price
//             Text("\$250",
//                 style: Theme.of(context)
//                     .textTheme
//                     .titleSmall!
//                     .apply(decoration: TextDecoration.lineThrough)),
//             const SizedBox(width: TSizes.spaceBtwItems),
//             const TProductPriceText(price: "112", isLarge: true),
//           ],
//         ),
//         const SizedBox(height: TSizes.spaceBtwItems / 1.5),
//         //Title
//         const TProductTitleText(title: "Nike Sportswear Club Fleece"),
//         const SizedBox(height: TSizes.spaceBtwItems / 1.5),
//         //Stack Status
//         Row(
//           children: [
//             const TProductTitleText(title: "Status"),
//             const SizedBox(width: TSizes.spaceBtwItems),
//             Text("In Stock", style: Theme.of(context).textTheme.titleMedium),
//           ],
//         ),
//         const SizedBox(height: TSizes.spaceBtwItems / 1.5),
//         //Brand
//         Row(
//           children: [
//             TCircularImage(
//                 image: TImages.cosmeticsIcon,
//                 width: 32,
//                 height: 32,
//                 overlayColor: darkMode ? TColors.white : TColors.black),
//             const TBrandTitleWithVerifiedIcon(
//                 title: "Nike", brandTextSize: TextSizes.medium),
//           ],
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:fruitmarket/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:fruitmarket/common/widgets/images/circular_image.dart';
import 'package:fruitmarket/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:fruitmarket/common/widgets/texts/product_price_text.dart';
import 'package:fruitmarket/common/widgets/texts/product_title_text.dart';
import 'package:fruitmarket/features/shop/models/products_model.dart';
import 'package:fruitmarket/utils/constants/colors.dart';
import 'package:fruitmarket/utils/constants/enums.dart';
import 'package:fruitmarket/utils/constants/image_strings.dart';
import 'package:fruitmarket/utils/constants/sizes.dart';
import 'package:fruitmarket/utils/helpers/helper_functions.dart';

class TProductMetaData extends StatelessWidget {
  final ProductModel product;

  const TProductMetaData({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunction.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Price & Sale Price
        Row(
          children: [
            // Sale Tag
            TRoundedContainer(
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
            const SizedBox(width: TSizes.spaceBtwItems),
            // Price
            Text("\$${product.price}",
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .apply(decoration: TextDecoration.lineThrough)),
            const SizedBox(width: TSizes.spaceBtwItems),
            TProductPriceText(price: product.price.toString(), isLarge: true),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),
        // Title
        TProductTitleText(title: product.title),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),
        // Status
        Row(
          children: [
            const TProductTitleText(title: "Status"),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text("In Stock", style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),
        // Brand
        Row(
          children: [
            TCircularImage(
                image: TImages.clothIcon,
                width: 32,
                height: 32,
                overlayColor: darkMode ? TColors.white : TColors.black),
            TBrandTitleWithVerifiedIcon(
                title: product.category, brandTextSize: TextSizes.medium),
          ],
        ),
      ],
    );
  }
}
