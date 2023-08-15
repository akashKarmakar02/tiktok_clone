import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  User({
    required this.uid,
    required this.name,
    required this.email,
    required this.profilePhoto,
  });

  String name;
  String uid;
  String email;
  String profilePhoto;

  Map<String, dynamic> toJson() => {
        name: name,
        uid: uid,
        email: email,
        profilePhoto: profilePhoto,
      };

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return User(
        uid: snapshot['uid'],
        name: snapshot['name'],
        email: snapshot['email'],
        profilePhoto: snapshot['profilePhoto']);
  }
}
