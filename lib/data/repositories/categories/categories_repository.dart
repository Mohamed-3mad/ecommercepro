import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:fruitmarket/data/services/api.dart';
import 'package:fruitmarket/features/shop/models/products_model.dart';
import 'package:fruitmarket/utils/exceptions/firebase_exceptions.dart';
import 'package:fruitmarket/utils/exceptions/platform_exceptions.dart';
import 'package:get/get.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  // Get all Categories
  Future<List<dynamic>> getAllCateogires() async {
    try {
      List<dynamic> data =
          await Api().get(url: 'https://fakestoreapi.com/products/categories');

      return data;
    } on FirebaseException catch (e) {
      throw TFirebaseExceptions(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please try again.";
    }
  }

  // Get Category
  Future<List<ProductModel>> getCategoriesProducts(
      {required String categoryName}) async {
    try {
        List<dynamic> data = await Api()
          .get(url: 'https://fakestoreapi.com/products/category/$categoryName');
      return data.map((json) => ProductModel.fromJson(json)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseExceptions(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please try again.";
    }
  }

  // // Get Sub Categories

  // // Upload Categories to the Cloud Firestore
  // Future<void> uploadDummyData(List<CategoryModel> categories) async{

  //   try{
  //     // Upload all the Categories along with their Images
  //     final storage = Get.put(TFirebaseStorageServices());

  //     // Loop through each Category

  //      for(var category in categories){
  //       // Get ImageData link from the local assets
  //       final file = await storage.getImageDataFromAssets(category.image);

  //       //upload Image and get its URL

  //       final url = await storage.uploadImageData('Categories',file,category.name);

  //       //Assign URL to Category.image attribute
  //       category.image= url;

  //       //Store Category in Firestore
  //       await _db.collection('Categories').doc(category.id).set(category.toJson());
  //      }
  //   }on FirebaseException catch (e) {
  //     throw TFirebaseExceptions(e.code).message;
  //   } on PlatformException catch (e) {
  //     throw TPlatformException(e.code).message;
  //   } catch (e) {
  //     throw "Something went wrong. Please try again.";
  //   }
  // }
}
