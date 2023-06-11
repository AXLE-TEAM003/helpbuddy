/* 
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  





Future<void> sendPasswordResetOTP(String email) async {
  await _auth.sendPasswordResetEmail(email: email);
}

// Future<void> resetPasswordWithOTP(String otp, String newPassword) async {
//   final AuthCredential credential = EmailAuthProvider.credential(
//     email: (await _auth.currentUser!()).email,
//     password: otp,
//   );
//   await (await _auth.currentUser()).reauthenticateWithCredential(credential);
//   await (await _auth.currentUser()).updatePassword(newPassword);
// }



} */