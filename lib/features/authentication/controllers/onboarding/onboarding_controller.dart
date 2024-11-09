import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fruitmarket/features/authentication/screens/login/login.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnboardingController extends GetxController {
  static OnboardingController get instance => Get.find();

//Variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs; //change screens without stateful widget
  //update current index when page Scroll
  void updatePageIndicator(index) => currentPageIndex.value = index;

  //jump to the specific dot selected page
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

//update current index & jump to next page
  void nextPage() {
    if (currentPageIndex.value == 2) {
      final storage = GetStorage();

      if (kDebugMode) {
        print('-----------------Get Storage Next Button -----------------');
        print(storage.read('IsFirstTime'));
      }
      storage.write("IsFirstTime", false);

      if (kDebugMode) {
        print('-----------------Get Storage Next Button -----------------');
        print(storage.read('IsFirstTime'));
      }

      Get.offAll(const LoginScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

//update current index & jump to last page
  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }
}
