import 'package:flutter/material.dart';
import 'package:fruitmarket/common/widgets/appbar/appbar.dart';
import 'package:fruitmarket/common/widgets/images/rounded_images.dart';
import 'package:fruitmarket/common/widgets/products/product_cards/product_card_horizintal.dart';
import 'package:fruitmarket/common/widgets/texts/section_heading.dart';
import 'package:fruitmarket/features/shop/controllers/category_controller.dart';
import 'package:fruitmarket/utils/constants/image_strings.dart';
import 'package:fruitmarket/utils/constants/sizes.dart';
import 'package:get/get.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key, required this.categoryName});

  final String categoryName;

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.find<CategoryController>();

    // استخدم addPostFrameCallback لتأجيل استدعاء الدالة بعد بناء الشاشة
    WidgetsBinding.instance.addPostFrameCallback((_) {
      categoryController.fetchCategoryProducts(categoryName);
    });

    return Scaffold(
      appBar: TAppBar(title: Text(categoryName), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // Banner
              TRoundedImage(
                width: double.infinity,
                applyImageRadius: true,
                imageUrl: categoryName == 'electronics'
                    ? TImages.elecBanner
                    : categoryName == 'jewelery'
                        ? TImages.jeweleryBanner
                        : categoryName == "men's clothing"
                            ? TImages.menBanner
                            : TImages.womenBanner,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              // Products List
              Obx(() {
                if (categoryController.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }

                return Column(
                  children: [
                    TSectionHeading(
                        showActionButton: false,
                        title: "$categoryName Products",
                        onPressed: () {}),
                    const SizedBox(height: TSizes.spaceBtwItems / 2),
                    SizedBox(
                      height: 120,
                      child: ListView.separated(
                        itemCount: categoryController.categoryProducts.length,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: TSizes.spaceBtwItems),
                        itemBuilder: (context, index) {
                          final product =
                              categoryController.categoryProducts[index];
                          return TProductCardHorizintal(product: product);
                        },
                      ),
                    ),
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
