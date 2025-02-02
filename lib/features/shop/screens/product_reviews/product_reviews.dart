import 'package:flutter/material.dart';
import 'package:fruitmarket/common/widgets/appbar/appbar.dart';
import 'package:fruitmarket/common/widgets/products/ratings/rating_indicator.dart';
import 'package:fruitmarket/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:fruitmarket/features/shop/screens/product_reviews/widgets/user_reviews_card.dart';
import 'package:fruitmarket/utils/constants/sizes.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          const TAppBar(title: Text("Reviews & Ratings"), showBackArrow: true),

      //Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  "Ratings and reviews are verified and are from people who use the same type of device that you use"),
              const SizedBox(height: TSizes.spaceBtwItems),

              //Overall Product Ratings
              const TOverallProductRating(),

              const TRatingBarIndicator(rating: 3.5),
              Text("11.411", style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: TSizes.spaceBtwSections),

              //User Reviews List
              const UserReviewsCard(),
            ],
          ),
        ),
      ),
    );
  }
}
