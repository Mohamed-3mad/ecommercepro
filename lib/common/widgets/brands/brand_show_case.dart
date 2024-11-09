import 'package:flutter/material.dart';
import 'package:fruitmarket/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:fruitmarket/utils/constants/colors.dart';
import 'package:fruitmarket/utils/constants/sizes.dart';
import 'package:fruitmarket/utils/helpers/helper_functions.dart';

class TBrandShowcase extends StatelessWidget {
  const TBrandShowcase({
    super.key,
    required this.images,
  });
  final List<String> images;
  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      padding: const EdgeInsets.all(TSizes.md),
      shadowBorder: true,
      borderColor: TColors.darkGrey,
      backgroundColor: Colors.transparent,
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      child: Column(
        children: [
          //Brand with Products Count
         // const TBrandCard(showBorder: false),
          const SizedBox(height: TSizes.spaceBtwItems),
          //Brand Top 3 Product image
          Row(
            children: images
                .map((image) => brandTopProductImageWidget(image, context))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget brandTopProductImageWidget(String image, context) {
    return Expanded(
      child: TRoundedContainer(
        padding: const EdgeInsets.all(TSizes.md),
        height: 100,
        backgroundColor: THelperFunction.isDarkMode(context)
            ? TColors.darkerGrey
            : TColors.light,
        margin: const EdgeInsets.only(right: TSizes.sm),
        child: Image(
          image: AssetImage(image),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
