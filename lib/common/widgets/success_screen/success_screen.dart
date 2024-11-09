import 'package:flutter/material.dart';
import 'package:fruitmarket/common/styles/spacing_styles.dart';
import 'package:fruitmarket/utils/constants/sizes.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen(
      {super.key,
      required this.onPressed,
      required this.image,
      required this.title,
      required this.subTitle,
      this.padding,
      this.btnText});
  final VoidCallback onPressed;
  final String image, title, subTitle;
  final EdgeInsetsGeometry? padding;
  final Text? btnText;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: padding ?? TSpacingStyles.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              //Image
              Image(
                width: MediaQuery.of(context).size.width * .6,
                image: AssetImage(image),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              //Title
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              //Subtitle
              Text(
                subTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              //Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: onPressed,
                    child: btnText ?? const Text("Continue")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
