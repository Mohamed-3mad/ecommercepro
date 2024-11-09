// import 'package:fruitmarket/data/models/ephemeral_key_model/ephemeral_key_model.dart';
// import 'package:fruitmarket/data/models/payment_intent_input_model.dart';
// import 'package:fruitmarket/data/models/payment_intent_model/payment_intent_model.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class PaymentRepository {
//   final String stripeSecretKey;

//   PaymentRepository(this.stripeSecretKey);

//   // Create Stripe Customer
//   Future<String?> createStripeCustomer(String email) async {
//     final url = Uri.parse('https://api.stripe.com/v1/customers');

//     try {
//       final response = await http.post(
//         url,
//         headers: {
//           'Authorization': 'Bearer $stripeSecretKey',
//           'Content-Type': 'application/x-www-form-urlencoded',
//         },
//         body: {'email': email},  // Add more customer details as necessary
//       );

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         return data['id'];  // Return the customer ID
//       } else {
//         throw Exception('Failed to create Stripe customer');
//       }
//     } catch (e) {
//       rethrow;
//     }
//   }

//   // Create Payment Intent
//   Future<PaymentIntentModel?> createPaymentIntent(PaymentIntentInputModel inputModel) async {
//     final url = Uri.parse('https://api.stripe.com/v1/payment_intents');

//     try {
//       final response = await http.post(
//         url,
//         headers: {
//           'Authorization': 'Bearer $stripeSecretKey',
//           'Content-Type': 'application/x-www-form-urlencoded',
//         },
//         body: inputModel.toJson(),
//       );

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         return PaymentIntentModel.fromJson(data);
//       } else {
//         throw Exception('Failed to create payment intent');
//       }
//     } catch (e) {
//       rethrow;
//     }
//   }

//   // Create Ephemeral Key
//   Future<EphemeralKeyModel?> createEphemeralKey(String customerId) async {
//     final url = Uri.parse('https://api.stripe.com/v1/ephemeral_keys');

//     try {
//       final response = await http.post(
//         url,
//         headers: {
//           'Authorization': 'Bearer $stripeSecretKey',
//           'Stripe-Version': '2020-08-27',
//           'Content-Type': 'application/x-www-form-urlencoded',
//         },
//         body: {'customer': customerId},
//       );

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         return EphemeralKeyModel.fromJson(data);
//       } else {
//         throw Exception('Failed to create ephemeral key');
//       }
//     } catch (e) {
//       rethrow;
//     }
//   }
// }

import 'package:fruitmarket/data/models/ephemeral_key_model/ephemeral_key_model.dart';
import 'package:fruitmarket/data/models/payment_intent_input_model.dart';
import 'package:fruitmarket/data/models/payment_intent_model/payment_intent_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PaymentRepository {
  final String stripeSecretKey;

  PaymentRepository(this.stripeSecretKey);

  // Create Stripe Customer
  Future<String?> createStripeCustomer(String email) async {
    final url = Uri.parse('https://api.stripe.com/v1/customers');

    try {
      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $stripeSecretKey',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {'email': email}, // Add more customer details as necessary
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['id']; // Return the customer ID
      } else {
        throw Exception('Failed to create Stripe customer: ${response.body}');
      }
    } catch (e) {
      throw Exception('Exception while creating Stripe customer: $e');
    }
  }

  // Create Payment Intent
  Future<PaymentIntentModel?> createPaymentIntent(
      PaymentIntentInputModel inputModel) async {
    final url = Uri.parse('https://api.stripe.com/v1/payment_intents');

    try {
      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $stripeSecretKey',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: inputModel
            .toJson(), // Ensure this returns the correct form for the API
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return PaymentIntentModel.fromJson(
            data); // Parse response into PaymentIntentModel
      } else {
        throw Exception('Failed to create payment intent: ${response.body}');
      }
    } catch (e) {
      throw Exception('Exception while creating Payment Intent: $e');
    }
  }

  // Create Ephemeral Key
  Future<EphemeralKeyModel?> createEphemeralKey(String customerId) async {
    final url = Uri.parse('https://api.stripe.com/v1/ephemeral_keys');

    try {
      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $stripeSecretKey',
          'Stripe-Version': '2020-08-27',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {
          'customer': customerId
        }, // Pass the customer ID to generate ephemeral key
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return EphemeralKeyModel.fromJson(
            data); // Parse response into EphemeralKeyModel
      } else {
        throw Exception('Failed to create ephemeral key: ${response.body}');
      }
    } catch (e) {
      throw Exception('Exception while creating Ephemeral Key: $e');
    }
  }
}
