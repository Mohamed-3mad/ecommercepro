import 'package:fruitmarket/features/shop/models/products_model.dart';
import 'package:hive_flutter/adapters.dart';

class CartService {
  static const String cartBox = 'cartBox';
  static const String wishlistBox = 'wishlistBox';

  // فتح الـ Box الخاص بالعربة
  static Future<Box<ProductModel>> getCartBox() async {
    return await Hive.openBox<ProductModel>(cartBox);
  }

  // فتح الـ Box الخاص بالمفضلة
  static Future<Box<ProductModel>> getWishlistBox() async {
    return await Hive.openBox<ProductModel>(wishlistBox);
  }

  // إضافة منتج إلى العربة
  static Future<void> addProductToCart(ProductModel product) async {
    var box = await getCartBox();
    await box.add(product);
  }

  // إضافة منتج إلى المفضلة
  static Future<void> addProductToWishlist(ProductModel product) async {
    var box = await getWishlistBox();
    await box.add(product);
  }

  // استرجاع جميع المنتجات في العربة
  static Future<List<ProductModel>> getCartProducts() async {
    var box = await getCartBox();
    return box.values.toList();
  }

  // استرجاع جميع المنتجات في المفضلة
  static Future<List<ProductModel>> getWishlistProducts() async {
    var box = await getWishlistBox();
    return box.values.toList();
  }
}
