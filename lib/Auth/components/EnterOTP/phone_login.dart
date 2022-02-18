import 'package:campus2/Auth/components/EnterOTP/model/verification.dart';
import 'package:campus2/Auth/components/EnterOTP/phone_auth.dart';
import 'package:campus2/Auth/components/auth_text_input.dart';
import 'package:campus2/EventsList/events_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class PhoneSignUpScreen extends StatelessWidget {
  // const PhoneSignUpScreen({Key? key}) : super(key: key);

  TextEditingController phoneNumber = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  bool otpVisibility = false;

  String verificationID = "";

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
            Container(
              child: TextField(
                controller: phoneController,
                decoration: InputDecoration(
                    hintStyle: GoogleFonts.poppins(color: Colors.grey[400]),
                    hintText: '+17538431234',
                    contentPadding: const EdgeInsets.only(
                        left: 20, top: 15, bottom: 15, right: 5),
                    label: Text('Phone Number',
                        style: GoogleFonts.poppins(
                            color: Colors.grey[500], fontSize: 12)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:
                          const BorderSide(width: 1, color: Colors.grey),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                            width: 1, color: Color(0xFFe63900))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                            width: 1, color: Color(0xFFe63900)))),
                maxLength: 14,
                keyboardType: TextInputType.phone,
              ),
            ),
            Visibility(
              child: TextField(
                controller: otpController,
                decoration: InputDecoration(
                  hintText: 'OTP',
                  prefix: Padding(
                    padding: EdgeInsets.all(4),
                    child: Text(''),
                  ),
                ),
                maxLength: 6,
                keyboardType: TextInputType.number,
              ),
              visible: otpVisibility,
            ),
            // AuthTextInput(
            //   inputType: TextInputType.emailAddress,
            //   label: "phone number",
            //   hintText: "+19788494391",
            //   // value: provider.email,
            //   onChanged: (txt) {
            //     // provider.setEmail(txt);
            //   },
            // ),
            SizedBox(height: 15),
            InkWell(
              onTap: () {
                loginWithPhone(context);
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
                            fontSize: 14)),
                  )),
            ),

            // InkWell(
            //   onTap: () {
            //     loginWithPhone(context);

            //     // Navigator.of(context)
            //     //     .push(MaterialPageRoute(builder: (context) => EnterOTP()));
            //   },
            //   child: Text(
            //     otpVisibility ? "Verify" : "Login",
            //     style: TextStyle(
            //       color: Colors.white,
            //       fontSize: 20,
            //     ),
            //   ),

            //   // child: Container(
            //   //     height: 50,
            //   //     width: width,
            //   //     decoration: BoxDecoration(
            //   //         borderRadius: BorderRadius.circular(15),
            //   //         gradient: LinearGradient(colors: [
            //   //           const Color(0xFF006633),
            //   //           const Color(0xFF006633).withOpacity(0.8),
            //   //         ])),
            //   //     child: Center(
            //   //         child: Text('Get OTP',
            //   //             style: GoogleFonts.poppins(
            //   //                 fontWeight: FontWeight.w600,
            //   //                 color: Colors.white,
            //   //                 fontSize: 14)))),
            // ),
            // ElevatedButton(
            //     onPressed: () {
            //       loginWithPhone(context);
            //     },
            //     child: Center(
            //         child: Text('Get OTP 2.0',
            //             style: GoogleFonts.poppins(
            //                 fontWeight: FontWeight.w600,
            //                 color: Colors.white,
            //                 fontSize: 14))))
          ],
        ),
      ),
    );
  }

  void loginWithPhone(context) async {
    auth.verifyPhoneNumber(
      phoneNumber: phoneController.text,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential).then((value) {
          print("You are logged in successfully");
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
      },
      codeSent: (String verificationId, int? resendToken) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OTPScreen(phoneNumber.text),
          ),
        );

        // otpVisibility = true;
        // verificationID = verificationId;

        // setState(() {});
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
}
