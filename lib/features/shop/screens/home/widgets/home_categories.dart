import 'package:flutter/material.dart';
import 'package:fruitmarket/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:fruitmarket/common/widgets/shimmers/category_shimmers.dart';
import 'package:fruitmarket/features/shop/controllers/category_controller.dart';
import 'package:fruitmarket/features/shop/screens/sub_category/sub_categories.dart';
import 'package:fruitmarket/utils/constants/image_strings.dart';
import 'package:get/get.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());

    return Obx(() {
      if (categoryController.isLoading.value) return const TCategoryShimmer();
      if (categoryController.allCategories.isEmpty) {
        return Center(
            child: Text("No Data Found!",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .apply(color: Colors.white)));
      }
      return SizedBox(
        height: 80,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: categoryController.allCategories.length,
          itemBuilder: (_, index) {
            final category = categoryController.allCategories[index];
            return TVerticalImageText(
              isNetworkImage: false,
              title: category.name,
              image: category.name == 'electronics'
                  ? TImages.electronicsIcon
                  : category.name == 'jewelery'
                      ? TImages.jeweleryIcon
                      : category.name == "men's clothing"
                          ? TImages.menClothesIcon
                          : TImages.womenClothesIcon,
              onTap: () {
                // Navigate first and fetch the category products on the target screen
                Get.to(() => SubCategoriesScreen(categoryName: category.name));
              },
            );
          },
        ),
      );
    });
  }
}
