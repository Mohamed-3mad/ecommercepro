import 'package:flutter/material.dart';
import 'package:fruitmarket/features/shop/models/products_model.dart';
import 'package:fruitmarket/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class TRatingAndShare extends StatelessWidget {
  const TRatingAndShare({
    super.key,
    required this.product,
  });
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //Rating
        Row(
          children: [
            const Icon(Iconsax.star5, color: Colors.amber, size: 24),
            const SizedBox(width: TSizes.spaceBtwItems / 2),
            Text.rich(
                maxLines: 2,
                TextSpan(
                  children: [
                    TextSpan(
                        text: product.rating?.rate.toString() ?? '0',
                        style: Theme.of(context).textTheme.bodyLarge),
                    TextSpan(
                        text: '(${product.rating?.count.toString() ?? '0'})'),
                  ],
                )),
          ],
        ),
        //Share Button
        IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share, size: TSizes.iconMd)),
      ],
    );
  }
}
