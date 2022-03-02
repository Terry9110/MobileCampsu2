// import 'dart:convert';
// import 'dart:io';

// import 'package:flutter/material.dart';
// // import 'package:flutter_stripe_payment/flutter_stripe_payment.dart';
// import 'package:stripe_payment/stripe_payment.dart';

// class StirepPayment1 extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<StirepPayment1> {
//   Token? _paymentToken;
//   PaymentMethod? _paymentMethod;
//   String? _error;

//   //this client secret is typically created by a backend system
//   //check https://stripe.com/docs/payments/payment-intents#passing-to-client
//   final String? _paymentIntentClientSecret = null;

//   PaymentIntentResult? _paymentIntent;
//   Source? _source;

//   ScrollController _controller = ScrollController();

//   final CreditCard testCard = CreditCard(
//     number: '4000002760003184',
//     expMonth: 12,
//     expYear: 21,
//     name: 'Test User',
//     cvc: '133',
//     addressLine1: 'Address 1',
//     addressLine2: 'Address 2',
//     addressCity: 'City',
//     addressState: 'CA',
//     addressZip: '1337',
//   );

//   GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

//   @override
//   initState() {
//     super.initState();

//     StripePayment.setOptions(StripeOptions(
//         publishableKey: "pk_test_Ayd3jhtH1k1IrLqcGHoKDzJu",
//         merchantId: "Test",
//         androidPayMode: 'test'));
//   }

//   void setError(dynamic error) {
//     _scaffoldKey.currentState!
//         .showSnackBar(SnackBar(content: Text(error.toString())));
//     setState(() {
//       _error = error.toString();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       home: new Scaffold(
//         key: _scaffoldKey,
//         appBar: new AppBar(
//           title: new Text('Plugin example app'),
//           actions: <Widget>[
//             IconButton(
//               icon: Icon(Icons.clear),
//               onPressed: () {
//                 setState(() {
//                   _source = null;
//                   _paymentIntent = null;
//                   _paymentMethod = null;
//                   _paymentToken = null;
//                 });
//               },
//             )
//           ],
//         ),
//         body: ListView(
//           controller: _controller,
//           padding: const EdgeInsets.all(20),
//           children: <Widget>[
//             RaisedButton(
//               child: Text("Create Token with Card Form"),
//               onPressed: () {
//                 StripePayment.paymentRequestWithCardForm(
//                         CardFormPaymentRequest())
//                     .then((paymentMethod) {
//                   _scaffoldKey.currentState!.showSnackBar(
//                       SnackBar(content: Text('Received ${paymentMethod.id}')));
//                   setState(() {
//                     _paymentMethod = paymentMethod;
//                   });
//                 }).catchError(setError);
//               },
//             ),
//             RaisedButton(
//               child: Text("Create Payment Method with Card"),
//               onPressed: () {
//                 StripePayment.createPaymentMethod(
//                   PaymentMethodRequest(
//                     card: testCard,
//                   ),
//                 ).then((paymentMethod) {
//                   _scaffoldKey.currentState!.showSnackBar(
//                       SnackBar(content: Text('Received ${paymentMethod.id}')));
//                   setState(() {
//                     _paymentMethod = paymentMethod;
//                   });
//                 }).catchError(setError);
//               },
//             ),
//             RaisedButton(
//               child: Text("Create Payment Method with existing token"),
//               onPressed: _paymentToken == null
//                   ? null
//                   : () {
//                       StripePayment.createPaymentMethod(
//                         PaymentMethodRequest(
//                           card: CreditCard(
//                             token: _paymentToken!.tokenId,
//                           ),
//                         ),
//                       ).then((paymentMethod) {
//                         _scaffoldKey.currentState!.showSnackBar(SnackBar(
//                             content: Text('Received ${paymentMethod.id}')));
//                         setState(() {
//                           _paymentMethod = paymentMethod;
//                         });
//                       }).catchError(setError);
//                     },
//             ),
//             Divider(),
//             RaisedButton(
//               child: Text("Confirm Payment Intent"),
//               onPressed:
//                   _paymentMethod == null || _paymentIntentClientSecret == null
//                       ? null
//                       : () {
//                           StripePayment.confirmPaymentIntent(
//                             PaymentIntent(
//                               clientSecret: _paymentIntentClientSecret,
//                               paymentMethodId: _paymentMethod!.id,
//                             ),
//                           ).then((paymentIntent) {
//                             _scaffoldKey.currentState!.showSnackBar(SnackBar(
//                                 content: Text(
//                                     'Received ${paymentIntent.paymentIntentId}')));
//                             setState(() {
//                               _paymentIntent = paymentIntent;
//                             });
//                           }).catchError(setError);
//                         },
//             ),
//             RaisedButton(
//               child: Text(
//                 "Confirm Payment Intent with saving payment method",
//                 textAlign: TextAlign.center,
//               ),
//               onPressed:
//                   _paymentMethod == null || _paymentIntentClientSecret == null
//                       ? null
//                       : () {
//                           StripePayment.confirmPaymentIntent(
//                             PaymentIntent(
//                               clientSecret: _paymentIntentClientSecret,
//                               paymentMethodId: _paymentMethod!.id!,
//                               isSavingPaymentMethod: true,
//                             ),
//                           ).then((paymentIntent) {
//                             _scaffoldKey.currentState?.showSnackBar(SnackBar(
//                                 content: Text(
//                                     'Received ${paymentIntent.paymentIntentId}')));
//                             setState(() {
//                               _paymentIntent = paymentIntent;
//                             });
//                           }).catchError(setError);
//                         },
//             ),
//             RaisedButton(
//               child: Text("Authenticate Payment Intent"),
//               onPressed: _paymentIntentClientSecret == null
//                   ? null
//                   : () {
//                       StripePayment.authenticatePaymentIntent(
//                               clientSecret: _paymentIntentClientSecret!)
//                           .then((paymentIntent) {
//                         _scaffoldKey.currentState!.showSnackBar(SnackBar(
//                             content: Text(
//                                 'Received ${paymentIntent.paymentIntentId}')));
//                         setState(() {
//                           _paymentIntent = paymentIntent;
//                         });
//                       }).catchError(setError);
//                     },
//             ),
//             Divider(),
//             Text('Current source:'),
//             Text(
//               JsonEncoder.withIndent('  ').convert(_source?.toJson() ?? {}),
//               style: TextStyle(fontFamily: "Monospace"),
//             ),
//             Divider(),
//             Text('Current token:'),
//             Text(
//               JsonEncoder.withIndent('  ')
//                   .convert(_paymentToken?.toJson() ?? {}),
//               style: TextStyle(fontFamily: "Monospace"),
//             ),
//             Divider(),
//             Text('Current payment method:'),
//             Text(
//               JsonEncoder.withIndent('  ')
//                   .convert(_paymentMethod?.toJson() ?? {}),
//               style: TextStyle(fontFamily: "Monospace"),
//             ),
//             Divider(),
//             Text('Current payment intent:'),
//             Text(
//               JsonEncoder.withIndent('  ')
//                   .convert(_paymentIntent?.toJson() ?? {}),
//               style: TextStyle(fontFamily: "Monospace"),
//             ),
//             Divider(),
//             Text('Current error: $_error'),
//           ],
//         ),
//       ),
//     );
//   }
// }
