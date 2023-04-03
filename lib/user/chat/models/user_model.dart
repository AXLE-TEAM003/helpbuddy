// ignore_for_file: public_member_api_docs, sort_constructors_first

class UserModel {
  String? userId;
  String? userName;
  String? userEmail;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? gender;
  String? amount;
  String? userDpUrl; // ? dp = display picture or profile picture url
  String? password;
  bool? isOnline;
  String? nationality;
  String? role;

  UserModel(
      {this.userId,
      this.userName,
      this.userEmail,
      this.phoneNumber,
      this.gender,
      this.firstName,
      this.lastName,
      this.amount,
      this.userDpUrl,
      this.password,
      this.isOnline,
      this.role,
      this.nationality});

  // ? you have user model instance, convert it to a map
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'userName': userName,
      'userEmail': userEmail,
      'phoneNumber': phoneNumber,
      'amount': amount,
      'gender': gender,
      'lastName': lastName,
      'firstName': firstName,
      'userDpUrl': userDpUrl,
      'password': password,
      'isOnline': isOnline,
      'role': role,
      'nationality': nationality
    };
  }

  // ? recieve map and conert it to user model instance
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map['userId'] != null ? map['userId'] as String : null,
      userName: map['userName'] != null ? map['userName'] as String : null,
      firstName: map['firstName'] != null ? map['firstName'] as String : null,
      lastName: map['lastName'] != null ? map['lastName'] as String : null,
      userEmail: map['userEmail'] != null ? map['userEmail'] as String : null,
      amount: map['amount'] != null ? map['amount'] as String : null,
      phoneNumber:
          map['phoneNumber'] != null ? map['phoneNumber'] as String : null,
      gender: map['gender'] != null ? map['gender'] as String : null,
      userDpUrl: map['userDpUrl'] != null ? map['userDpUrl'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      role:map['role'] != null ? map['role'] as String : null,
      nationality:
          map['nationality'] != null ? map['nationality'] as String : null,
      isOnline: map['isOnline'] != null ? map['isOnline'] as bool : null,
    );
  }
}
