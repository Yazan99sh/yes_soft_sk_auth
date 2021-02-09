import 'package:chat_testing/Module_auth/request/login_request/LoginRequest_Api.dart';
import 'package:chat_testing/Module_auth/request/login_request/login_request.dart';
import 'package:chat_testing/Module_auth/request/register_request/register_request.dart';
import 'package:chat_testing/Module_auth/response/login_response.dart';
import 'package:chat_testing/consts/urls.dart';
import 'package:chat_testing/module_network/http_client/http_client.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  ApiClient _apiClient;
  Future<String> createUser(RegisterRequest request) async {
    UserCredential userCredential;
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email:request.email,
        password:request.password,
      );
      FirebaseFirestore.instance.collection('users').add({'UserId':userCredential.user.uid,'UserName':request.username});
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        return null;
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
    return userCredential.user.uid;
  }

  Future<dynamic> login(LoginRequest loginRequest) async {
    UserCredential userCredential;
    try {
      userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
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
      return null;
    }
    return userCredential.user.uid;
  }

  Future<LoginResponse> loginApi(LoginRequestApi loginRequest) async {
    _apiClient = ApiClient();
    var headers = {"Content-Type": "application/json"};
    var result = await _apiClient.post(Urls.CREATE_TOKEN_API,headers,loginRequest.toJson(),);
    if (result == null) {
      return null;
    }
    return LoginResponse.fromJson(result);
  }

}
