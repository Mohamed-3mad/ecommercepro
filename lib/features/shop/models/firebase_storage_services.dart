import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class TFirebaseStorageServices extends GetxController {
  static TFirebaseStorageServices get instance => Get.find();

  final _firebaseStorage = FirebaseStorage.instance;

  //Upload Local Assets from IDE
  // Returns a Unit8List containint image data.

  Future<Uint8List> getImageDataFromAssets(String path) async {
    try {
      final byteData = await rootBundle.load(path);
      final imageData = byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);
      return imageData;
    } catch (e) {
      // Handle exceptions gracefully
      throw 'Error loading image data $e';
    }
  }

  // Upload Image using Image Data on Cloud Firestore Storage
  // Returns the download Url of the uploaded image
  Future<String> uploadImageData(
      String path, Uint8List image, String name) async {
    try {
      final ref = _firebaseStorage.ref(path).child(name);
      await ref.putData(image);
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      // Handle exceptions gracefully
      throw 'Error loading image data $e';
    }
  }

  // Upload Image using Image Data on Cloud Firestore Storage
  // Returns the download Url of the uploaded image
  Future<String> uploadImageFile(String path, XFile image) async {
    try {
      final ref = _firebaseStorage.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      // Handle exceptions gracefully
      if (e is FirebaseException) {
        throw 'FirebaseException: ${e.message}';
      } else if (e is SocketException) {
        throw 'SocketException: ${e.message}';
      } else if (e is PlatformException) {
        throw 'PlatformException: ${e.message}';
      } else {
        throw 'Something went wrong please try again';
      }
    }
  }
}
