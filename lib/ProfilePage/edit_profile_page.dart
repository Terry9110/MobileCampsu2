import 'package:campus2/ProfilePage/profile_page.dart';
import 'package:campus2/SignupScreen/model/signupModel.dart';
import 'package:campus2/SignupScreen/model/user_model.dart';
import 'package:campus2/SignupSuccessful/success_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gender_picker/gender_picker.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage(
      {Key? key,
      required this.userName,
      required this.fullName,
      required this.phoneNumber})
      : super(key: key);

  final String userName;
  final String fullName;
  final String phoneNumber;

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

final _auth = FirebaseAuth.instance;

// string for displaying the error Message
String? errorMessage;

//our form key
final _formKey = GlobalKey<FormState>();

//editing Controller
final TextEditingController fullNameEditingController = TextEditingController();
final TextEditingController emailEditingController = TextEditingController();
final TextEditingController userNameEditingController = TextEditingController();
final passwordEditingController = new TextEditingController();
final dateOfBirthEditingController = new TextEditingController();
TextEditingController editEmailController = new TextEditingController();

TextEditingController phoneNumberEditingController =
    new TextEditingController();

class _EditProfilePageState extends State<EditProfilePage> {
  String? userName;
  String? fullName;
  String? phoneNumber;
  // final userProvider;
  @override
  void initState() {
    super.initState();
    // print("this is widget.username");

    // print(widget.userName);
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      final userProvider = Provider.of<UserModel>(context, listen: false);

    userProvider.getUserData();
      setState(() {
        userName =  userProvider.userName;
         fullName =  userProvider.fullName;
          phoneNumber =  userProvider.phoneNumber;
      });
      // TextEditingController userName = TextEditingController(text:userProvider.userName);
      // // widget.userName;
      //  TextEditingController fullName = TextEditingController(text:userProvider.fullName);
      //   TextEditingController phoneNumber = TextEditingController(text:widget.phoneNumber);
    });

    //  final userProvider = Provider.ofR<UserModel>(context);

    // userProvider.getUserData();
    // if (userProvider.fullName != null) {
    //     fullNameEditingController.value = TextEditingController.fromValue(new TextEditingValue(text:userProvider.fullName??"")).value;
    //   // var userNamePos = userNameEditingController.selection;
    //   userNameEditingController.text = userProvider.userName!;
    //   //  if (userNamePos.start > userNameEditingController.text.length) {
    //   //   userNamePos = new TextSelection.fromPosition(
    //   //       new TextPosition(offset: userNameEditingController.text.length));
    //   // }
    //         // userNameEditingController.selection = userNamePos;

    //   // fullNameEditingController.text = userProvider.fullName!;
    //   phoneNumberEditingController.text = userProvider.phoneNumber!;
    // }

    // emailEditingController = TextEditingController();
  }

  @override
  void dispose() {
    //  fullNameEditingController.dispose();
    //  userNameEditingController.dispose();
    //  phoneNumberEditingController.dispose();
    // userProvider.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserModel>(context);

        userName =  userProvider.userName;
         fullName =  userProvider.fullName;
          phoneNumber =  userProvider.phoneNumber;
    
    //Full Name Field
    final fullNameField = TextFormField(
      // key: Key(fullName.toString()))
    // autofocus: false,
    // key: Key(userProvider.fullName ?? " "),
    key: Key("First Name"),
    
    initialValue: fullName,
    onChanged: (ValueKey){
      print(ValueKey);
      setState(() {
        fullName:ValueKey;
      });
    },
    onSaved: (val){
       setState(() {
        fullName:val;
      });
    },
    // controller:fullName,
    keyboardType:TextInputType.name,
    textInputAction: TextInputAction.next,
    decoration:
    InputDecoration(
        // prefixIcon: const Icon(Icons.mail),
        // contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Full Name",
        hintStyle: GoogleFonts.poppins(color: Colors.grey[400]),
        contentPadding:
            const EdgeInsets.only(left: 20, top: 15, bottom: 15, right: 5),
        label: Text(
          'Full Name',
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
            borderSide: const BorderSide(width: 1, color: Color(0xFFe63900)))));

//Email Address Field
    final emailAddressField = TextFormField(
      autofocus: false,
      controller: emailEditingController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          // prefixIcon: const Icon(Icons.mail),
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

//User Name Field
    final userNameField = TextFormField(
      key: Key(userProvider.userName ?? " "),
      initialValue: userProvider.userName,
      onChanged: (ValueKey){
      setState(() {
        userName:ValueKey;
      });
    },
      onSaved: (val){
       setState(() {
        userName:val;
      });
    },
      autofocus: false,
      // controller: userName,
      keyboardType: TextInputType.name,
      //  validator: (value) {

      //  },

      decoration: InputDecoration(
          // prefixIcon: const Icon(Icons.mail),
          // contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "UserName",
          hintStyle: GoogleFonts.poppins(color: Colors.grey[400]),
          contentPadding:
              const EdgeInsets.only(left: 20, top: 15, bottom: 15, right: 5),
          label: Text(
            'UserName',
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

    //phoneNumber field
    final phoneNumberField = TextFormField(
      key: Key(userProvider.phoneNumber ?? " "),
    
      initialValue: userProvider.phoneNumber,

        onChanged: (ValueKey){
      setState(() {
        phoneNumber:ValueKey;
      });
    },
     onSaved: (val){
       setState(() {
        phoneNumber:val;
      });
    },
      autofocus: false,
      // controller: phoneNumber,
      keyboardType: TextInputType.phone,
      //  validator: (value) {

      //  },

      decoration: InputDecoration(
          // prefixIcon: const Icon(Icons.mail),
          // contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Phone Number",
          hintStyle: GoogleFonts.poppins(color: Colors.grey[400]),
          contentPadding:
              const EdgeInsets.only(left: 20, top: 15, bottom: 15, right: 5),
          label: Text(
            'Phone Number',
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

    //Email Address Field
    final editEmailField = TextField(
      autofocus: false,
      controller: editEmailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          // prefixIcon: const Icon(Icons.mail),
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

    final signUpButton = Material(
      elevation: 5,
      color: const Color(0xFF006633),
      borderRadius: BorderRadius.circular(15),
      child: MaterialButton(
        height: 50,
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          postDetailsToFirestore(context, fullName, userName, phoneNumber);
        },
        child: Text('Update Profile',
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontSize: 14)),
      ),
    );
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
                    Text("EDIT PROFILE,",
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 24)),
                    Text("This is where you can edit profile!",
                        style: GoogleFonts.poppins(
                            color: Colors.grey[500], fontSize: 18)),
                    fullNameField,
                    const SizedBox(height: 20),
                    userNameField,
                    const SizedBox(height: 20),
                    // editEmailField,
                    const SizedBox(height: 20),
                    // passwordField,
                    // const SizedBox(height: 20),
                    phoneNumberField,
                    genderPicker(context),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        // SizedBox(
                        //     width: MediaQuery.of(context).size.width - 90,
                        //     child: Text(
                        //         "By proceeding you also agree to the Terms of Service and Privacy Policy",
                        //         style:
                        //             GoogleFonts.poppins(color: Colors.grey))),
                      ],
                    ),
                    const SizedBox(height: 20),
                    signUpButton,
                    const SizedBox(height: 20),
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

Widget genderPicker(BuildContext context) {
  final provider = Provider.of<SignupModel>(context);
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text("Gender",
              style: GoogleFonts.poppins(color: Colors.black, fontSize: 12))),
      GenderPickerWithImage(
        showOtherGender: true,
        verticalAlignedText: true,
        selectedGender: provider.gender == "others"
            ? Gender.Others
            : provider.gender == "male"
                ? Gender.Male
                : Gender.Female,
        selectedGenderTextStyle: const TextStyle(
            color: Color(0xFF8b32a8), fontWeight: FontWeight.bold),
        unSelectedGenderTextStyle:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.normal),
        onChanged: (Gender? gender) {
          if (gender == null) {
            return;
          }
          print(gender.name);
          provider.setValues("gender", gender.name.toLowerCase());
        },
        equallyAligned: true,
        animationDuration: const Duration(milliseconds: 300),
        isCircular: true,
        // default : true,
        opacityOfGradient: 0.4,
        padding: const EdgeInsets.all(3),
        size: 50, //default : 40
      )
    ],
  );
}

