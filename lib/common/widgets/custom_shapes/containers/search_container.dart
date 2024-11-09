import 'package:flutter/material.dart';
import 'package:fruitmarket/utils/constants/colors.dart';
import 'package:fruitmarket/utils/constants/sizes.dart';
import 'package:fruitmarket/utils/device/device_utility.dart';
import 'package:fruitmarket/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

// class TSearchContainer extends StatelessWidget {
//   const TSearchContainer({
//     super.key,
//     required this.text,
//     this.icon = Iconsax.search_normal,
//     this.showBackground = true,
//     this.showBorder = true,
//     this.onChanged, // New onChanged parameter
//     this.padding = const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
//     this.onTap,
//   });

//   final String text;
//   final void Function()? onTap;
//   final IconData? icon;
//   final bool showBackground, showBorder;
//   final void Function(String)? onChanged; // Callback for text changes
//   final EdgeInsetsGeometry padding;

//   @override
//   Widget build(BuildContext context) {
//     final dark = THelperFunction.isDarkMode(context);
//     return Padding(
//       padding: padding,
//       child: GestureDetector(
//         onTap: onTap,
//         child: Container(
//           width: TDeviceUtils.getScreenWidth(context),
//           padding: const EdgeInsets.symmetric(
//               vertical: 8.0), // Reduced vertical padding
//           decoration: BoxDecoration(
//             color: showBackground
//                 ? dark
//                     ? TColors.dark
//                     : TColors.light
//                 : Colors.transparent,
//             borderRadius:
//                 showBorder ? BorderRadius.circular(TSizes.cardRadiusLg) : null,
//             border: showBorder ? Border.all(color: TColors.grey) : null,
//           ),
//           child: Row(
//             children: [
//               const SizedBox(width: TSizes.spaceBtwItems),
//               Expanded(
//                 child: TextField(
//                   onChanged: onChanged, // Pass input to onChanged
//                   decoration: InputDecoration(
//                     prefixIcon: Padding(
//                       padding: const EdgeInsets.only(
//                           right: 8.0), // Space between icon and text
//                       child: Icon(icon, color: TColors.darkerGrey),
//                     ),
//                     hintText: text,
//                     border: InputBorder.none, // No border
//                     enabledBorder: InputBorder.none, // No border when enabled
//                     focusedBorder: InputBorder.none, // No border when focused
//                     isDense: true,
//                     contentPadding: const EdgeInsets.symmetric(
//                         vertical: 15.0,
//                         horizontal: 0), // Reduced vertical padding
//                   ),
//                   style: Theme.of(context).textTheme.bodySmall,
//                   textAlign: TextAlign
//                       .start, // Align the text to the left, next to the icon
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }









class TSearchContainer extends StatelessWidget {
  const TSearchContainer({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBorder = true,
    this.onChanged,
    this.padding = const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
    this.onTap,
    required this.focusNode,  // New FocusNode parameter
  });

  final String text;
  final void Function()? onTap;
  final IconData? icon;
  final bool showBackground, showBorder;
  final void Function(String)? onChanged;
  final EdgeInsetsGeometry padding;
  final FocusNode focusNode; // FocusNode parameter

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Padding(
      padding: padding,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: TDeviceUtils.getScreenWidth(context),
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          decoration: BoxDecoration(
            color: showBackground
                ? dark
                    ? TColors.dark
                    : TColors.light
                : Colors.transparent,
            borderRadius: showBorder
                ? BorderRadius.circular(TSizes.cardRadiusLg)
                : null,
            border: showBorder ? Border.all(color: TColors.grey) : null,
          ),
          child: Row(
            children: [
              const SizedBox(width: TSizes.spaceBtwItems),
              Expanded(
                child: TextField(
                  focusNode: focusNode, // Attach FocusNode to TextField
                  onChanged: onChanged,
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Icon(icon, color: TColors.darkerGrey),
                    ),
                    hintText: text,
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 0),
                  ),
                  style: Theme.of(context).textTheme.bodySmall,
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 