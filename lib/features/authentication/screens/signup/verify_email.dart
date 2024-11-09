import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruitmarket/data/repositories/authentication/authentication_repository.dart';
import 'package:fruitmarket/features/authentication/controllers/signup/verify_email_controller.dart';
import 'package:fruitmarket/utils/constants/image_strings.dart';
import 'package:fruitmarket/utils/constants/sizes.dart';
import 'package:fruitmarket/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () =>
                  Get.offAll(() => AuthenticationRepository.instance.logout()),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //Image
              Image(
                width: THelperFunction.screenWidth() * .6,
                image: const AssetImage(TImages.emailCreatedSuccessfulImage),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              //Title
              Text(
                "Verify your email address!",
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              Text(
                email ?? '',
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              //Subtitle
              Text(
                "Congratulations! Your Account Awaits: Verify Your Email to Start Shopping and Experience a World of Unrivaled Deals and Personalized Offers",
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              //Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.checkEmailVerificationStatus(),
                    child: const Text("Continue")),
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              //Buttons
              SizedBox(
                width: double.infinity,
                child: TextButton(
                    onPressed: () => controller.sendEmailVerification(),
                    child: const Text("Resend Email")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
