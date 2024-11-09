import 'package:flutter/material.dart';
import 'package:fruitmarket/common/widgets/appbar/appbar.dart';
import 'package:fruitmarket/features/personalization/screens/address/add_new_address.dart';
import 'package:fruitmarket/features/personalization/screens/address/widgets/single_address.dart';
import 'package:fruitmarket/utils/constants/colors.dart';
import 'package:fruitmarket/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: TColors.primaryColor,
        onPressed: () => Get.to(() => const AddNewAddressScreen()),
        child: const Icon(Iconsax.add, color: TColors.white),
      ),
      //appbar
      appBar: TAppBar(
          title: Text("Addresses",
              style: Theme.of(context).textTheme.headlineSmall),
          showBackArrow: true),

      //Body

      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              TSingleAddress(selectedAddress: true),
            ],
          ),
        ),
      ),
    );
  }
}
