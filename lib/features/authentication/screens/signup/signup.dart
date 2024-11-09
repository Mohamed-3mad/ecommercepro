import 'package:flutter/material.dart';
import 'package:fruitmarket/common/widgets/login_signup/form_divider.dart';
import 'package:fruitmarket/common/widgets/login_signup/social_buttons.dart';
import 'package:fruitmarket/features/authentication/controllers/signup/signup_controller.dart';
import 'package:fruitmarket/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:fruitmarket/utils/constants/sizes.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Title
              Text("Let's create your account",
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: TSizes.spaceBtwSections),
              const TSignupForm(),
              const SizedBox(height: TSizes.spaceBtwSections),
              //Divider
              const TFormDivider(textDivider: 'Or Sign Up With'),
              const SizedBox(height: TSizes.spaceBtwSections),
              //Footer
              TSocialButtons(onPressed: () => controller.signupWithGoogle()),
            ],
          ),
        ),
      ),
    );
  }
}
