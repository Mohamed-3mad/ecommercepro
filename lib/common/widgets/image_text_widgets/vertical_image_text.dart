// import 'package:flutter/material.dart';
// import 'package:fruitmarket/common/widgets/images/circular_image.dart';
// import 'package:fruitmarket/utils/constants/colors.dart';
// import 'package:fruitmarket/utils/constants/sizes.dart';
// import 'package:fruitmarket/utils/helpers/helper_functions.dart';

// class TVerticalImageText extends StatelessWidget {
//   const TVerticalImageText({
//     super.key,
//      this.image,
//     required this.title,
//     this.textColor = TColors.white,
//     this.backgroundColor,
//     this.onTap,
//     this.isNetworkImage = true,
//   });
//   final String title;
//   final String? image;
//   final Color textColor;
//   final Color? backgroundColor;
//   final bool isNetworkImage;
//   final void Function()? onTap;
//   @override
//   Widget build(BuildContext context) {
//     final dark = THelperFunction.isDarkMode(context);
//     return GestureDetector(
//       onTap: onTap,
//       child: Padding(
//         padding: const EdgeInsets.only(right: TSizes.spaceBtwItems),
//         child: Column(
//           children: [
//             //Circular Icon
//             TCircularImage(
//               image: image?? "",
//               fit: BoxFit.fitWidth,
//               padding: TSizes.sm * 1.4,
//               isNetworkImage: isNetworkImage,
//               backgroundColor: backgroundColor,
//               overlayColor: dark ? TColors.light : TColors.dark,
//             ),

//             //Text
//             const SizedBox(height: TSizes.spaceBtwItems / 2),
//             SizedBox(
//               width: 80,
//               child: Text(title,
//                   maxLines: 1,
//                   textAlign: TextAlign.center,
//                   overflow: TextOverflow.ellipsis,
//                   style: Theme.of(context)
//                       .textTheme
//                       .labelMedium!
//                       .apply(color: textColor)),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:fruitmarket/common/widgets/images/circular_image.dart';
import 'package:fruitmarket/utils/constants/colors.dart';
import 'package:fruitmarket/utils/constants/sizes.dart';
import 'package:fruitmarket/utils/helpers/helper_functions.dart';

class TVerticalImageText extends StatelessWidget {
  const TVerticalImageText({
    super.key,
    this.image,
    required this.title,
    this.textColor = TColors.white,
    this.backgroundColor,
    this.onTap,
    this.isNetworkImage = true,
  });

  final String title;
  final String? image;
  final Color textColor;
  final Color? backgroundColor;
  final bool isNetworkImage;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: TSizes.spaceBtwItems),
        child: Column(
          mainAxisSize: MainAxisSize
              .min, // Ensure the column only takes as much space as needed
          children: [
            // Circular Image
            TCircularImage(
              image: image ?? "",
              fit: BoxFit.fitWidth,
              padding: TSizes.sm * 1.4,
              isNetworkImage: isNetworkImage,
              backgroundColor: backgroundColor,
              overlayColor: dark ? TColors.light : TColors.dark,
            ),

            // Add some space between the image and text
            const SizedBox(height: TSizes.spaceBtwItems / 2),

            // Flexible widget to prevent overflow
            Flexible(
              child: SizedBox(
                width: 80,
                child: Text(
                  title,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .apply(color: textColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
