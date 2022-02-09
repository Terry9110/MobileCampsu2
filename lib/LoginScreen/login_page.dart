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
        label:  Text('Email',
        style: GoogleFonts.poppins(color: Colors.grey[500], fontSize: 12),
        ),
      ),
    );

    //password field
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordController,
      //  validator: (value) {

      //  },

      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
    );
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Form(
              key: _formKey,
              child: Column(
                children: [emailField, passwordField],
              ),
            ),
          ),
        ),
      ),
    );

//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;
//     return Scaffold(
//       body: Container(
//         height: height,
//         width: width,
//         padding: const EdgeInsets.all(20),
//         color: Colors.white,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(height: 40),
//             Text("Welcome,",
//                 style: GoogleFonts.poppins(
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 24)),
//             const SizedBox(height: 0),
//             Text("Sign in to continue!",
//                 style:
//                     GoogleFonts.poppins(color: Colors.grey[500], fontSize: 18)),
//             const SizedBox(height: 60),
//             AuthTextInput(
//               inputType: TextInputType.emailAddress,
//               label: "Email",
//               hintText: "johndoe@gmail.com",
//               // value: provider.email,
//               onChanged: (txt) {
//                 // provider.setEmail(txt);
//               },
//             ),
//             const SizedBox(height: 20),
//             AuthTextInput(
//                 inputType: TextInputType.text,
//                 label: "Password",
//                 hintText: "*******",
//                 // value: provider.password,
//                 onChanged: (txt) {
//                   // provider.setPassword(txt);
//                 },
//                 passwordInput: true),
//             const SizedBox(height: 15),
//             Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Text("Forgot Password ? ",
//                       style: GoogleFonts.poppins(
//                           color: Colors.black,
//                           fontWeight: FontWeight.w600,
//                           fontSize: 12))
//                 ]),
//             const SizedBox(height: 30),
//             // Visibility(
//             //     // visible: provider.isLoading,
//             //     child: Row(
//             //       mainAxisAlignment: MainAxisAlignment.center,
//             //       crossAxisAlignment: CrossAxisAlignment.center,
//             //       children: const [
//             //         CircularProgressIndicator(),
//             //       ],
//             //     )),
//             //  Visibility(
//             // visible: provider.errMessage != null,
//             // child: Row(
//             //   mainAxisAlignment: MainAxisAlignment.start,
//             //   crossAxisAlignment: CrossAxisAlignment.start,
//             //   children: [
//             //     Text(provider.errMessage ?? "",
//             //         style: GoogleFonts.poppins(
//             //             color: Colors.red, fontSize: 14)),
//             //   ],
//             // )),
//             //      Visibility(
//             // visible:
//             //     ((provider.isLoading) || (provider.errMessage != null)),
//             // child: const SizedBox(height: 10)),
//             Visibility(
//                 // visible: (!provider.isLoading),
//                 child: InkWell(
//                     onTap: () {
//                       // provider.login();
//                     },
//                     child: const ActionButton(
//                       buttonName: "Login",
//                     ))),
//             const SizedBox(height: 15),
//             const FaceBookSigninButton(buttonName: "Connect with Facebook"),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text("I'm a new user",
//                     style: GoogleFonts.poppins(
//                         color: Colors.black,
//                         fontSize: 12,
//                         fontWeight: FontWeight.w600)),
//                 const SizedBox(width: 5),
//                 InkWell(
//                     onTap: () {
//                       Navigator.of(context).push(MaterialPageRoute(
//                           builder: (context) => SignUpMethod()));
//                     },
//                     child: Text("SignUp",
//                         style: GoogleFonts.poppins(
//                             color: const Color(0xFF006633),
//                             fontWeight: FontWeight.w600)))
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
  }
}
