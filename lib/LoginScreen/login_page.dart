import 'package:campus2/Auth/components/action_button.dart';
import 'package:campus2/Auth/components/auth_text_input.dart';
import 'package:campus2/Auth/components/facebook_signin_button.dart';
import 'package:campus2/SignupScreen/Signup_method.dart';
import 'package:campus2/SignupScreen/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  // const LoginPage({Key? key}) : super(key: key);

//form key
  final _formKey = GlobalKey<FormState>();

  //editing controller
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    //email field
    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      //  validator: (value) {

      //  },

      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.mail),
          // contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          hintStyle: GoogleFonts.poppins(color: Colors.grey[400]),
          contentPadding:
              const EdgeInsets.only(left: 20, top: 15, bottom: 15, right: 5),
          label: Text(
            'Email',
            style: GoogleFonts.poppins(color: Colors.grey[500], fontSize: 12),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(width: 1, color: Colors.grey),
          ),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(width: 1, color: Color(0xFFe63900))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide:
                  const BorderSide(width: 1, color: Color(0xFFe63900)))),
    );

    //password field
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordController,
      //allows you to hide password
      obscureText: true,
      //  validator: (value) {

      //  },

      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.vpn_key),
          // contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          hintStyle: GoogleFonts.poppins(color: Colors.grey[400]),
          contentPadding:
              const EdgeInsets.only(left: 20, top: 15, bottom: 15, right: 5),
          label: Text(
            'Password',
            style: GoogleFonts.poppins(color: Colors.grey[500], fontSize: 12),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(width: 1, color: Colors.grey),
          ),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(width: 1, color: Color(0xFFe63900))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide:
                  const BorderSide(width: 1, color: Color(0xFFe63900)))),
    );

    final loginButton = Material(
      elevation: 5,
      color: Color(0xFF006633),
      borderRadius: BorderRadius.circular(15),

      child: MaterialButton(
        height: 50,
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {},
        child: Text('Login',
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontSize: 14)),
      ),

      // child: Container(

      //   height: 50,
      //   width: MediaQuery.of(context).size.width,
      //   decoration: BoxDecoration(
      //       borderRadius: BorderRadius.circular(15),
      //       gradient: LinearGradient(colors: [
      //         const Color(0xFF006633),
      //         const Color(0xFF006633).withOpacity(0.8),
      //       ])),
      //   child: Center(
      //       child: Text('Login',
      //           style: GoogleFonts.poppins(
      //               fontWeight: FontWeight.w600,
      //               color: Colors.white,
      //               fontSize: 14))))
    );

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
                    Text("Sign in with email to continue!",
                        style: GoogleFonts.poppins(
                            color: Colors.grey[500], fontSize: 18)),
                    const SizedBox(height: 60),
                    emailField,
                    const SizedBox(height: 20),
                    passwordField,
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                            onTap: () {},
                            child: Text("Forgot Password ? ",
                                style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12)))
                      ],
                    ),
                    const SizedBox(height: 20),
                    loginButton,
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("I'm a new user",
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w600)),
                        const SizedBox(width: 5),
                        GestureDetector(
                            onTap: () {},
                            child: Text("SignUp",
                                style: GoogleFonts.poppins(
                                    color: const Color(0xFF006633),
                                    fontWeight: FontWeight.w600)))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );


  }
}
