import 'package:flutter/material.dart';
import 'package:fruitmarket/common/styles/spacing_styles.dart';
import 'package:fruitmarket/common/widgets/login_signup/form_divider.dart';
import 'package:fruitmarket/features/authentication/controllers/login/login_controller.dart';
import 'package:fruitmarket/features/authentication/screens/login/widgets/login_form.dart';
import 'package:fruitmarket/features/authentication/screens/login/widgets/login_header.dart';
import 'package:fruitmarket/common/widgets/login_signup/social_buttons.dart';
import 'package:fruitmarket/utils/constants/sizes.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return  Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyles.paddingWithAppBarHeight,
          child: Column(
            children: [
              //Logo, Title & SubTitle
            const  TLoginHeader(),
              //Form
            const  TLoginForm(),
              //Divider
           const   TFormDivider(textDivider: 'Or Sign In With'),
            const  SizedBox(height: TSizes.spaceBtwSections),
              //Footer
              TSocialButtons(onPressed:()=> controller.googleSignIn()),
            ],
          ),
        ),
      ),
    );
  }
}
