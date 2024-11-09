// import 'package:flutter/material.dart';
// import 'package:fruitmarket/common/widgets/appbar/appbar.dart';
// import 'package:fruitmarket/common/widgets/custom_shapes/containers/rounded_container.dart';
// import 'package:fruitmarket/common/widgets/products/cart/coupon_widget.dart';
// import 'package:fruitmarket/common/widgets/success_screen/success_screen.dart';
// import 'package:fruitmarket/data/models/payment_intent_input_model.dart';
// import 'package:fruitmarket/data/repositories/authentication/authentication_repository.dart';
// import 'package:fruitmarket/features/shop/controllers/cart_controller.dart';
// import 'package:fruitmarket/features/shop/controllers/payment_controller.dart';
// import 'package:fruitmarket/features/shop/screens/cart/widgets/cart_items.dart';
// import 'package:fruitmarket/features/shop/screens/checkout/widgets/billing_address_section.dart';
// import 'package:fruitmarket/features/shop/screens/checkout/widgets/billing_amount_section.dart';
// import 'package:fruitmarket/features/shop/screens/checkout/widgets/billing_payment_section.dart';
// import 'package:fruitmarket/navigation_menu.dart';
// import 'package:fruitmarket/utils/constants/colors.dart';
// import 'package:fruitmarket/utils/constants/image_strings.dart';
// import 'package:fruitmarket/utils/constants/sizes.dart';
// import 'package:fruitmarket/utils/helpers/helper_functions.dart';
// import 'package:get/get.dart';

// class CheckoutScreen extends StatelessWidget {
//   const CheckoutScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final dark = THelperFunction.isDarkMode(context);
//     final cartController = Get.find<CartController>();
//     final paymentController = Get.find<PaymentController>();

//     // Create PaymentIntentInputModel for payment
//     PaymentIntentInputModel paymentIntentInputModel = PaymentIntentInputModel(
//       amount: cartController.getTotalPrice().toString(),
//       currency: 'usd',
//       customerId:
//           'cus_R4eRrcbD6vYWRV', // Placeholder for customer ID, dynamically set
//     );

//     return Scaffold(
//       appBar: TAppBar(
//         showBackArrow: true,
//         title:
//             Text("Checkout", style: Theme.of(context).textTheme.headlineSmall),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(TSizes.defaultSpace),
//           child: Column(
//             children: [
//               // Items in Cart
//               const TCartItems(showAddRemoveButtons: false),
//               const SizedBox(height: TSizes.spaceBtwSections),

//               // Coupon TextField
//               const TCouponCode(),
//               const SizedBox(height: TSizes.spaceBtwSections),

//               // Billing Section
//               TRoundedContainer(
//                 shadowBorder: true,
//                 padding: const EdgeInsets.all(TSizes.md),
//                 backgroundColor: dark ? TColors.black : TColors.white,
//                 child: const Column(
//                   children: [
//                     // Pricing
//                     TBillingAmountSection(),
//                     SizedBox(height: TSizes.spaceBtwItems),

//                     // Divider
//                     Divider(),
//                     SizedBox(height: TSizes.spaceBtwItems),

//                     // PaymentMethods
//                     TBillingPaymentSection(),
//                     SizedBox(height: TSizes.spaceBtwItems),

//                     // Address
//                     TBillingAddressSection(),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.all(TSizes.defaultSpace),
//         child: ElevatedButton(
//           onPressed: () async {
//             // Retrieve email from authenticated user
//             String? userEmail =
//                 AuthenticationRepository.instance.authUser?.email;
//             if (userEmail == null) {
//               Get.snackbar("Error", "User email is not available.");
//               return;
//             }

//             // Create the payment model
//             paymentIntentInputModel.customerId =
//                 'cus_123456789'; // Dynamically set the customer ID
//             paymentIntentInputModel.amount =
//                 cartController.getTotalPrice().toString();

//             // Trigger payment processing and get the result
//             bool paymentSuccessful = await paymentController.makePayment(
//               paymentIntentInputModel: paymentIntentInputModel,
//               email: userEmail, // Pass email to the payment process
//             );

