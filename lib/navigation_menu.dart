import 'package:flutter/material.dart';
import 'package:fruitmarket/features/personalization/screens/settings/settings.dart';
import 'package:fruitmarket/features/shop/screens/home/home.dart';
import 'package:fruitmarket/features/shop/screens/store/store.dart';
import 'package:fruitmarket/features/shop/screens/wishlist/wishlist.dart';
import 'package:fruitmarket/utils/constants/colors.dart';
import 'package:fruitmarket/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = THelperFunction.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Obx(
        //Obx to rebuild Navigation only
        () => NavigationBar(
          height: 80,
          elevation: 0,
          backgroundColor: darkMode ? TColors.black : TColors.white,
          indicatorColor: darkMode
              ? TColors.white.withOpacity(.1)
              : TColors.black.withOpacity(.1),
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: "Home"),
            NavigationDestination(icon: Icon(Iconsax.shop), label: "Store"),
            NavigationDestination(icon: Icon(Iconsax.heart), label: "Wishlist"),
            NavigationDestination(icon: Icon(Iconsax.user), label: "Profile"),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    const HomeScreen(),
    const StoreScreen(),
    const FavoriteScreen(),
    const SettingsScreen(),
  ];
}
