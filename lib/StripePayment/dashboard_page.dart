import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  Map<String, dynamic>? paymentIntentData;

  @override
  Widget build(BuildContext context) {
    Stripe.publishableKey = "pk_test_Ayd3jhtH1k1IrLqcGHoKDzJu";
    Stripe.merchantIdentifier = 'any string works';
    Stripe.instance.applySettings();

    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text('Pay Amount'),
          onPressed: () {
            makePayment();
          },
        ),
      ),
    );
  }

  Future<void> makePayment() async {
    final url = Uri.parse(
        'https://us-central1-campsu-8f97d.cloudfunctions.net/stripePayment');

    final response =
        await http.get(url, headers: {'Content-Type': 'application/json'});

    paymentIntentData = json.decode(response.body);
    print('this is payment intent data');
    print(paymentIntentData?.entries);
    print('this is response.body');
    print(response.body);

    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
      paymentIntentClientSecret: paymentIntentData!['paymentIntent'],
      applePay: true,
      googlePay: true,
      style: ThemeMode.dark,
      merchantCountryCode: 'US',
      merchantDisplayName: 'Raja',
    ));

    setState(() {
      displayPaymentSheet();
    });
  }

  Future<void> displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet(
          parameters: PresentPaymentSheetParameters(
              clientSecret: paymentIntentData!['paymentIntent'],
              confirmPayment: true));
      setState(() {
        paymentIntentData = null;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Paid Successfully')));
    } catch (e) {
      print(e);
    }
    
  }
}
