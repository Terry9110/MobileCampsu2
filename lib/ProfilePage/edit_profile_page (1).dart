// import 'package:campus2/ProfilePage/profile_page.dart';
// import 'package:campus2/SignupScreen/model/signupModel.dart';
// import 'package:campus2/SignupScreen/model/user_model.dart';
// import 'package:campus2/SignupSuccessful/success_screen.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:gender_picker/gender_picker.dart';
// import 'package:gender_picker/source/enums.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';

// class EditProfilePage extends StatefulWidget {
 
//   @override 
//   _EditProfilePageState createState() => _EditProfilePageState();
// }

// final _auth = FirebaseAuth.instance;

// // string for displaying the error Message
// String? errorMessage;

// //our form key
// final _formKey = GlobalKey<FormState>();

// //editing Controller
// TextEditingController fullNameEditingController = new TextEditingController();
//     TextEditingController emailEditingController = new TextEditingController();
//     TextEditingController userNameEditingController = new TextEditingController();
//     final passwordEditingController = new TextEditingController();
//     final dateOfBirthEditingController = new TextEditingController();
//     TextEditingController phoneNumberEditingController =
//         new TextEditingController();

// class _EditProfilePageState extends State<EditProfilePage> {
 
//   // final userProvider;
//   @override
//   void initState(){
    
//     //  final userProvider = Provider.of<UserModel>(context);
    
//     // userProvider.getUserData();
//     // if (userProvider.fullName != null) {
//     //     fullNameEditingController.value = TextEditingController.fromValue(new TextEditingValue(text:userProvider.fullName??"")).value;
//     //   // var userNamePos = userNameEditingController.selection;
//     //   userNameEditingController.text = userProvider.userName!;
//     //   //  if (userNamePos.start > userNameEditingController.text.length) {
//     //   //   userNamePos = new TextSelection.fromPosition(
//     //   //       new TextPosition(offset: userNameEditingController.text.length));
//     //   // }
//     //         // userNameEditingController.selection = userNamePos;

//     //   // fullNameEditingController.text = userProvider.fullName!;
//     //   phoneNumberEditingController.text = userProvider.phoneNumber!;
//     // }
   
//     // emailEditingController = TextEditingController();
//     super.initState();
//   }

//   @override
//   void didChangeDependencies() {
//      final userProvider = Provider.of<UserModel>(context);
//    userProvider.getUserData();
   
//   }

//   @override
//   void dispose() {
//   //  fullNameEditingController.dispose();
//   //  userNameEditingController.dispose();
//   //  phoneNumberEditingController.dispose();
//     // userProvider.
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
   
     
//     // fullNameEditingController.value =
//     //     TextEditingValue(text: userProvider.fullName ?? " ");
//     // emailEditingController.text = userProvider.email ?? " ";
//     // userNameEditingController.text = userProvider.userName ?? " ";
//     // phoneNumberEditingController.text = userProvider.phoneNumber ?? " ";

// //Email Address Field
//     final emailAddressField = TextField(
//       autofocus: false,
//       controller: emailEditingController,
//       keyboardType: TextInputType.emailAddress,
//       decoration: InputDecoration(
//           // prefixIcon: const Icon(Icons.mail),
//           // contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
//           hintText: "Email",
//           hintStyle: GoogleFonts.poppins(color: Colors.grey[400]),
//           contentPadding:
//               const EdgeInsets.only(left: 20, top: 15, bottom: 15, right: 5),
//           label: Text(
//             'Email',
//             style: GoogleFonts.poppins(color: Colors.grey[500], fontSize: 12),
//           ),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(15),
//             borderSide: const BorderSide(width: 1, color: Colors.grey),
//           ),
//           focusedErrorBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(15),
//               borderSide: const BorderSide(width: 1, color: Color(0xFFe63900))),
//           focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(15),
//               borderSide:
//                   const BorderSide(width: 1, color: Color(0xFFe63900)))),
//     ):
  

