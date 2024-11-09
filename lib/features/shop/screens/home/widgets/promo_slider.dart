import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fruitmarket/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:fruitmarket/common/widgets/images/rounded_images.dart';
import 'package:fruitmarket/features/shop/controllers/home_controllers.dart';
import 'package:fruitmarket/utils/constants/colors.dart';
import 'package:fruitmarket/utils/constants/sizes.dart';
import 'package:get/get.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key,
    required this.banners,
  });
  final List<String> banners;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeControllers());
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            onPageChanged: (index, _) => controller.updatePageIndicator(index),
          ),
          items: banners
              .map((url) => ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: TRoundedImage(imageUrl: url)))
              .toList(),
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        Center(
          child: Obx(
            () => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < banners.length; i++)
                  TCircularContainer(
                      margin: const EdgeInsets.only(right: 10),
                      width: 20,
                      height: 4,
                      backgroundColor:
                          controller.carouselCurrentIndex.value == i
                              ? TColors.primaryColor
                              : TColors.grey),
              ],
            ),
          ),
        )
      ],
    );
  }
}
