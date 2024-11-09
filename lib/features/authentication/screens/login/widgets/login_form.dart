import 'package:flutter/material.dart';
import 'package:fruitmarket/features/authentication/controllers/login/login_controller.dart';
import 'package:fruitmarket/features/authentication/screens/password_configuration/forget_passsword.dart';
import 'package:fruitmarket/features/authentication/screens/signup/signup.dart';
import 'package:fruitmarket/utils/constants/sizes.dart';
import 'package:fruitmarket/utils/validators/validation.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          children: [
            TextFormField(
              controller: controller.email,
              validator: (value) => TValidator.validateEmail(value),
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: "Email",
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            Obx(
              () => TextFormField(
                controller: controller.password,
                validator: (value) => TValidator.validatePassword(value),
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                  labelText: "Password",
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                      onPressed: () => controller.hidePassword.value =
                          !controller.hidePassword.value,
                      icon: Icon(controller.hidePassword.value
                          ? Iconsax.eye_slash
                          : Iconsax.eye)),
                ),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields / 2),

            //Remember me & forget password

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Remember me
                Row(
                  children: [
                    Obx(() => Checkbox(
                        value: controller.remeberMe.value,
                        onChanged: (value) => controller.remeberMe.value =
                            !controller.remeberMe.value)),
                    const Text("Remember Me"),
                  ],
                ),
                //Forget Password
                TextButton(
                    onPressed: () => Get.to(() => const ForgetPasssword()),
                    child: const Text('Forget Password?')),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            //Sign in Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => controller.emailAndPasswordSignIn(),
                  child: const Text("Sign In")),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            //Create account Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                  onPressed: () => Get.to(() => const SignupScreen()),
                  child: const Text("Create Account")),
            ),
          ],
        ),
      ),
    );
  }
}
