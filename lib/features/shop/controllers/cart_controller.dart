import 'package:fruitmarket/features/shop/models/products_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var cartItems =
      <ProductModel, int>{}.obs; // Product as key, quantity as value

  void addToCart(ProductModel product) {
    if (cartItems.containsKey(product)) {
      cartItems[product] = cartItems[product]! + 1;
    } else {
      cartItems[product] = 1;
    }
  }

  // Calculate Price
  double getTotalPrice() {
    double total = 0.0;
    cartItems.forEach((product, quantity) {
      total += product.price * quantity; // ضرب السعر في الكمية
    });
    return total;
  }

  void removeFromCart(ProductModel product) {
    if (cartItems.containsKey(product) && cartItems[product]! > 1) {
      cartItems[product] = cartItems[product]! - 1;
    } else {
      cartItems.remove(product);
    }
  }

  int getProductQuantity(ProductModel product) {
    return cartItems[product] ?? 0;
  }

  void clearCart() {
    cartItems.clear();
  }

  int get cartCount =>
      cartItems.values.fold(0, (sum, quantity) => sum + quantity);
}