//             // Handle payment result
//             if (paymentSuccessful) {
//               Get.to(() => SuccessScreen(
//                     image: TImages.paymentSuccess,
//                     onPressed: () => Get.offAll(() => const NavigationMenu()),
//                     title: "Payment Success!",
//                     subTitle: "Your item will be shipped soon!",
//                   ));
//             } else {
//               // Display error message if payment fails
//               Get.snackbar(
//                   "Payment Failed", paymentController.errorMessage.value);
//               print(
//                   "-----------------------${paymentController.errorMessage.value}");
//             }
//           },
//           child: Obx(() {
//             // Show loading indicator if payment is in progress
//             if (paymentController.isLoading.value) {
//               return const CircularProgressIndicator();
//             }
//             return Text("Checkout \$${cartController.getTotalPrice()}");
//           }),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:fruitmarket/common/widgets/appbar/appbar.dart';
import 'package:fruitmarket/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:fruitmarket/common/widgets/products/cart/coupon_widget.dart';
import 'package:fruitmarket/common/widgets/success_screen/success_screen.dart';
import 'package:fruitmarket/data/models/payment_intent_input_model.dart';
import 'package:fruitmarket/data/repositories/authentication/authentication_repository.dart';
import 'package:fruitmarket/features/shop/controllers/cart_controller.dart';
import 'package:fruitmarket/features/shop/controllers/payment_controller.dart';
import 'package:fruitmarket/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:fruitmarket/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:fruitmarket/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:fruitmarket/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:fruitmarket/navigation_menu.dart';
import 'package:fruitmarket/utils/constants/colors.dart';
import 'package:fruitmarket/utils/constants/image_strings.dart';
import 'package:fruitmarket/utils/constants/sizes.dart';
import 'package:fruitmarket/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    final cartController = Get.find<CartController>();
    final paymentController = Get.find<PaymentController>();
    final orderTotal = cartController.getTotalPrice() + 6 + 10;

    // Create PaymentIntentInputModel for payment
    PaymentIntentInputModel paymentIntentInputModel = PaymentIntentInputModel(
      amount: cartController.getTotalPrice().toInt(),
      currency: 'usd',
      customerId:
          'cus_R4eRrcbD6vYWRV', // Placeholder for customer ID, dynamically set
    );

    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title:
            Text("Checkout", style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const TCartItems(showAddRemoveButtons: false),
              const SizedBox(height: TSizes.spaceBtwSections),
              const TCouponCode(),
              const SizedBox(height: TSizes.spaceBtwSections),
              TRoundedContainer(
                shadowBorder: true,
                padding: const EdgeInsets.all(TSizes.md),
                backgroundColor: dark ? TColors.black : TColors.white,
                child: const Column(
                  children: [
                    TBillingAmountSection(),
                    SizedBox(height: TSizes.spaceBtwItems),
                    Divider(),
                    SizedBox(height: TSizes.spaceBtwItems),
                    TBillingPaymentSection(),
                    SizedBox(height: TSizes.spaceBtwItems),
                    TBillingAddressSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () async {
            String? userEmail =
                AuthenticationRepository.instance.authUser?.email;
            if (userEmail == null) {
              Get.snackbar("Error", "User email is not available.");
              return;
            }

            // Trigger payment processing and get the result
            bool paymentSuccessful = await paymentController.makePayment(
              paymentIntentInputModel: paymentIntentInputModel,
              email: userEmail,
            );

            if (paymentSuccessful) {
              Get.to(() => SuccessScreen(
                    image: TImages.paymentSuccess,
                    onPressed: () => Get.offAll(() => const NavigationMenu()),
                    title: "Payment Success!",
                    subTitle: "Your item will be shipped soon!",
                  ));
            } else {
              Get.snackbar(
                  "Payment Failed", paymentController.errorMessage.value);
              print(
                  '-------------------------${paymentController.errorMessage.value}');
            }
          },
          child: Obx(() {
            if (paymentController.isLoading.value) {
              return const CircularProgressIndicator();
            }
            return Text("Checkout \$$orderTotal");
          }),
        ),
      ),
    );
  }
}
