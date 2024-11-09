import 'package:flutter/material.dart';
import 'package:fruitmarket/common/widgets/loaders/loaders.dart';
import 'package:fruitmarket/data/repositories/authentication/authentication_repository.dart';
import 'package:fruitmarket/features/personalization/controllers/user_controller.dart';
import 'package:fruitmarket/utils/constants/image_strings.dart';
import 'package:fruitmarket/utils/manager/network_manager.dart';
import 'package:fruitmarket/utils/popups/full_screen_loader.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();
  // variables
  final hidePassword = true.obs; //Observable for hiding/showing password
  final remeberMe = false.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  final userController = Get.put(UserController());

  @override
  void onInit() {
    // email.text = localStorage.read('REMEBER_ME_EMAIL');
    // password.text = localStorage.read('REMEBER_ME_PASSWORD');
    super.onInit();
  }

  //Email and password sign in
  Future<void> emailAndPasswordSignIn() async {
    try {
      //Start Loading
      TFullScreenLoader.openLoadingDialog(
          "Logging you in.....", TImages.emailCreatedSuccessfulImage);

      // Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }
      //Form Validation
      if (!loginFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Save data if Remember Me is Selected
      if (remeberMe.value) {
        localStorage.write('REMEBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEBER_ME_PASSWORD', password.text.trim());
      }

      //login User Using Email and password

      //final userCredential =
      await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      //Remove Loader
      TFullScreenLoader.stopLoading();

      //Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      // Remove Loader
      TFullScreenLoader.stopLoading();
      // Show some Generic Error to the user
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }

  // -- Google SignIn
  Future<void> googleSignIn() async {
    try {
      //Start Loading
      TFullScreenLoader.openLoadingDialog(
          "Logging you in.....", TImages.emailCreatedSuccessfulImage);

      // Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //Google Authentication
      final userCredentials =
          await AuthenticationRepository.instance.signInWithGoogle();

      // Save user Record
      await userController.saveUserRecord(userCredentials);

      // Remove Loader
      TFullScreenLoader.stopLoading();

      //Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      // Remove Loader
      TFullScreenLoader.stopLoading();
      // Show some Generic Error to the user
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }
}
