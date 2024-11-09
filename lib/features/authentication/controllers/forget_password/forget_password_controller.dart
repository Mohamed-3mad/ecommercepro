import 'package:flutter/material.dart';
import 'package:fruitmarket/common/widgets/loaders/loaders.dart';
import 'package:fruitmarket/data/repositories/authentication/authentication_repository.dart';
import 'package:fruitmarket/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:fruitmarket/utils/constants/image_strings.dart';
import 'package:fruitmarket/utils/manager/network_manager.dart';
import 'package:fruitmarket/utils/popups/full_screen_loader.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  // variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  // Send Reset Password Email
  sendPasswordResetEmail() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog(
          "Processing your request....", TImages.emailCreatedSuccessfulImage);

      // Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //Form Validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      // Send Email to reset Password
      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());

      //Remove Loader
      TFullScreenLoader.stopLoading();

      //show Success Message
      TLoaders.successSnackBar(
          title: "Email Sent",
          message: "Email Link Sent to Reset Your Password".tr);

      //Move to Verify email success
      Get.to(() => ResetPasswordScreen(email: email.text.trim()));
    } catch (e) {
      // Remove Loader
      TFullScreenLoader.stopLoading();
      // Show some Generic Error to the user
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog(
          "Processing your request....", TImages.emailCreatedSuccessfulImage);

      // Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Send Email to reset Password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      //Remove Loader
      TFullScreenLoader.stopLoading();

      //show Success Message
      TLoaders.successSnackBar(
          title: "Email Sent",
          message: "Email Link Sent to Reset Your Password".tr);
    } catch (e) {
      // Remove Loader
      TFullScreenLoader.stopLoading();
      // Show some Generic Error to the user
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }
}
