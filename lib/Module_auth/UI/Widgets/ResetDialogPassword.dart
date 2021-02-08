import 'package:chat_testing/Module_auth/UI/Widgets/field.dart';
import 'package:chat_testing/Module_auth/service/auth_service/auth_service.dart';
import 'package:flutter/material.dart';
void resetDialogPassword(context){
  AuthService authService = AuthService();
  var email = TextEditingController();
  var alert = AlertDialog(
    shape:RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    backgroundColor: Colors.grey[900],
    title: Text('Reset Password',style: TextStyle(
      color: Colors.white,
    ),),
    content:Container(
        height: 100,
        child: Center(child: Field(controller: email,text: 'Email',validator:(result) {
          if (result.isEmpty) {
            return 'Please fill this field';
          }
          return null;
        },))),
    actions: [
      FlatButton(child: Text('Confirm',style: TextStyle(
        color: Colors.white,
      ),),onPressed: ()=>authService.resetPassword(email.text).then((_) =>Navigator.of(context).pop()),),
      FlatButton(child: Text('Cancel',style: TextStyle(
        color: Colors.white,
      ),),onPressed: ()=>Navigator.of(context).pop(),),
    ],
  );
  showDialog(context: context,builder: (_){
    return alert;
  });
}