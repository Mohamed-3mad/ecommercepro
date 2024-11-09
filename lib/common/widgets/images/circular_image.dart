import 'package:flutter/material.dart';
import 'package:fruitmarket/common/widgets/shimmers/shimmers_effect.dart';
import 'package:fruitmarket/utils/constants/colors.dart';
import 'package:fruitmarket/utils/constants/sizes.dart';
import 'package:fruitmarket/utils/helpers/helper_functions.dart';
import 'package:cached_network_image/cached_network_image.dart';

class TCircularImage extends StatelessWidget {
  const TCircularImage({
    super.key,
    this.width = 56,
    this.height = 56,
    this.padding = TSizes.sm,
    required this.image,
    this.backgroundColor,
    this.overlayColor,
    this.fit = BoxFit.cover,
    this.isNetworkImage = false,
  });

  final double width, height, padding;
  final String image;
  final Color? backgroundColor, overlayColor;
  final BoxFit? fit;
  final bool isNetworkImage;

  @override
  Widget build(BuildContext context) {
    
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor ??
            (THelperFunction.isDarkMode(context)
                ? TColors.black
                : TColors.white),
        borderRadius: BorderRadius.circular(100),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Center(
          child: isNetworkImage
              ? CachedNetworkImage(
                  color: overlayColor,
                  fit: fit,
                  imageUrl: image,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      const TShimmerEffect(width: 55, height: 55),
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.category, color: TColors.primaryColor),
                )
              : Image(
                  color: overlayColor,
                  fit: fit,
                  image: AssetImage(image),
                ),
        ),
      ),
    );
  }
}
