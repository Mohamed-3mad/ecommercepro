import 'package:flutter/material.dart';
import 'package:fruitmarket/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:fruitmarket/common/widgets/texts/product_title_text.dart';
import 'package:fruitmarket/common/widgets/texts/section_heading.dart';
import 'package:fruitmarket/features/shop/models/products_model.dart';
import 'package:fruitmarket/utils/constants/colors.dart';
import 'package:fruitmarket/utils/constants/sizes.dart';
import 'package:fruitmarket/utils/helpers/helper_functions.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    final priceAddition = product.price + 50.0;
    return Column(
      children: [
        // Selected Attribute Pricing & Description
        TRoundedContainer(
          padding: const EdgeInsets.all(TSizes.md),
          backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
          child: Column(
            children: [
              // Title Price & Stock Status
              Row(
                children: [
                  const TSectionHeading(
                      title: "Variation", showActionButton: false),
                  const SizedBox(width: TSizes.spaceBtwItems),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const TProductTitleText(
                              title: "Price : ", smallSize: true),

                          //Actual Price
                          Text(priceAddition.toString().substring(0, 4),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .apply(
                                      decoration: TextDecoration.lineThrough)),

                          const SizedBox(width: TSizes.spaceBtwItems),

                          //Sale Price
                          TProductTitleText(title: product.price.toString()),
                        ],
                      ),

                      //Stock
                      Row(
                        children: [
                          const TProductTitleText(
                              title: "Stock : ", smallSize: true),
                          Text("In Stock",
                              style: Theme.of(context).textTheme.titleMedium),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              //Variation Description
              TProductTitleText(
                title: product.description,
                maxLines: 4,
                smallSize: true,
              ),
            ],
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwItems),

        // //Attributes
        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     const TSectionHeading(title: "Colors", showActionButton: false),
        //     const SizedBox(height: TSizes.spaceBtwItems / 2),
        //     Wrap(
        //       spacing: 8,
        //       children: [
        //         TChoiceChip(
        //             text: "Green", selected: true, onSelected: (value) {}),
        //         TChoiceChip(
        //             text: "Blue", selected: false, onSelected: (value) {}),
        //         TChoiceChip(
        //             text: "Yellow", selected: false, onSelected: (value) {}),
        //       ],
        //     ),
        //   ],
        // ),
        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     const TSectionHeading(title: "Size", showActionButton: false),
        //     const SizedBox(height: TSizes.spaceBtwItems / 2),
        //     Wrap(
        //       spacing: 8,
        //       children: [
        //         TChoiceChip(
        //             text: "EU 34", selected: true, onSelected: (value) {}),
        //         TChoiceChip(
        //             text: "EU 36", selected: false, onSelected: (value) {}),
        //         TChoiceChip(
        //             text: "EU 38", selected: false, onSelected: (value) {}),
        //       ],
        //     ),
        //   ],
        // ),
      ],
    );
  }
}
