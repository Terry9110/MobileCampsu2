import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

int defaultValue = 0;
bool isValid = false;

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 35,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        // This makes app bar Transparent //
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              ToggleSwitch(
                minWidth: 180.0,
                minHeight: 60.0,
                cornerRadius: 20,
                fontSize: 16.0,
                initialLabelIndex: defaultValue,
                activeBgColor: [Colors.green],
                activeFgColor: Colors.white,
                inactiveBgColor: Colors.grey,
                inactiveFgColor: Colors.grey[900],
                totalSwitches: 2,
                labels: const [
                  'Email Address',
                  'Phone Number',
                ],
                radiusStyle: true,
                onToggle: (newValue) {
                  setState(() {
                    defaultValue = newValue!;
                    isValid = false;
                  });
                },
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                child: Builder(builder: (context) {
                  if (defaultValue == 0) {
                    return Container(
                      child: Text('This is email'),
                    );
                  } else {
                    return Container(
                      child: Text('This is email phonen number'),
                    );
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
