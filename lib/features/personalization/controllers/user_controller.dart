import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fruitmarket/common/widgets/loaders/loaders.dart';
import 'package:fruitmarket/data/repositories/authentication/authentication_repository.dart';
import 'package:fruitmarket/data/repositories/user/user_repository.dart';
import 'package:fruitmarket/features/authentication/models/user/user_model.dart';
import 'package:fruitmarket/features/authentication/screens/login/login.dart';
import 'package:fruitmarket/features/personalization/screens/profile/widgets/re_authenticate_user_login_form.dart';
import 'package:fruitmarket/utils/constants/colors.dart';
import 'package:fruitmarket/utils/constants/image_strings.dart';
import 'package:fruitmarket/utils/constants/sizes.dart';
import 'package:fruitmarket/utils/manager/network_manager.dart';
import 'package:fruitmarket/utils/popups/full_screen_loader.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  final imageUploading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;
  final userRepository = Get.put(UserRepository());

  final hidePassword = true.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
      profileLoading.value = false;
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  // Save user Record from any registration provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      await fetchUserRecord();
      if (user.value.id.isEmpty) {
        if (userCredentials != null) {
          // Convert Name to First and Last name
          final nameParts =
              UserModel.nameParts(userCredentials.user!.displayName ?? '');
          final username = UserModel.generateUsername(
              userCredentials.user!.displayName ?? '');

          //Map Data
          final user = UserModel(
              id: userCredentials.user!.uid,
              username: username,
              email: userCredentials.user!.email ?? '',
              firstName: nameParts[0],
              lastName:
                  nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
              phoneNumber: userCredentials.user!.phoneNumber ?? '',
              profilePicture: userCredentials.user!.photoURL ?? '');

          //Save user data
          await userRepository.saveUserRecord(user);
        }
      }
    } catch (e) {
      TLoaders.warningSnackBar(
          title: 'Data not saved',
          message:
              'Something went wrong while saving your information. You can re-save your data in your Profile');
    }
  }

  // Delete Account Warning
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(TSizes.md),
      title: 'Delete Account',
      middleText: 'Are you sure you want to delete your account?',
      confirm: ElevatedButton(
        onPressed: () async => deleteUserAccount(),
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            side: const BorderSide(color: Colors.red)),
        child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: TSizes.lg),
            child: Text('Delete')),
      ),
      cancel: OutlinedButton(
          onPressed: () => Navigator.of(Get.overlayContext!).pop(),
          child: const Text('Cancel')),
    );
  }

  // LogOut  Warning
  void logoutAccountWarningPopup() {
    final controller = Get.put(AuthenticationRepository());
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(TSizes.md),
      title: 'Logout',
      middleText: 'Are you sure you want to logout?',
      confirm: ElevatedButton(
        onPressed: () async => controller.logout(),
        style: ElevatedButton.styleFrom(
            backgroundColor: TColors.primaryColor,
            side: const BorderSide(color: TColors.primaryColor)),
        child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: TSizes.lg),
            child: Text('Logout')),
      ),
      cancel: OutlinedButton(
          onPressed: () => Navigator.of(Get.overlayContext!).pop(),
          child: const Text('Cancel')),
    );
  }

  // Delete User Account
  // void deleteUserAccount() async {
  //   try {
  //     TFullScreenLoader.openLoadingDialog(
  //         "Processing", TImages.emailCreatedSuccessfulImage);

  //     // First re-authenticates user
  //     final auth = AuthenticationRepository.instance;
  //     final provider =
  //         auth.authUser!.providerData.map((e) => e.providerId).first;
  //     if (provider.isNotEmpty) {
  //       // Re Verify Auth Email
  //       if (provider == 'google.cone') {
  //         await auth.signInWithGoogle();
  //         await auth.deleteAccount();
  //         TFullScreenLoader.stopLoading();
  //         Get.offAll(() => const LoginScreen());
  //       } else if (provider == 'password') {
  //         TFullScreenLoader.stopLoading();
  //         Get.to(() => const ReAuthLoginForm());
  //       }
  //     }
  //   } catch (e) {
  //     TFullScreenLoader.stopLoading();
  //     TLoaders.warningSnackBar(
  //         title: 'Oh Snap', message: 'Something went wrong ${e.toString()}');
  //   }
  // }

  void deleteUserAccount() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          "Processing", TImages.emailCreatedSuccessfulImage);

      final auth = AuthenticationRepository.instance;

      if (auth.authUser == null) {
        TLoaders.warningSnackBar(title: 'Error', message: 'No user logged in');
        return;
      }

      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;
      print(provider); // تحقق من الـ providerId

      if (provider.isNotEmpty) {
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          TFullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        } else if (provider == 'password') {
          TFullScreenLoader.stopLoading();
          Get.to(() => const ReAuthLoginForm());
        }
      } else {
        TFullScreenLoader.stopLoading();
        TLoaders.warningSnackBar(title: 'Error', message: 'Provider not found');
      }
    } catch (e, stacktrace) {
      TFullScreenLoader.stopLoading();
      TLoaders.warningSnackBar(
          title: 'Oh Snap',
          message:
              'Something went wrong: ${e.toString()} \n StackTrace: $stacktrace');
    }
  }

  // Re-authenticate before deleting
  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          "Processing", TImages.emailCreatedSuccessfulImage);

      // Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }
      //Form Validation
      if (!reAuthFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      await AuthenticationRepository.instance
          .reAuthenticateWithEmailAndPassword(
              verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      TFullScreenLoader.stopLoading();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.warningSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  //Upload User Profile Picture
  uploadUserProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 70,
          maxHeight: 512,
          maxWidth: 512);
      if (image != null) {
        imageUploading.value = true;
        //Upload Image
        final imageUrl =
            await userRepository.uploadImage('Users/Images/Profile', image);

        // Update User Image Record
        Map<String, dynamic> json = {'ProfilePicture': imageUrl};
        await userRepository.updateSingleField(json);

        user.value.profilePicture = imageUrl;
        user.refresh();
        TLoaders.successSnackBar(
            title: 'Congratulation',
            message: 'Your Profile Image has been updated!');
      }
    } catch (e) {
      TLoaders.errorSnackBar(
          title: 'Oh Snap', message: 'Something went wrong ${e.toString()}');
    } finally {
      imageUploading.value = false;
    }
  }
}
