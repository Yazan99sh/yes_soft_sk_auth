import 'package:chat_testing/Module_auth/service/auth_service/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class Logged extends StatefulWidget {
  @override
  _LoggedState createState() => _LoggedState();
}

class _LoggedState extends State<Logged> {
  AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(51, 51, 51, 1),
      body:Center(
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18)
          ),
          color: Colors.white,
          onPressed: (){
           authService.logout();
          },
          child: Text('SignOut'),
        ),
      ),
    );
  }
}
