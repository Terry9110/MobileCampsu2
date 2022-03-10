
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserModel extends ChangeNotifier {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  String? uid;
  String? email;
  String? fullName;
  String? userName;
  String? phoneNumber;
  String? imagePath;

  UserModel(
      {this.uid,
      this.email,
      this.fullName,
      this.userName,
      this.phoneNumber,
      this.imagePath});

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
        uid: map['uid'],
        email: map['email'],
        fullName: map['fullName'],
        userName: map['userName'],
        phoneNumber: map['phoneNumber'],
        imagePath: map['imagePath']);
  }

  getUser() async {
    FirebaseAuth auth = await FirebaseAuth.instance;

    String uid = await auth.currentUser!.uid.toString();
    (uid);
    print(uid);
    var response = await _db
    .collection('users')
    .doc(uid)
    .get()
    .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        var res = documentSnapshot.data() as Map;
        print(res['firstName']);
        // if(res != null){
         
           uid = res['uid'] ?? "";
          print(uid);
          email = res['email']  ?? "";
          fullName = res['fullName'] ?? "";
          userName = res['userName'] ?? "";
          phoneNumber = res['phoneNumber'] ?? "";
          imagePath = res['imagePath'] ?? "";
          notifyListeners();
        // }
        
        print('Document data: ${documentSnapshot.data()}');
      } else {
        print('Document does not exist on the database');
      }
    });
    // .get();
    // response.snapshots());
    print('this is response');
    // print(response.take(1));
    return response;
  }

  getUserData() async {
    var authenticatedUser = FirebaseAuth.instance;

  // 
  var snapshot = await this.getUser();
  // print(snapshot);
  print('snapshot');
    // print(snapshot.data.data);
    //  print("snapshot");
    //  Map<String, dynamic> data = snapshot as Map<String, dynamic>;
    //   print(data);
    //   print("snapshot");
    //  .then((DocumentSnapshot ds) {  

    //    print(ds);
    //  });
   
    // for (var doc in snap.docs) {
    //     uid =  doc.get('uid');
    //     email = doc.get('email');
    //     fullName =  doc.get('fullName');
    //     userName =  doc.get('userName');
    //     phoneNumber =  doc.get('phoneNumber');
    //     imagePath =  doc.get('imagePath');
    //     notifyListeners();

    // }
    // //     print('THIS IS RESULT.DATA');
    //     print(result.data());
    //     print('this is res');
    //     var res = result.data();
    //     print(res['uid']);
    //     uid = res['uid'];
    //     email = res['email'];
    //     fullName = res['fullName'];
    //     userName = res['userName'];
    //     phoneNumber = res['phoneNumber'];
    //     imagePath = res['imagePath'];
    //     notifyListeners();
    //   });
  // };

    // print('this is res');
    // print(res['uid']);
    // uid = res['uid'];
    // email = res['email'];
    // fullName = res['fullName'];
    // userName = res['userName'];
    notifyListeners();
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'fullName': fullName,
      'userName': userName,
      'phoneNumber': phoneNumber,
      'imagePath': imagePath
    };
  }
}