// void signUp(String email, String password, context) async {
//   if (_formKey.currentState!.validate()) {
//     try {
//       await _auth
//           .createUserWithEmailAndPassword(email: email, password: password)
//           .then((value) => {postDetailsToFirestore(context)})
//           .catchError((e) {
//         Fluttertoast.showToast(msg: e!.message);
//       });
//     } on FirebaseAuthException catch (error) {
//       switch (error.code) {
//         case "invalid-email":
//           errorMessage = "Your email address appears to be malformed.";
//           break;
//         case "wrong-password":
//           errorMessage = "Your password is wrong.";
//           break;
//         case "user-not-found":
//           errorMessage = "User with this email doesn't exist.";
//           break;
//         case "user-disabled":
//           errorMessage = "User with this email has been disabled.";
//           break;
//         case "too-many-requests":
//           errorMessage = "Too many requests";
//           break;
//         case "operation-not-allowed":
//           errorMessage = "Signing in with Email and Password is not enabled.";
//           break;
//         default:
//           errorMessage = "An undefined Error happened.";
//       }
//       Fluttertoast.showToast(msg: errorMessage!);
//       print(error.code);
//     }
//   }
// }

postDetailsToFirestore(context, fullName, userName, phoneNumber) async {
  // calling our firestore
  // calling our user model
  // sedning these values
  print(fullName);
  print("fullName");
  return;
  final userProvider = Provider.of<UserModel>(context, listen: false);

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  User? user = _auth.currentUser;

  UserModel userModel = UserModel();

  // writing all the values
  // userModel.email = user!.email;
  // userModel.uid = user.uid;
  userModel.fullName = fullName;
  userModel.userName = userName;
  userModel.phoneNumber = phoneNumber;

  await firebaseFirestore
      .collection("users")
      .doc(user?.uid)
      .update(userModel.toMap());
  Fluttertoast.showToast(msg: "Account Updated Successfully:) ");

  await userProvider.getUserData();

  Navigator.pushAndRemoveUntil((context),
      MaterialPageRoute(builder: (context) => ProfilePage()), (route) => false);
}
