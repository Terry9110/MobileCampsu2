//   import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// Widget genderPicker() {
//     // final provider = Provider.of<SignupModel>(context);
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//             padding: const EdgeInsets.only(left: 10),
//             child: Text("Gender",
//                 style: GoogleFonts.poppins(color: Colors.black, fontSize: 12))),
//         GenderPickerWithImage(
//           showOtherGender: true,
//           verticalAlignedText: true,
//           selectedGender: provider.gender == "others"
//               ? Gender.Others
//               : provider.gender == "male"
//                   ? Gender.Male
//                   : Gender.Female,
//           selectedGenderTextStyle: const TextStyle(
//               color: Color(0xFF8b32a8), fontWeight: FontWeight.bold),
//           unSelectedGenderTextStyle: const TextStyle(
//               color: Colors.white, fontWeight: FontWeight.normal),
//           onChanged: (Gender? gender) {
//             if (gender == null) {
//               return;
//             }
//             print(gender.name);
//             provider.setValues("gender", gender.name.toLowerCase());
//           },
//           equallyAligned: true,
//           animationDuration: const Duration(milliseconds: 300),
//           isCircular: true,
//           // default : true,
//           opacityOfGradient: 0.4,
//           padding: const EdgeInsets.all(3),
//           size: 50, //default : 40
//         )
//       ],
//     );
//   }