import 'package:flutter/material.dart';
import 'package:fruitmarket/common/widgets/appbar/appbar.dart';
import 'package:fruitmarket/features/authentication/controllers/update_name/update_name_controller.dart';
import 'package:fruitmarket/utils/constants/sizes.dart';
import 'package:fruitmarket/utils/validators/validation.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      appBar: TAppBar(
          showBackArrow: true,
          title: Text("Change Name",
              style: Theme.of(context).textTheme.headlineSmall)),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Headings
            Text(
              "Use real name for easy verification. this name will appear on several pages,",
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            //Text Field and Button
            Form(
                key: controller.updateUserNameFormKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.firstName,
                      validator: (value) =>
                          TValidator.validateEmptyText("First name", value),
                      expands: false,
                      decoration: const InputDecoration(
                          labelText: 'First Name',
                          prefixIcon: Icon(Iconsax.user)),
                    ),
                    const SizedBox(height: TSizes.spaceBtwSections),
                    TextFormField(
                      controller: controller.lastName,
                      validator: (value) =>
                          TValidator.validateEmptyText("Last name", value),
                      expands: false,
                      decoration: const InputDecoration(
                          labelText: 'Last Name',
                          prefixIcon: Icon(Iconsax.user)),
                    ),
                  ],
                )),
            const SizedBox(height: TSizes.spaceBtwSections),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => controller.updateUserName(),
                  child: const Text("Save")),
            )
          ],
        ),
      ),
    );
  }
}
