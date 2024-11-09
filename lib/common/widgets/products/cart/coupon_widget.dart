import 'package:flutter/material.dart';
import 'package:fruitmarket/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:fruitmarket/utils/constants/colors.dart';
import 'package:fruitmarket/utils/constants/sizes.dart';
import 'package:fruitmarket/utils/helpers/helper_functions.dart';

class TCouponCode extends StatelessWidget {
  const TCouponCode({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return TRoundedContainer(
      shadowBorder: true,
      backgroundColor: dark ? TColors.dark : TColors.white,
      padding: const EdgeInsets.only(
          top: TSizes.sm, bottom: TSizes.sm, right: TSizes.sm, left: TSizes.md),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Have a promo code? Enter her',
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),

          //Button
          SizedBox(
              width: 80,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: dark
                        ? TColors.white.withOpacity(.5)
                        : TColors.dark.withOpacity(.5),
                    backgroundColor: TColors.grey.withOpacity(.2),
                    side: BorderSide(color: TColors.grey.withOpacity(.1)),
                  ),
                  onPressed: () {},
                  child: const Text('Apply')))
        ],
      ),
    );
  }
}
