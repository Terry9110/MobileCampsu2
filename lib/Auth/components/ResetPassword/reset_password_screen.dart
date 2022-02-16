import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RestPassword extends StatefulWidget {
  const RestPassword({Key? key}) : super(key: key);

  @override
  _RestPasswordState createState() => _RestPasswordState();
}

class _RestPasswordState extends State<RestPassword> {
  final TextEditingController emailController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Color(0xFF006633),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )),
        body: Center(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 70,
                  ),
                  Text("Welcome,",
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 24)),
                  Text("Type In Email To Reset Password!",
                      style: GoogleFonts.poppins(
                          color: Colors.grey[500], fontSize: 18)),
                  const SizedBox(height: 60),
                  TextFormField(
                    autofocus: false,
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ('Please Enter Your Email');
                      }
                      //reg expression for email validation
                      if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                          .hasMatch(value)) {
                        return ("Please Enter a valid email");
                      }
                      return null;
                    },
                    onSaved: (value) {
                      emailController.text = value!;
                    },
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.mail),
                        // contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                        hintText: "Email",
                        hintStyle: GoogleFonts.poppins(color: Colors.grey[400]),
                        contentPadding: const EdgeInsets.only(
                            left: 20, top: 15, bottom: 15, right: 5),
                        label: Text(
                          'Email',
                          style: GoogleFonts.poppins(
                              color: Colors.grey[500], fontSize: 12),
                        ),
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
                  ),
                  const SizedBox(height: 20),
                  Material(
                    elevation: 5,
                    color: Color(0xFF006633),
                    borderRadius: BorderRadius.circular(15),
                    child: MaterialButton(
                      height: 50,
                      minWidth: MediaQuery.of(context).size.width,
                      onPressed: () {
                        FirebaseAuth.instance
                            .sendPasswordResetEmail(email: emailController.text)
                            .then((value) => Navigator.of(context).pop());
                      },
                      child: Text('Reset Password',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 14)),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
