import 'package:fruitmarket/common/widgets/loaders/loaders.dart';
import 'package:fruitmarket/features/shop/models/products_model.dart';
import 'package:get/get.dart';

class WishlistController extends GetxController {
  // Define a reactive list to hold the wishlist items
  var wishlistItems = <ProductModel>[].obs;

  // Add product to the wishlist
  void addToWishlist(ProductModel product) {
    if (!wishlistItems.contains(product)) {
      wishlistItems.add(product); // Add product if not already in wishlist
      TLoaders.successSnackBar(
          title: 'Added to wishlist', message: 'Keep Shopping');
    }
  }

  // Remove product from the wishlist
  void removeFromWishlist(ProductModel product) {
    wishlistItems.remove(product); // Remove product from the wishlist
    TLoaders.successSnackBar(
        title: 'Removed from wishlist', message: 'Go make your wishlist');
  }

   void toggleFavorite(ProductModel product) {
    // Toggle the favorite status of the product
    product.isFavorite.value = !product.isFavorite.value;
  }
}
