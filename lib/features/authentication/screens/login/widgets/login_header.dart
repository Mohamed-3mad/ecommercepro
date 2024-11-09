import 'package:flutter/material.dart';
import 'package:fruitmarket/utils/constants/image_strings.dart';
import 'package:fruitmarket/utils/constants/sizes.dart';

class TLoginHeader extends StatelessWidget {
  const TLoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Image(
          height: 150,
          image: AssetImage(TImages.loginImage),
        ),
        Text(
          "Welcome back,",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: TSizes.sm),
        Text(
          "Discover Limitless Choices and Unmatched Convenience",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
