import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:helpbuddy/user/chat/models/user_model.dart';

class UserAuth {
  String adminId = '';
  Future<void> login(String email, String password) async {
    try {
      UserCredential credential;
      credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
            email: email,
            password: password,
          )
          .whenComplete(
            () {},
          );

      String? userId = credential.user!.uid;
      String name = email.substring(0, email.indexOf('@'));

      DocumentSnapshot userData = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();
      UserModel userModel =
          UserModel.fromMap(userData.data() as Map<String, dynamic>);
      // set isOnline to true
      FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .update({'isOnline': true});
      //ScaffoldMessenger.of(context).showSnackBar(loginSnackBar);

      // toHomeScreen(userModel, credential.user!);
    } catch (e) {}
  }

  Future<UserModel> getAdminDetails() async {
    DocumentSnapshot userData =
        await FirebaseFirestore.instance.collection('admin').doc(adminId).get();
    UserModel adminModel =
        UserModel.fromMap(userData.data() as Map<String, dynamic>);
    return adminModel;
  }
}
