import 'package:chat_testing/Module_auth/request/login_request/login_request.dart';
import 'package:chat_testing/Module_auth/request/register_request/register_request.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  Future<bool> createUser(RegisterRequest request) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email:request.email,
        password:request.password,
      );
      FirebaseFirestore.instance.collection('users').add({'UserId':userCredential.user.uid,'UserName':request.username});
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        return false;
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
    return true;
  }

  Future<bool> login(LoginRequest loginRequest) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: "${loginRequest.email}",
          password: "${loginRequest.password}"
      );
    } on FirebaseAuthException catch (e) {
      // if (e.code=='invalid-email'){
      //   return 'Wrong email pattern';
      // }
      // else if (e.code == 'user-not-found') {
      //   return 'No user found for that email.';
      // } else if (e.code == 'wrong-password') {
      //   return 'Wrong password provided for that user.';
      // }
      // else {
      //   return e.code ;
      // }
      print(e.code);
      return false;
    }
    return true;
  }
}
