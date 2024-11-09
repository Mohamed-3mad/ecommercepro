import 'package:flutter/material.dart';
import 'package:fruitmarket/common/widgets/texts/section_heading.dart';
import 'package:fruitmarket/utils/constants/sizes.dart';

class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(
            title: "Shipping Address", buttonTitle: 'Change', onPressed: () {}),
        Text("Mohamed Emad", style: Theme.of(context).textTheme.bodyLarge),
        Row(
          children: [
            const Icon(Icons.phone, color: Colors.grey, size: 16),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text("(+20) 114 3868 599",
                style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),
        Row(
          children: [
            const Icon(Icons.location_history, color: Colors.grey, size: 16),
            const SizedBox(width: TSizes.spaceBtwItems),
            Expanded(
              child: Text("Korba, Cairo, Egypt",
                  style: Theme.of(context).textTheme.bodyMedium,
                  softWrap: true),
            ),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),
      ],
    );
  }
}
