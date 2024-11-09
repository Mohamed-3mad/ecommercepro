import 'package:flutter/material.dart';
import 'package:fruitmarket/utils/constants/colors.dart';
import 'package:fruitmarket/utils/constants/sizes.dart';

class TRoundedContainer extends StatelessWidget {
  const TRoundedContainer({
    super.key,
    this.width,
    this.height,
    this.radius = TSizes.cardRadiusLg,
    this.padding,
    this.child,
    this.backgroundColor = TColors.white,
    this.margin,
    this.borderColor = TColors.borderPrimary,
    this.shadowBorder = false,
  });
  final double? width, height;
  final double radius;
  final EdgeInsetsGeometry? margin, padding;
  final Widget? child;
  final Color backgroundColor, borderColor;
  final bool shadowBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: backgroundColor,
          border: shadowBorder ? Border.all(color: borderColor) : null),
      child: child,
    );
  }
}
