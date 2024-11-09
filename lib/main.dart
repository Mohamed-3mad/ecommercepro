import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:fruitmarket/app.dart';
import 'package:fruitmarket/data/repositories/authentication/authentication_repository.dart';
import 'package:fruitmarket/data/repositories/checkout/payment_repository.dart';
import 'package:fruitmarket/features/shop/controllers/cart_controller.dart';
import 'package:fruitmarket/features/shop/controllers/payment_controller.dart';
import 'package:fruitmarket/features/shop/controllers/wishlist_controller.dart';
import 'package:fruitmarket/firebase_options.dart';
import 'package:fruitmarket/utils/stripe/api_keys.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Inject repositories and controllers using GetX dependency management

  // Initialize Stripe with publishable key
  Stripe.publishableKey = ApiKeys.publishableKey;
  // Register PaymentRepository with GetX
  Get.lazyPut(() => PaymentRepository(ApiKeys.secretKey));

  // Register PaymentController with GetX
  Get.put(PaymentController(Get.find())); // Inject PaymentController

  Get.put(CartController());
  Get.put(WishlistController());

  // --GetX Local Storage
  await GetStorage.init();

  // Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((FirebaseApp value) => Get.put(AuthenticationRepository()));

  runApp(const EcommerceApp());
}
