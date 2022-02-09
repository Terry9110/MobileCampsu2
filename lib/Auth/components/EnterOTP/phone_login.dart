import 'package:campus2/Auth/components/EnterOTP/model/verification.dart';
import 'package:campus2/Auth/components/EnterOTP/phone_auth.dart';
import 'package:campus2/Auth/components/auth_text_input.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PhoneSignUpScreen extends StatelessWidget {
  // const PhoneSignUpScreen({Key? key}) : super(key: key);

  TextEditingController phoneNumber = TextEditingController();

  PhoneSignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.all(20),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back, color: Colors.black)),
                // Expanded(
                //     child: Center(
                //   child: Text("Verify Phone",
                //       style: GoogleFonts.poppins(
                //         color: Colors.black,
                //         fontSize: 14,
                //         fontWeight: FontWeight.w600,
                //       )),
                // )),
              ],
            ),
            const SizedBox(height: 40),
            Text("Phone Authentication,",
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24)),
            Text("Enter Your Phone Number To Continue!",
                style:
                    GoogleFonts.poppins(color: Colors.grey[500], fontSize: 18)),
            const SizedBox(height: 30),
            AuthTextInput(
              inputType: TextInputType.emailAddress,
              label: "phone number",
              hintText: "johndoe@gmail.com",
              // value: provider.email,
              onChanged: (txt) {
                // provider.setEmail(txt);
              },
            ),
            SizedBox(height: 15),
            InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => EnterOTP()));
              },
              child: Container(
                  height: 50,
                  width: width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(colors: [
                        const Color(0xFF006633),
                        const Color(0xFF006633).withOpacity(0.8),
                      ])),
                  child: Center(
                      child: Text('Get OTP',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 14)))),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OTPScreen(phoneNumber.text),
                    ),
                  );
                },
                child: Center(
                      child: Text('Get OTP 2.0',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 14)))
            )],
        ),
      ),
    );
  }
}
