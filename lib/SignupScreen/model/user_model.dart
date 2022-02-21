import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserModel extends ChangeNotifier {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  String? uid;
  String? email;
  String? fullName;
  String? userName;

  UserModel({this.uid, this.email, this.fullName, this.userName});

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      fullName: map['fullName'],
      userName: map['userName'],
    );
  }

  getUser() async {
    FirebaseAuth auth = FirebaseAuth.instance;

    String uid = auth.currentUser!.uid.toString();

    return await _db
        .collection('users')
        .where('uid', isEqualTo: uid)
        .limit(1)
        .get();
  }

  getUserData() async {
    var res = await getUser();
    print(res);
    uid = res['uid'];
    email = res['email'];
    fullName = res['fullName'];
    userName = res['userName'];
    notifyListeners();
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'fullName': fullName,
      'userName': userName,
    };
  }
}
