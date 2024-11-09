// import 'package:cloud_firestore/cloud_firestore.dart';

// class CategoryModel {
//   String id;
//   String name;
//   String image;
//   String parentId;
//   bool isFeatured;

//   CategoryModel({
//     required this.id,
//     required this.name,
//     required this.image,
//     required this.isFeatured,
//     this.parentId = '',
//   });

//   //Empty Helper Function

//   static CategoryModel empty() =>
//       CategoryModel(id: '', image: '', isFeatured: false, name: '');

//   // Convert model to Json structure so that you can store data in Firebase
//   Map<String, dynamic> toJson() {
//     return {
//       'Name': name,
//       'Image': image,
//       'ParentId': id,
//       'IsFeatured': isFeatured,
//     };
//   }

//   //Map Json Record to The Model
//   factory CategoryModel.fromSnapshot(
//       DocumentSnapshot<Map<String, dynamic>> document) {
//     if (document.data() != null) {
//       final data = document.data();

//       //Map Json Record to the Model
//       return CategoryModel(
//         id: document.id,
//         name: data?['Name'] ?? "",
//         image: data?["image"] ?? '',
//         parentId: data?['ParentId'] ?? '',
//         isFeatured: data?['IsFeatured'] ?? false,
//       );
//     } else {
//       return CategoryModel.empty();
//     }
//   }
// }


class CategoryModel {
  // Category is just a string in this case, so we can represent it with a simple class.
  final String name;

  CategoryModel({required this.name});

  // A factory constructor to create a CategoryModel from a JSON object.
  factory CategoryModel.fromJson(String json) {
    return CategoryModel(name: json);
  }

  // Method to convert CategoryModel to JSON if needed for other purposes (optional).
  String toJson() {
    return name;
  }
}
