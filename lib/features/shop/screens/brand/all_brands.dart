import 'package:flutter/material.dart';
import 'package:fruitmarket/common/widgets/appbar/appbar.dart';
import 'package:fruitmarket/common/widgets/brands/brand_card.dart';
import 'package:fruitmarket/common/widgets/layouts/grid_layout.dart';
import 'package:fruitmarket/common/widgets/texts/section_heading.dart';
import 'package:fruitmarket/features/shop/controllers/category_controller.dart';
import 'package:fruitmarket/features/shop/screens/brand/brand_products.dart';
import 'package:fruitmarket/utils/constants/sizes.dart';
import 'package:get/get.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());
    return Scaffold(
      appBar: const TAppBar(title: Text("Brand"), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //Heading
              const TSectionHeading(title: "Brands", showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),

              //Brands
              TGridLayout(
                  mainAxisExtent: 80,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    final category =
                                  categoryController.allCategories[index];
                  return  TBrandCard(
                    name:category.name ,
                        showBorder: true,
                        onTap: () => Get.to(() => const BrandProducts()),
                      );}),
            ],
          ),
        ),
      ),
    );
  }
}
