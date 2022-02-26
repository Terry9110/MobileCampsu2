import 'package:campus2/ProfilePage/edit_profile_page.dart';
import 'package:campus2/SignupScreen/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../theme.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserModel>(context);

    User? user = FirebaseAuth.instance.currentUser;
    print(user);

    // final userProvider = Provider.of<UserModel>(context);
    //   final fullname = userProvider.fullName;
    // final fullNameController = TextEditingController();

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF006633),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>  EditProfilePage()));
            },
          )
        ],
      ),
      body: Stack(
        children: [
          Container(
            height: height * 0.5,
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
                color: Color(0xFF006633),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(80),
                    bottomRight: Radius.circular(200))),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pop();
                print('This is print');
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      SizedBox(
                        height: 20,
                      ),
                      // Icon(Icons.arrow_back, color: Colors.white),
                      SizedBox(width: 10),
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
                left: 25, right: 25, bottom: 20, top: height * 0.20),
            child: Container(
              width: width,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10.0,
                    ),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 100),
                  Text('Profile Details',
                      style: GoogleFonts.poppins(
                          color: Colors.grey[800],
                          fontWeight: FontWeight.w600)),
                  const SizedBox(height: 20),
                  profileDetails(
                      fieldName: "UserName",
                      value: userProvider.userName ?? " "),
                  profileDetails(
                      fieldName: "Full Name",
                      value: userProvider.fullName ?? " "),
                  profileDetails(
                      fieldName: "Phone Number",
                      value: userProvider.phoneNumber ?? " "),
                  profileDetails(
                      fieldName: "Email", value: userProvider.email ?? ""),
                  const SizedBox(
                    height: 40,
                  ),
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 150,
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: activeRedPrimary.withOpacity(0.8),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5))),
                        child: Center(
                            child: Text("Change Password",
                                style: GoogleFonts.poppins(
                                    color: Colors.white, fontSize: 12))),
                      )
                    ],
                  ))
                ],
              ),
            ),
          ),
          Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: height * 0.1),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 10.0,
                              ),
                            ],
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            border: Border.all(width: 4.0, color: Colors.white),
                            image: const DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTN3-b6hE_5K-l4bv_gBuFtF5zWoPEhSkLsuw&usqp=CAU"))),
                      )
                    ])
              ]),
        ],
      ),
    );
  }

  Widget profileDetails({required String fieldName, required value}) {
    return Container(
        margin: const EdgeInsets.only(top: 5, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(fieldName,
                style: GoogleFonts.poppins(
                  color: Colors.black45,
                  fontSize: 14,
                )),
            Text(value,
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 12))
          ],
        ));
  }
}
