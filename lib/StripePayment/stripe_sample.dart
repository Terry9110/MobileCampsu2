import 'package:flutter/material.dart';

class StripeSample extends StatefulWidget {
  const StripeSample({Key? key}) : super(key: key);

  @override
  _StripeSampleState createState() => _StripeSampleState();
}

class _StripeSampleState extends State<StripeSample> {
  //PaymentMethod? paymentMethod;
  @override
  void initState() {
    super.initState();
    //PaymentService.init();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stripe Simple Tutorial'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            '10\$',
            style: TextStyle(fontSize: 50),
          ),
          const SizedBox(
            height: 25,
          ),
          Center(
            child: ElevatedButton(
              child: const Text(
                'Add a Payment Method',
              ),
              onPressed: () async {
                // paymentMethod = await PaymentService().createPaymentMethod();
                //print(paymentMethod!.id);
              },
            ),
          ),
          Center(
            child: ElevatedButton(
              child: const Text(
                'Complete Payment Now',
              ),
              onPressed: () async {
                // print(paymentMethod!.id);
                // PaymentService().processPayment(paymentMethod!.id);
              },
            ),
          ),
        ],
      ),
    );
  }
}
