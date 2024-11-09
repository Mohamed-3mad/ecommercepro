import 'package:get/get.dart';

class HomeControllers extends GetxController {
  static HomeControllers get instance => Get.find();

  final carouselCurrentIndex = 0.obs;

  void updatePageIndicator(index) {
    carouselCurrentIndex.value = index;
  }
}
