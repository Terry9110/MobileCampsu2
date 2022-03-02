import 'dart:convert';
// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

class StripeButton extends StatefulWidget {
  const StripeButton({Key? key}) : super(key: key);

  @override
  _StripeButtonState createState() => _StripeButtonState();
}

class _StripeButtonState extends State<StripeButton> {
  Map<String, dynamic>? paymentIntentData;

  @override
  Widget build(BuildContext context) {
    Stripe.publishableKey = "pk_test_Ayd3jhtH1k1IrLqcGHoKDzJu";

    return Scaffold(
      appBar: AppBar(
        title: const Text('Stripe Payment'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: SizedBox(
            height: 60,
            width: double.infinity,
            child: Container(
              decoration: const BoxDecoration(
                  gradient:
                      LinearGradient(transform: GradientRotation(20), colors: [
                Color(0xFF439cfb),
                Color(0xFFf187fb),
              ])),
              child: TextButton(
                onPressed: () async {
                  await makePayment();

                  // final url = Uri.parse(
                  //     "https://us-central1-campsu-8f97d.cloudfunctions.net/stripePaymentTest");
                  // final response = await http.get(url);
                  // print(response.body);
                  // var jsonBody = jsonDecode(response.body);
                  // Map<String, dynamic>? paymentIntentData;
                  // paymentIntentData = jsonBody;
                  // if (paymentIntentData!["paymentIntent"] != "" &&
                  //     paymentIntentData["paymentIntent"] != null) {
                  //   String _intent = paymentIntentData["paymentIntent"];
                  //   await Stripe.instance.initPaymentSheet(
                  //     paymentSheetParameters: SetupPaymentSheetParameters(
                  //       paymentIntentClientSecret: _intent,
                  //       applePay: false,
                  //       googlePay: false,
                  //       merchantCountryCode: "IN",
                  //       merchantDisplayName: "Test",
                  //       testEnv: false,
                  //       customerId: paymentIntentData['customer'],
                  //       customerEphemeralKeySecret:
                  //           paymentIntentData['ephemeralKey'],
                  //     ),
                  //   );

                  //   await Stripe.instance.presentPaymentSheet();
                  // }
                },
                style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(16.0),
                    primary: Colors.white,
                    textStyle: const TextStyle(fontSize: 20)),
                child: const Text(
                  'Stripe',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> makePayment() async {
    try {
      paymentIntentData =
          await createPaymentIntent('10', 'USD'); //json.decode(response.body);
      print('this is payment intent data');
      print(paymentIntentData);
      // print('Response body==>${response.body.toString()}');
      await Stripe.instance
          .initPaymentSheet(
              paymentSheetParameters: SetupPaymentSheetParameters(
                  paymentIntentClientSecret:
                      paymentIntentData!['client_secret'],
                  applePay: true,
                  googlePay: true,
                  testEnv: true,
                  style: ThemeMode.dark,
                  merchantCountryCode: 'US',
                  merchantDisplayName: 'ANNIE'))
          .then((value) {});

      ///now finally display payment sheeet
      displayPaymentSheet();
    } catch (e, s) {
      print('exception:$e$s');
    }
  }

  displayPaymentSheet() async {
    try {
      await Stripe.instance
          .presentPaymentSheet(
              parameters: PresentPaymentSheetParameters(
        clientSecret: paymentIntentData!['client_secret'],
        confirmPayment: true,
      ))
          .then((newValue) {
        print('payment intent' + paymentIntentData!['id'].toString());
        print(
            'payment intent' + paymentIntentData!['client_secret'].toString());
        print('payment intent' + paymentIntentData!['amount'].toString());
        print('payment intent' + paymentIntentData.toString());
        //orderPlaceApi(paymentIntentData!['id'].toString());
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("paid successfully")));

        paymentIntentData = null;
      }).onError((error, stackTrace) {
        print('Exception/DISPLAYPAYMENTSHEET==> $error $stackTrace');
      });
    } on StripeException catch (e) {
      print('Exception/DISPLAYPAYMENTSHEET==> $e');
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                content: Text("Cancelled "),
              ));
    } catch (e) {
      print('$e');
    }
  }

  //  Future<Map<String, dynamic>>
  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount('20'),
        'currency': currency,
        'payment_method_types[]': 'card'
      };
      print(body);
      var response = await http.post(
          Uri.parse(
              'https://us-central1-campsu-8f97d.cloudfunctions.net/stripePayment'),
          body: body,
          headers: {
            'Authorization': 'Bearer your token',
            'Content-Type': 'application/x-www-form-urlencoded'
          });
      print('Create Intent reponse ===> ${response.body.toString()}');
      return jsonDecode(response.body);
    } catch (err) {
      print('err charging user: ${err.toString()}');
    }
  }

  calculateAmount(String amount) {
    final a = (int.parse(amount)) * 100;
    return a.toString();
  }
}
