// import 'package:flutter/material.dart';
// import 'package:fruitmarket/features/authentication/controllers/signup/signup_controller.dart';
// import 'package:fruitmarket/utils/constants/colors.dart';
// import 'package:fruitmarket/utils/constants/sizes.dart';
// import 'package:fruitmarket/utils/helpers/helper_functions.dart';
// import 'package:get/get.dart';

// class TTermsAndConditionsCheckBox extends StatelessWidget {
//   const TTermsAndConditionsCheckBox({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final dark = THelperFunction.isDarkMode(context);
//     final controller = SignupController.instance;
//     return Row(
//       children: [
//         SizedBox(
//           height: 24,
//           width: 24,
//           child: Obx(() => Checkbox(
//               value: controller.privacyPolicy.value,
//               onChanged: (value) => controller.privacyPolicy.value =
//                   !controller.privacyPolicy.value)),
//         ),
//         const SizedBox(width: TSizes.spaceBtwItems),
//         Text.rich(
//           TextSpan(
//             children: [
//               TextSpan(
//                   text: "I agree to ",
//                   style: Theme.of(context).textTheme.bodySmall),
//               TextSpan(
//                   text: "Privacy Policy ",
//                   style: Theme.of(context).textTheme.bodyMedium!.apply(
//                         color: dark ? TColors.white : TColors.primaryColor,
//                         decoration: TextDecoration.underline,
//                         decorationColor:
//                             dark ? TColors.white : TColors.primaryColor,
//                       )),
//               TextSpan(
//                   text: "and ", style: Theme.of(context).textTheme.bodySmall),
//               TextSpan(
//                   text: "Terms of use",
//                   style: Theme.of(context).textTheme.bodyMedium!.apply(
//                         color: dark ? TColors.white : TColors.primaryColor,
//                         decoration: TextDecoration.underline,
//                         decorationColor:
//                             dark ? TColors.white : TColors.primaryColor,
//                       )),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:fruitmarket/features/authentication/controllers/signup/signup_controller.dart';
import 'package:fruitmarket/utils/constants/colors.dart';
import 'package:fruitmarket/utils/constants/sizes.dart';
import 'package:fruitmarket/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

class TTermsAndConditionsCheckBox extends StatelessWidget {
  const TTermsAndConditionsCheckBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    final controller = SignupController.instance;

    return Row(
      crossAxisAlignment:
          CrossAxisAlignment.start, // Aligns top for better spacing
      children: [
        SizedBox(
          height: 24,
          width: 24,
          child: Obx(() => Checkbox(
              value: controller.privacyPolicy.value,
              onChanged: (value) => controller.privacyPolicy.value =
                  !controller.privacyPolicy.value)),
        ),
        const SizedBox(width: TSizes.spaceBtwItems),
        Expanded(
          // Allows text to wrap within available space
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                    text: "I agree to ",
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: "Privacy Policy ",
                    style: Theme.of(context).textTheme.bodyMedium!.apply(
                          color: dark ? TColors.white : TColors.primaryColor,
                          decoration: TextDecoration.underline,
                          decorationColor:
                              dark ? TColors.white : TColors.primaryColor,
                        )),
                TextSpan(
                    text: "and ", style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: "Terms of use",
                    style: Theme.of(context).textTheme.bodyMedium!.apply(
                          color: dark ? TColors.white : TColors.primaryColor,
                          decoration: TextDecoration.underline,
                          decorationColor:
                              dark ? TColors.white : TColors.primaryColor,
                        )),
              ],
            ),
            textAlign: TextAlign.start, // Aligns text to the start
          ),
        ),
      ],
    );
  }
}
