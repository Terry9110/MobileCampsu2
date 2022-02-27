// import 'dart:html';

// import 'package:flutter/services.dart';
// import 'package:stripe_payment/stripe_payment.dart';

// class PaymentService {
//     static String apiURL = 'https://api.stripe.com/v1';
//     static String paymentApiUrl = '${PaymentService.apiURL}/payment_intents';
//     static String secret =   'YOUR STRIPE SECRET'; //your secret from stripe dashboard
//     static Map<String, String> headers = {
//         'Authorization': 'Bearer ${PaymentService.secret}',
//         'Content-Type': 'application/x-www-form-urlencoded'
//     };
//     static init() {
//         StripePayment.setOptions(
//             StripeOptions(
//                 publishableKey:"YOUR PUBLISHABLE KEY", // user your api key
//                 merchantId: "Test",
//                 androidPayMode: 'test'
//             )
//         );
//     }
//     static Future<PaymentResponse> choseExistingCard(
//     {required String amount, required String currency, required CreditCard card}) async {
//     try {
//         var stripePaymentMethod = await StripePayment.createPaymentMethod(PaymentMethodRequest(card: card));
//         var stripePaymentIntent = await StripeService.createPaymentIntent(amount, currency);
//         var response = await StripePayment.confirmPaymentIntent(
//             PaymentIntent(
//                 clientSecret: stripePaymentIntent['client_secret'],
//                 paymentMethodId: stripePaymentMethod.id
//             )
//         );

//         if (response.status == 'succeeded') {
//             //if the payment process success
//             return new StripeTransactionResponse(
//                 message: 'Transaction successful',
//                 success: true
//             );
//         }else {
//             //payment process fail
//             return new StripeTransactionResponse(
//                 message: 'Transaction failed', 
//                 success: false
//             );
//        }
//     } on PlatformException catch (error) {
//         return StripeService.getPlatformExceptionErrorResult(err);
//     } catch (error) {
//         return new StripeTransactionResponse(
//              //convert the error to string and assign to message variable for json resposne
//             message: 'Transaction failed: ${error.toString()}',
//             success: false
//         );
//     }
// }

// class PaymentResponse {
//     String message; // message from the response
//     bool success; //state of the processs

//     //class constructor
//     PaymentResponse({required this.message, required this.success});
// }



