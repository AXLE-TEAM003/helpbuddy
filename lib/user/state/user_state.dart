import 'package:flutter/material.dart';
import 'package:helpbuddy/user/chat/models/user_model.dart';

class UserState extends ChangeNotifier {
  UserModel? userDetails;
  UserModel? adminDetails;

  void userAdminData(UserModel userData, UserModel adminData) {
    userDetails = userData;
    adminDetails = adminData;
  }
}
