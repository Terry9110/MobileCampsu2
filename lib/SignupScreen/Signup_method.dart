import 'package:campus2/Auth/components/EnterOTP/phone_auth.dart';
import 'package:campus2/Auth/components/EnterOTP/phone_login.dart';
import 'package:campus2/Auth/components/action_button.dart';
import 'package:campus2/SignupScreen/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpMethod extends StatelessWidget {
  const SignUpMethod({ Key? key }) : super(key: key);

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
              Text("Welcome,",
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24)),
                               Text("Pick a Sign Up Method to Continue !",
                style:
                    GoogleFonts.poppins(color: Colors.grey[500], fontSize: 18)),
                     const SizedBox(height: 30),
                    Container(
                           child: const ActionButton(
                      buttonName: "Login",
                    )),
                                const SizedBox(height: 130),

                    InkWell(
                      onTap: () {
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignupPage()));

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
                                child: Text('Sign Up With Email Address',
                                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 14)))),
                    ),
                       SizedBox(height: 15),
                       InkWell(
                         onTap: (){
                                                                 Navigator.of(context).push(MaterialPageRoute(builder: (context) => PhoneSignUpScreen()));

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
                                   child: Text('Sign Up With Phone Number',
                                       style: GoogleFonts.poppins(
                                           fontWeight: FontWeight.w600,
                                           color: Colors.white,
                                           fontSize: 14)))),
                       )
                    
        ],
        
      ),
      
      
      ),
      
      
    );
  }
}