import 'package:flutter/material.dart';
import 'package:fruitmarket/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:fruitmarket/features/personalization/controllers/user_controller.dart';
import 'package:fruitmarket/utils/constants/colors.dart';
import 'package:fruitmarket/utils/constants/sizes.dart';
import 'package:fruitmarket/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TSingleAddress extends StatelessWidget {
  const TSingleAddress({super.key, required this.selectedAddress});
  final bool selectedAddress;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    final controller = UserController.instance;
    return TRoundedContainer(
      padding: const EdgeInsets.all(TSizes.md),
      width: double.infinity,
      shadowBorder: true,
      backgroundColor: selectedAddress
          ? TColors.primaryColor.withOpacity(.5)
          : Colors.transparent,
      borderColor: selectedAddress
          ? Colors.transparent
          : dark
              ? TColors.darkGrey
              : TColors.grey,
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,
            child: Icon(
              selectedAddress ? Iconsax.tick_circle5 : null,
              color: selectedAddress
                  ? dark
                      ? TColors.light
                      : TColors.dark
                  : null,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () => Text(
                  controller.user.value.fullName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const SizedBox(height: TSizes.sm / 2),
              const Text("0114 3868 599",
                  maxLines: 1, overflow: TextOverflow.ellipsis),
              const SizedBox(height: TSizes.sm / 2),
              const Text("Cairo", maxLines: 1, softWrap: true),
            ],
          ),
        ],
      ),
    );
  }
}
