import 'package:flutter/material.dart';
import 'package:fruitmarket/common/widgets/images/circular_image.dart';
import 'package:fruitmarket/common/widgets/shimmers/shimmers_effect.dart';
import 'package:fruitmarket/features/personalization/controllers/user_controller.dart';
import 'package:fruitmarket/utils/constants/colors.dart';
import 'package:fruitmarket/utils/constants/image_strings.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';

class TUserProfileTile extends StatelessWidget {
  const TUserProfileTile({
    super.key,
    this.onPressed,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
      title: Text(controller.user.value.fullName,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: TColors.white)),
      subtitle: Text(controller.user.value.email,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .apply(color: TColors.white)),
      leading: Obx(() {
        final networkImage = controller.user.value.profilePicture;
        final image = networkImage.isNotEmpty ? networkImage : TImages.user;

        return controller.imageUploading.value
            ? const TShimmerEffect(width: 80, height: 80, radius: 80)
            : TCircularImage(
                image: image,
                width: 60,
                height: 60,
                padding: 0,
                isNetworkImage: networkImage.isNotEmpty,
              );
      }),
      trailing: IconButton(
          onPressed: onPressed,
          icon: const Icon(
            Iconsax.edit,
            color: TColors.white,
          )),
    );
  }
}
