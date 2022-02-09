import 'package:campus2/Auth/components/EnterOTP/phone_auth.dart';
import 'package:campus2/Auth/components/EnterOTP/phone_login.dart';
import 'package:campus2/Auth/components/action_button.dart';
import 'package:campus2/LoginScreen/login_method.dart';
import 'package:campus2/LoginScreen/login_page.dart';
import 'package:campus2/SignupScreen/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpMethod extends StatelessWidget {
  // const SignUpMethod({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 40),
                      Text("Welcome,",
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 24)),
                      Text("Pick a Sign Up Method To Continue!",
                          style: GoogleFonts.poppins(
                              color: Colors.grey[500], fontSize: 18)),
                      const SizedBox(height: 60),
                      //START OF SIGN UP WITH EMAIL ADDRESS SECTION!!//
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SignupPage()));
                        },
                        child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              gradient: LinearGradient(colors: [
                                const Color(0xFF006633),
                                const Color(0xFF006633).withOpacity(0.8),
                              ]),
                            ),
                            child: Center(
                                child: Text('Sign Up With Email Address',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                        fontSize: 14)))),
                      ),
                      //END OF START WITH EMAIL ADDRESS SECTION!!//
                      const SizedBox(height: 40),
                      //START OF SIGN UP WITH PHONE NUMBER SECTION!!//
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => PhoneSignUpScreen()));
                        },
                        child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              gradient: LinearGradient(colors: [
                                const Color(0xFF006633),
                                const Color(0xFF006633).withOpacity(0.8),
                              ]),
                            ),
                            child: Center(
                                child: Text('Sign Up With Phone Number',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                        fontSize: 14)))),
                      ),
                      //END OF SIGN UP WITH PHONE NUMBER SECTION!!//
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already a Member?",
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600)),
                          const SizedBox(width: 5),
                          GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => LoginMehod()));
                              },
                              child: Text("Login",
                                  style: GoogleFonts.poppins(
                                      color: const Color(0xFF006633),
                                      fontWeight: FontWeight.w600)))
                        ],
                      ),
                    ],
                  ),
                )),
          ),
        ),
      ),
      //   body: Container(
      //   height: height,
      //   width: width,
      //   padding: const EdgeInsets.all(20),
      //   color: Colors.white,
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //         const SizedBox(height: 40),
      //           Text("Welcome,",
      //             style: GoogleFonts.poppins(
      //                 color: Colors.black,
      //                 fontWeight: FontWeight.bold,
      //                 fontSize: 24)),
      //                            Text("Pick a Sign Up Method to Continue !",
      //             style:
      //                 GoogleFonts.poppins(color: Colors.grey[500], fontSize: 18)),
      //                  const SizedBox(height: 30),
      //                 Container(
      //                        child: const ActionButton(
      //                   buttonName: "Login",
      //                 )),
      //                             const SizedBox(height: 130),

      //                 InkWell(
      //                   onTap: () {
      //                                   Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignupPage()));

      //                   },
      //                   child: Container(
      //                         height: 50,
      //                         width: width,
      //                         decoration: BoxDecoration(
      //                             borderRadius: BorderRadius.circular(15),
      //                             gradient: LinearGradient(colors: [
      //                               const Color(0xFF006633),
      //                               const Color(0xFF006633).withOpacity(0.8),
      //                             ])),
      //                         child: Center(
      //                             child: Text('Sign Up With Email Address',
      //                                 style: GoogleFonts.poppins(
      //                   fontWeight: FontWeight.w600,
      //                   color: Colors.white,
      //                   fontSize: 14)))),
      //                 ),
      //                    SizedBox(height: 15),
      //                    InkWell(
      //                      onTap: (){
      //                                                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => PhoneSignUpScreen()));

      //                      },
      //                      child: Container(
      //                            height: 50,
      //                            width: width,
      //                            decoration: BoxDecoration(
      //                                borderRadius: BorderRadius.circular(15),
      //                                gradient: LinearGradient(colors: [
      //                                  const Color(0xFF006633),
      //                                  const Color(0xFF006633).withOpacity(0.8),
      //                                ])),
      //                            child: Center(
      //                                child: Text('Sign Up With Phone Number',
      //                                    style: GoogleFonts.poppins(
      //                                        fontWeight: FontWeight.w600,
      //                                        color: Colors.white,
      //                                        fontSize: 14)))),
      //                    )

      //     ],

      //   ),

      //   ),

      // );
    );
  }
}
