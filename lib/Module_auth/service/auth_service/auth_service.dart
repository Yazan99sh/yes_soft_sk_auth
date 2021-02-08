import 'package:firebase_auth/firebase_auth.dart';
class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future <void> resetPassword(String email) async{
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email:email);
    } catch (e) {
      print(e);
    }
  }
  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }
}
