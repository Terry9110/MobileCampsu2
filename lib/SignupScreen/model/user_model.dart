class UserModel {
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

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': fullName,
      'userName': userName,
    };
  }
}