import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

class StripeCheckout extends StatefulWidget {
  const StripeCheckout({Key? key}) : super(key: key);

  @override
  _StripeCheckoutState createState() => _StripeCheckoutState();
}

class _StripeCheckoutState extends State<StripeCheckout> {
  @override
  Widget build(BuildContext context) {
    Stripe.publishableKey = "pk_test_Ayd3jhtH1k1IrLqcGHoKDzJu";
    Stripe.instance.applySettings();
    Future<void> initPaymentSheet(context,
        {required String email, required int amount}) async {
      try {
        // 1. create payment intent on the server
        final response = await http.post(
            Uri.parse(
                'https://us-central1-campsu-8f97d.cloudfunctions.net/stripePaymentTest'),
            body: {
              'email': email,
              'amount': amount.toString(),
            });

        final jsonResponse = jsonDecode(response.body);
        log(jsonResponse.toString());

        //2. initialize the payment sheet
        await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
              paymentIntentClientSecret: jsonResponse['paymentIntent'],
              merchantDisplayName: 'Flutter Stripe Store Demo',
              customerId: jsonResponse['customer'],
              customerEphemeralKeySecret: jsonResponse['ephemeralKey'],
              style: ThemeMode.light,
              testEnv: true,
              merchantCountryCode: 'SG',
              currencyCode: 'USD'),
        );

        await Stripe.instance.presentPaymentSheet();

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Payment completed!')),
        );
      } catch (e) {
        if (e is StripeException) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error from Stripe: ${e.error.localizedMessage}'),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: $e')),
          );
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Stripe Demo App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () async {
                await initPaymentSheet(context,
                    email: "example@gmail.com", amount: 200000);
              },
              child: const Text(
                'Buy Laptop for 2000 USD',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
