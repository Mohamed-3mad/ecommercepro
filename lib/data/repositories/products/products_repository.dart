import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:fruitmarket/data/services/api.dart';
import 'package:fruitmarket/features/shop/models/products_model.dart';
import 'package:fruitmarket/utils/exceptions/firebase_exceptions.dart';
import 'package:fruitmarket/utils/exceptions/platform_exceptions.dart';
import 'package:get/get.dart';

class ProductsRepository extends GetxController {
  static ProductsRepository get instance => Get.find();

  // Variables
  //final _db = FirebaseFirestore.instance;

  // Get all Categories
  Future<List<ProductModel>> getAllProducts() async {
    try {
      List<dynamic> data =
          await Api().get(url: 'https://fakestoreapi.com/products');

      List<ProductModel> productsList = [];
      for (int i = 0; i < data.length; i++) {
        productsList.add(
          ProductModel.fromJson(data[i]),
        );
      }
      return productsList;
    } on FirebaseException catch (e) {
      throw TFirebaseExceptions(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please try again.";
    }
  }
}
