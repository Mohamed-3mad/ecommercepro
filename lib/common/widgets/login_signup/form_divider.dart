import 'package:flutter/material.dart';
import 'package:fruitmarket/utils/constants/colors.dart';
import 'package:fruitmarket/utils/helpers/helper_functions.dart';

class TFormDivider extends StatelessWidget {
  const TFormDivider({
    super.key,
    required this.textDivider,
  });
  final String textDivider;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Row(
      children: [
        Flexible(
          child: Divider(
              color: dark ? TColors.darkGrey : TColors.grey,
              thickness: 1,
              indent: 60,
              endIndent: 5),
        ),
        Text(
          textDivider,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Flexible(
          child: Divider(
              color: dark ? TColors.darkGrey : TColors.grey,
              thickness: 1,
              indent: 5,
              endIndent: 60),
        ),
      ],
    );
  }
}
