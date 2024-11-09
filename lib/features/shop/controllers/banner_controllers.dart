import 'package:fruitmarket/common/widgets/loaders/loaders.dart';
import 'package:get/get.dart';

class BannerControllers extends GetxController {
  static BannerControllers get instance => Get.find();
//Variables
  final carouselCurrentIndex = 0.obs;
  final isLoading = false.obs;

  void updatePageIndicator(index) {
    carouselCurrentIndex.value = index;
  }

  //Fetch Banner
  // Load Category data
  Future<void> fetchBanners() async {
    try {
      // show Loader while Loading categories
      isLoading.value = true;

      // Fetch categories from data source (Firestore,Api)

      // Update the categories list

      //Filter featured categories
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      //Remove Loader
      isLoading.value = false;
    }
  }
}
