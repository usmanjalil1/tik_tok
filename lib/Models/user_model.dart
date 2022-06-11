import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String username;
  final String email;
  final String uid;
  final String profilePic;
  User(
      {required this.username,
      required this.email,
      required this.uid,
      required this.profilePic});

  Map<String, dynamic> toJason() => {
        "username": username,
        "profilePhoto": profilePic,
        "email": email,
        "uid": uid,
      };

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return User(
        email: snapshot['email'],
        profilePic: snapshot['profilePic'],
        uid: snapshot['uid'],
        username: snapshot['username']);
  }
}
