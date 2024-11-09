import 'package:flutter/material.dart';
import 'package:fruitmarket/common/widgets/appbar/appbar.dart';
import 'package:fruitmarket/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:fruitmarket/common/widgets/list_tile/settings_menu_tile.dart';
import 'package:fruitmarket/common/widgets/list_tile/user_profile_tile.dart';
import 'package:fruitmarket/common/widgets/texts/section_heading.dart';
import 'package:fruitmarket/features/personalization/controllers/user_controller.dart';
import 'package:fruitmarket/features/personalization/screens/address/address.dart';
import 'package:fruitmarket/features/personalization/screens/profile/profile.dart';
import 'package:fruitmarket/features/shop/screens/cart/cart.dart';
import 'package:fruitmarket/features/shop/screens/order/order.dart';
import 'package:fruitmarket/utils/constants/colors.dart';
import 'package:fruitmarket/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final controller = Get.put(AuthenticationRepository());
    final userController = UserController.instance;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Header
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  TAppBar(
                      title: Text("Account",
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .apply(color: TColors.white))),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  //User Profile Card
                  TUserProfileTile(
                      onPressed: () => Get.to(() => const ProfileScreen())),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  //
                ],
              ),
            ),

            //Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  //Account settings
                  const TSectionHeading(
                      title: "Account Settings", showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  TSettingsMenuTile(
                      icon: Iconsax.safe_home,
                      title: "My Addresses",
                      subtitle: "Set Shopping delivery address",
                      onTap: () => Get.to(() => const UserAddressScreen())),
                  TSettingsMenuTile(
                      icon: Iconsax.bank,
                      title: "My Cart",
                      subtitle: "Add, remove products and move to checkout",
                      onTap: () => Get.to(() => const CartScreen())),
                  TSettingsMenuTile(
                      icon: Iconsax.shopping_cart,
                      title: "My Orders",
                      subtitle: "In-progress and Completed Orders",
                      onTap: () => Get.to(() => const OrderScreen())),
                  TSettingsMenuTile(
                      icon: Iconsax.bag_tick,
                      title: "Bank Account",
                      subtitle: "Withdraw balance to registered bank account",
                      onTap: () {}),

                  TSettingsMenuTile(
                      icon: Iconsax.discount_shape,
                      title: "My Coupons",
                      subtitle: "List of all the dicounted coupons",
                      onTap: () {}),
                  TSettingsMenuTile(
                      icon: Iconsax.notification,
                      title: "Notifications",
                      subtitle: "Set any kind of notification message",
                      onTap: () {}),
                  TSettingsMenuTile(
                      icon: Iconsax.security_card,
                      title: "Account Privacy",
                      subtitle: "Manage data usage and connected accounts",
                      onTap: () {}),

                  //App Settings
                  const SizedBox(height: TSizes.spaceBtwSections),
                  const TSectionHeading(
                      title: "App Settings", showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  TSettingsMenuTile(
                      icon: Iconsax.document_upload,
                      title: "Load Data",
                      subtitle: "Upload Data to your Cloud Firebase",
                      onTap: () {}),

                  TSettingsMenuTile(
                      icon: Iconsax.location,
                      title: "Geolocation",
                      subtitle: "Set recommendation based on location",
                      trailing: Switch(value: true, onChanged: (value) {}),
                      onTap: () {}),
                  TSettingsMenuTile(
                      icon: Iconsax.security_user,
                      title: "Safe Mode",
                      subtitle: "Search result is safe for all ages",
                      trailing: Switch(value: false, onChanged: (value) {}),
                      onTap: () {}),

                  TSettingsMenuTile(
                      icon: Iconsax.image,
                      title: "HD Image Quality",
                      subtitle: "Set image quality to be seen",
                      trailing: Switch(value: false, onChanged: (value) {}),
                      onTap: () {}),

                  //Logout Button
                  const SizedBox(height: TSizes.spaceBtwSections),
                  SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                          onPressed: () =>
                              userController.logoutAccountWarningPopup(),
                          child: const Text("Logout"))),
                  const SizedBox(height: TSizes.spaceBtwSections * 2.5),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}