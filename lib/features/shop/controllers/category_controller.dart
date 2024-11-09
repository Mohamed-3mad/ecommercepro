// import 'package:fruitmarket/common/widgets/loaders/loaders.dart';
// import 'package:fruitmarket/data/repositories/categories/categories_repository.dart';
// import 'package:fruitmarket/features/shop/models/products_model.dart';
// import 'package:get/get.dart';
// import 'package:fruitmarket/features/shop/models/category_model.dart';

// class CategoryController extends GetxController {
//   final isLoading = false.obs; // Indicates loading state
//   final _categoryRepository = Get.put(CategoryRepository());
//   final RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
//   final RxList<ProductModel> categoryProducts = <ProductModel>[].obs;

//   @override
//   void onInit() {
//     super.onInit();
//     fetchCategories(); // Fetch categories when the controller is initialized
//   }

//   // Fetch All categories from the API
//   Future<void> fetchCategories() async {
//     try {
//       isLoading.value = true; // Set loading state to true

//       // Fetch categories from repository (API)
//       final response = await _categoryRepository.getAllCateogires();
//       // Map the List<dynamic> to a List<CategoryModel>
//       allCategories.assignAll(response
//           .map((category) => CategoryModel.fromJson(category))
//           .toList());
//     } catch (e) {
//       // Show error if fetching categories fails
//       TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
//     } finally {
//       isLoading.value = false; // Set loading state to false
//     }
//   }

//   // Fetch products for a specific category by category name
//   Future<void> fetchCategoryProducts(String categoryName) async {
//     try {
//       isLoading.value = true; // Start loading

//       // Fetch products based on category name
//       final products = await _categoryRepository.getCategoriesProducts(
//           categoryName: categoryName);
//       // Update the categoryProducts list
//       categoryProducts.assignAll(products);
//     } catch (e) {
//       // Show error message if fetching category products fails
//       TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
//     } finally {
//       isLoading.value = false; // Set loading state to false
//     }
//   }

// }

import 'package:fruitmarket/common/widgets/loaders/loaders.dart';
import 'package:fruitmarket/data/repositories/categories/categories_repository.dart';
import 'package:fruitmarket/features/shop/models/products_model.dart';
import 'package:get/get.dart';
import 'package:fruitmarket/features/shop/models/category_model.dart';

class CategoryController extends GetxController {
  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  final RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  final RxList<ProductModel> categoryProducts = <ProductModel>[].obs;
  var filteredProducts = <ProductModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategories(); // Fetch categories on initialization
  }

  // Fetch categories and initialize products for the first category
  Future<void> fetchCategories() async {
    try {
      isLoading.value = true;
      final response = await _categoryRepository.getAllCateogires();
      allCategories.assignAll(response
          .map((category) => CategoryModel.fromJson(category))
          .toList());

      // Fetch products for the first category if categories are loaded
      if (allCategories.isNotEmpty) {
        fetchCategoryProducts(allCategories.first.name);
      }
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // Fetch products for a specific category by category name
  Future<void> fetchCategoryProducts(String categoryName) async {
    try {
      isLoading.value = true;
      final products = await _categoryRepository.getCategoriesProducts(
          categoryName: categoryName);
      categoryProducts.assignAll(products);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void searchProducts(String query) {
    if (query.isEmpty) {
      filteredProducts.value = categoryProducts;
    } else {
      filteredProducts.value = categoryProducts
          .where((product) =>
              product.category.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }
}
