import 'package:fruitmarket/common/widgets/loaders/loaders.dart';
import 'package:fruitmarket/data/repositories/products/products_repository.dart';
import 'package:fruitmarket/features/shop/models/products_model.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  // Variables
  final isLoading = false.obs; // Indicates loading state
  final _productRepository = Get.put(ProductsRepository());
  var filteredProducts = <ProductModel>[].obs;
  final RxList<ProductModel> allProducts = <ProductModel>[].obs;
  final RxList<ProductModel> featuredProducts = <ProductModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts(); // Fetch products as soon as the controller is initialized
  }

  // Load all products
  Future<void> fetchProducts() async {
    try {
      // isLoading.value = true; // Set loading state to true

      // // Fetch products from repository
      // final products = await _productRepository.getAllProducts();

      // // Update the allProducts list with fetched data
      // allProducts.assignAll(products);
       isLoading.value = true; // بدء تحميل المنتجات

    // جلب المنتجات من المستودع
    final products = await _productRepository.getAllProducts();

    // تحديث قائمة allProducts و filteredProducts بالبيانات المحملة
    allProducts.assignAll(products);
    filteredProducts.assignAll(products); // تأكد من عرض جميع المنتجات عند التحميل

    } catch (e) {
      // Show an error snackbar if something goes wrong
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      // Set loading state to false once the fetch is complete
      isLoading.value = false;
    }
  }

  void searchProducts(String query) {
    if (query.isEmpty) {
      filteredProducts.value = allProducts;
    } else {
      filteredProducts.value = allProducts
          .where((product) => product.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }
}
