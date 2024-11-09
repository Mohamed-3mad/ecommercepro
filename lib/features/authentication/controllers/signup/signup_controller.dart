import 'package:flutter/widgets.dart';
import 'package:fruitmarket/common/widgets/loaders/loaders.dart';
import 'package:fruitmarket/data/repositories/authentication/authentication_repository.dart';
import 'package:fruitmarket/data/repositories/user/user_repository.dart';
import 'package:fruitmarket/features/authentication/models/user/user_model.dart';
import 'package:fruitmarket/features/authentication/screens/signup/verify_email.dart';
import 'package:fruitmarket/utils/constants/image_strings.dart';
import 'package:fruitmarket/utils/manager/network_manager.dart';
import 'package:fruitmarket/utils/popups/full_screen_loader.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

//Variables
  final hidePassword = true.obs; //Observable for hiding/showing password
  final privacyPolicy = false.obs;
  final email = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();

  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  //SignUp
  Future<void> signup() async {
    try {
      //Start Loading
      TFullScreenLoader.openLoadingDialog(
          "We are processing your information.....",
          TImages.emailCreatedSuccessfulImage);

      // Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }
      //Form Validation
      if (!signupFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //Privacy Policy Check
      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(
          title: "Accept Privacy Policy",
          message:
              "In order to create account, you must have to read and accept the Privacy Policy & Terms of Use.",
        );
        return;
      }

      //Register User in the firebase Authentication & save user data in the firebase

      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      //Save Authenticated user data in the firebase firestore
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: username.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );
      final userRepository = Get.put(UserRepository());

      await userRepository.saveUserRecord(newUser);

      //Remove Loader
      TFullScreenLoader.stopLoading();

      //show Success Message
      TLoaders.successSnackBar(
          title: "Congratulations",
          message: "Your account has been created! Verify email to continue");
      //Move to Verify email success
      Get.to(() => const VerifyEmailScreen());
    } catch (e) {
      // Remove Loader
      TFullScreenLoader.stopLoading();
      // Show some Generic Error to the user
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }

  Future<void> signupWithGoogle() async {
    try {
      // Start loading indicator
      TFullScreenLoader.openLoadingDialog(
        "We are processing your information.....",
        TImages.emailCreatedSuccessfulImage,
      );

      // Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Sign up with Google
      final userCredential =
          await AuthenticationRepository.instance.signupWithGoogle();

      if (userCredential != null) {
        // If signup is successful, create a new user model
        final newUser = UserModel(
          id: userCredential.user!.uid,
          firstName: userCredential.user!.displayName ?? '',
          lastName: '',
          username: userCredential.user!.email?.split('@').first ?? '',
          email: userCredential.user!.email ?? '',
          phoneNumber:
              '', // You can optionally prompt the user for a phone number
          profilePicture: userCredential.user!.photoURL ?? '',
        );

        // Save user data to Firestore
        final userRepository = Get.put(UserRepository());
        await userRepository.saveUserRecord(newUser);

        // Send email verification link if not verified yet
        if (!userCredential.user!.emailVerified) {
          await userCredential.user!.sendEmailVerification();
          TLoaders.successSnackBar(
            title: "Email Verification Sent",
            message: "Please check your inbox and verify your email address.",
          );
        }

        // Remove loader
        TFullScreenLoader.stopLoading();

        // Show success message and navigate to the next screen
        TLoaders.successSnackBar(
          title: "Congratulations",
          message: "Your Google account has been registered!",
        );
        Get.to(() => const VerifyEmailScreen());
      } else {
        TFullScreenLoader.stopLoading();
        TLoaders.errorSnackBar(
            title: "Oh Snap!", message: "Google signup failed.");
      }
    } catch (e) {
      // Remove loader
      TFullScreenLoader.stopLoading();
      // Show some generic error to the user
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }
}
