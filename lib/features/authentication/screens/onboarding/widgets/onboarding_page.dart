import 'package:flutter/material.dart';
import 'package:fruitmarket/utils/constants/sizes.dart';
import 'package:fruitmarket/utils/helpers/helper_functions.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.imageTitle,
    required this.textTitle,
    required this.textSubtitle,
  });

  final String imageTitle, textTitle, textSubtitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        children: [
          Image(
            width: THelperFunction.screenWidth() * .8,
            height: THelperFunction.screenHeight() * .6,
            image: AssetImage(imageTitle),
          ),
          Text(
            textTitle,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
          Text(
            textSubtitle,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