//     final signUpButton = Material(
//       elevation: 5,
//       color: const Color(0xFF006633),
//       borderRadius: BorderRadius.circular(15),
//       child: MaterialButton(
//         height: 50,
//         minWidth: MediaQuery.of(context).size.width,
//         onPressed: () {
//           signUp(context);
//         },
//         child: Text('Update Profile',
//             style: GoogleFonts.poppins(
//                 fontWeight: FontWeight.w600,
//                 color: Colors.white,
//                 fontSize: 14)),
//       ),
//     );
//     return Scaffold(
//       appBar: AppBar(
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//           leading: IconButton(
//             icon: const Icon(
//               Icons.arrow_back,
//               color: Color(0xFF006633),
//             ),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           )),
//       body: Center(
//         child: SingleChildScrollView(
//           child: Container(
//             color: Colors.white,
//             child: Padding(
//               padding: const EdgeInsets.all(36.0),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     const SizedBox(height: 40),
//                     Text("EDIT PROFILE,",
//                         style: GoogleFonts.poppins(
//                             color: Colors.black,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 24)),
//                     Text("This is where you can edit profile!",
//                         style: GoogleFonts.poppins(
//                             color: Colors.grey[500], fontSize: 18)),
//                     fullNameField,
//                     const SizedBox(height: 20),
//                     userNameField,
//                     const SizedBox(height: 20),
//                     // emailAddressField,
//                     // const SizedBox(height: 20),
//                     // passwordField,
//                     // const SizedBox(height: 20),
//                     phoneNumberField,
//                     genderPicker(context),
//                     const SizedBox(height: 20),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: const [
//                         // SizedBox(
//                         //     width: MediaQuery.of(context).size.width - 90,
//                         //     child: Text(
//                         //         "By proceeding you also agree to the Terms of Service and Privacy Policy",
//                         //         style:
//                         //             GoogleFonts.poppins(color: Colors.grey))),
//                       ],
//                     ),
//                     const SizedBox(height: 20),
//                     signUpButton,
//                     const SizedBox(height: 20),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// Widget genderPicker(BuildContext context) {
//   final provider = Provider.of<SignupModel>(context);
//   return Column(
//     mainAxisAlignment: MainAxisAlignment.start,
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Padding(
//           padding: const EdgeInsets.only(left: 10),
//           child: Text("Gender",
//               style: GoogleFonts.poppins(color: Colors.black, fontSize: 12))),
//       GenderPickerWithImage(
//         showOtherGender: true,
//         verticalAlignedText: true,
//         selectedGender: provider.gender == "others"
//             ? Gender.Others
//             : provider.gender == "male"
//                 ? Gender.Male
//                 : Gender.Female,
//         selectedGenderTextStyle: const TextStyle(
//             color: Color(0xFF8b32a8), fontWeight: FontWeight.bold),
//         unSelectedGenderTextStyle:
//             const TextStyle(color: Colors.white, fontWeight: FontWeight.normal),
//         onChanged: (Gender? gender) {
//           if (gender == null) {
//             return;
//           }
//           print(gender.name);
//           provider.setValues("gender", gender.name.toLowerCase());
//         },
//         equallyAligned: true,
//         animationDuration: const Duration(milliseconds: 300),
//         isCircular: true,
//         // default : true,
//         opacityOfGradient: 0.4,
//         padding: const EdgeInsets.all(3),
//         size: 50, //default : 40
//       )
//     ],
//   );





//   void signUp(context) async {
  
  
//         FirebaseUser firebaseUser = await _firebaseAuth.currentUser();
//       firebaseUser
//           .updateEmail(newEmail)
//           .then(
//             (value) =>{ 
//               message = 'Success';
//               postDetailsToFirestore(context);
//               },
//           )
//         .catchError((onError) => {
//           message = 'error';
//             Fluttertoast.showToast(msg: message!);
//       print(onError);
//           });
   
    
  
  
// }

// postDetailsToFirestore(context) async {
//   // calling our firestore
//   // calling our user model
//   // sedning these values
//   final userProvider = Provider.of<UserModel>(context, listen: false);

//   FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
//   User? user = _auth.currentUser;

//   UserModel userModel = UserModel();

//   // writing all the values
//   userModel.email = user!.email;

//   await firebaseFirestore
//       .collection("users")
//       .doc(user.uid)
//       .update(userModel.toMap());
//   Fluttertoast.showToast(msg: "Account Updated Successfully:) ");

//   userProvider.getUserData();

//   Navigator.pushAndRemoveUntil((context),
//       MaterialPageRoute(builder: (context) => ProfilePage()), (route) => false);
// }

// }



