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
    FirebaseAuth auth = FirebaseAuth.instance;

    String uid = auth.currentUser!.uid.toString();
    // print('this is UID!!!');
    // print(uid);
    var response = await _db
        .collection('users')
        .where('uid', isEqualTo: uid)
        // .limit(1)
        .get();
    // .limit(1)
    // .get();
    // .snapshots();
    // if (response.)
    print('this is response');
    // print(response.take(1));
    return response;
  }

  getUserData() async {
    var authenticatedUser = FirebaseAuth.instance;

    getUser().then((querySnapshot) {
      print('THIS IS QUERY SNAPSHOT');
      print(querySnapshot);
      querySnapshot.docs.forEach((result) {
        print('THIS IS RESULT.DATA');
        print(result.data());
        print('this is res');
        var res = result.data();
        print(res['uid']);
        uid = res['uid'];
        email = res['email'];
        fullName = res['fullName'];
        userName = res['userName'];
        phoneNumber = res['phoneNumber'];
        imagePath = res['imagePath'];
        notifyListeners();
      });
    });

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
