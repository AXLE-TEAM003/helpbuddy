
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:helpbuddy/user/chat/models/user_model.dart';

class FirebaseHelper {
  static Future<UserModel?> getUserModelById(String? id) async {
    // log("id: $id");
    UserModel? userModel;
    DocumentSnapshot snap =
        await FirebaseFirestore.instance.collection('users').doc(id).get().then(
      (DocumentSnapshot<Map<String, dynamic>> value) {
        // log("data obtained: ${value.data()}");
        return value;
      },
    );

    if (snap.data() != null) {
      // log("snap data obtained: ${snap.data()}");
      userModel = UserModel.fromMap(snap.data() as Map<String, dynamic>);
    } else {
      // log("snap data is null");
    }

    return userModel;
  }



    static Future<UserModel?> getAdminModelById(String? id) async {
    // log("id: $id");
    UserModel? userModel;
    DocumentSnapshot snap =
        await FirebaseFirestore.instance.collection('admin').doc(id).get().then(
      (DocumentSnapshot<Map<String, dynamic>> value) {
        // log("data obtained: ${value.data()}");
        return value;
      },
    );

    if (snap.data() != null) {
      // log("snap data obtained: ${snap.data()}");
      userModel = UserModel.fromMap(snap.data() as Map<String, dynamic>);
    } else {
      // log("snap data is null");
    }

    return userModel;
  }
}
