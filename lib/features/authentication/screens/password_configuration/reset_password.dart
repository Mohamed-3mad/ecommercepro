import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruitmarket/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:fruitmarket/features/authentication/screens/login/login.dart';
import 'package:fruitmarket/utils/constants/image_strings.dart';
import 'package:fruitmarket/utils/constants/sizes.dart';
import 'package:fruitmarket/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(CupertinoIcons.clear)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // Image
              Image(
                width: THelperFunction.screenWidth() * .6,
                image: const AssetImage(TImages.emailCreatedSuccessfulImage),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              //Email
              Text(
                email,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              //Title
              Text(
                "Password Reset Email Sent",
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              //Subtitle
              Text(
                "Your Account Security is Our Priority! We've Sent You a Secure Link to Safely Change Your Password and Keep Your Account Protected ",
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              //Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => Get.offAll(() => const LoginScreen()),
                    child: const Text("Done")),
              ),
              const SizedBox(
                  height: TSizes.spaceBtwItems), // 16 pixels of spacing
              TextButton(
                onPressed: () => ForgetPasswordController.instance
                    .resendPasswordResetEmail(email),
                child: const Text("Resend Email"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
