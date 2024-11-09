import 'package:flutter/material.dart';
import 'package:fruitmarket/common/widgets/loaders/animation_loader.dart';
import 'package:fruitmarket/utils/constants/colors.dart';
import 'package:fruitmarket/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

class TFullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!, // for overlay dialogs
      barrierDismissible:
          false, //The dialog can't be dismissed by tapping outside it
      builder: (_) => PopScope(
        canPop: false, // Disable popping with the back button
        child: Container(
          color: THelperFunction.isDarkMode(Get.context!)
              ? TColors.dark
              : TColors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 250),
              TAnimationLoaderWidget(text: text, animation: animation),
            ],
          ),
        ),
      ),
    );
  }

  // Stop the currently open Loading dialog
  static stopLoading() {
    Navigator.of(Get.overlayContext!)
        .pop(); // close the dialog using the Navigator
  }
}

// import 'package:flutter/material.dart';
// import 'package:fruitmarket/common/widgets/loaders/animation_loader.dart';
// import 'package:fruitmarket/utils/constants/colors.dart';
// import 'package:fruitmarket/utils/helpers/helper_functions.dart';
// import 'package:get/get.dart';

// class TFullScreenLoader {
//   static void openLoadingDialog(String text, String animation) {
//     showDialog(
//       context: Get.overlayContext!, // for overlay dialogs
//       barrierDismissible: false, // Prevent dismissal by tapping outside
//       builder: (_) => PopScope(
//         canPop: false, // Disable back button pop
//         child: SafeArea(
//           child: Container(
//             color: THelperFunction.isDarkMode(Get.context!)
//                 ? TColors.dark
//                 : TColors.white,
//             width: double.infinity,
//             height: double.infinity,
//             child: Center(
//               child: SingleChildScrollView(
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     SizedBox(
//                         height: MediaQuery.of(Get.context!).size.height *
//                             0.3), // Dynamic height
//                     TAnimationLoaderWidget(text: text, animation: animation),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   // Stop the currently open Loading dialog
//   static stopLoading() {
//     Navigator.of(Get.overlayContext!).pop(); // Close the dialog
//   }
// }
