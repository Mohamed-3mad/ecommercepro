import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruitmarket/common/widgets/loaders/loaders.dart';
import 'package:fruitmarket/common/widgets/success_screen/success_screen.dart';
import 'package:fruitmarket/data/repositories/authentication/authentication_repository.dart';
import 'package:fruitmarket/utils/constants/image_strings.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  //Send Email Verification link

  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAuthRedirect();
    super.onInit();
  }

  // Send email verification
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      TLoaders.successSnackBar(
          title: "Email Sent",
          message: "Please check your inbox and verify your email.");
    } catch (e) {
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }

  //Timer to automatically redirect on email verification
  setTimerForAuthRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(() => SuccessScreen(
            onPressed: () => AuthenticationRepository.instance.screenRedirect(),
            image: TImages.emailCreatedSuccessfulImage,
            title: "Your Email Created Successfully",
            subTitle:
                'your email created, join us now and make your wishlist '));
      }
    });
  }

  // Manually check if email Verified
  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(() => SuccessScreen(
          onPressed: () => AuthenticationRepository.instance.screenRedirect(),
          image: TImages.emailCreatedSuccessfulImage,
          title: "Your Email Created Successfully",
          subTitle: 'your email created, join us now and make your wishlist '));
    }
  }
}
