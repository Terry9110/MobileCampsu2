import 'package:flutter/material.dart';

class StripeButton extends StatefulWidget {
  const StripeButton({Key? key}) : super(key: key);

  @override
  _StripeButtonState createState() => _StripeButtonState();
}

class _StripeButtonState extends State<StripeButton> {
  @override
  Widget build(BuildContext context) {
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
                onPressed: () {},
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
}
