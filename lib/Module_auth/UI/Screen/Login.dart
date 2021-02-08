import 'package:chat_testing/Module_auth/UI/Widgets/Google.dart';
import 'package:chat_testing/Module_auth/UI/Widgets/LRFrame.dart';
import 'package:chat_testing/Module_auth/UI/Widgets/LoadingCircular.dart';
import 'package:chat_testing/Module_auth/UI/Widgets/StackedBottun.dart';
import 'package:chat_testing/Module_auth/UI/Widgets/field.dart';
import 'package:chat_testing/Module_auth/manager/Auth_manager/auth_manager.dart';
import 'package:chat_testing/Module_auth/repository/auth/auth_repository.dart';
import 'package:chat_testing/Module_auth/request/login_request/login_request.dart';
import 'package:chat_testing/Module_auth/verifyField.dart';
import 'package:chat_testing/Module_theme/ColorPicker.dart';
import 'package:flutter/material.dart';
import '../Widgets/ResetDialogPassword.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email;
  TextEditingController password;
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  bool loading = false;
  AuthRepository _authRepository = AuthRepository();
  AuthManager authManager;
  @override
  void initState() {
    super.initState();
    email = TextEditingController();
    password = TextEditingController();
    authManager = AuthManager(_authRepository);
  }
  @override
  void dispose() {
    super.dispose();
    email.dispose();
    password.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return LRFrame(Stack(children: [
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 12.0),
            child: Text(
              'Welcome back!',
              style: TextStyle(
                color: ColorPicker.primaryTextColor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Text(
            'Login with your email to start chatting',
            style: TextStyle(
              color: ColorPicker.secondaryTextColor,
              fontSize: 13,
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Form(
                      key: _loginFormKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: ListView(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 16.0, right: 16, left: 16),
                            child: Field(text:'Email',controller: email,validator:(result) {
                              if (result.isEmpty) {
                                return 'Please fill this field';
                              }
                              return null;
                            },),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 16.0, right: 16, left: 16),
                            child: Field(text: 'Password',controller: password,validator: (result){
                              if (result.isEmpty){
                                return "Please fill this field";
                              }
                              else if (result.length < 6){
                                return "Password with less than 6 characters not allowed";
                              }
                              else
                                return null;
                            },),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: SelectableText(
                                'Forgot your password?',
                                onTap: (){
                                  resetDialogPassword(context);
                                },
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ),
                          //Google('Login With Google'),
                          Container(
                            height: 55,
                            width: double.maxFinite,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                StackedButton(text: 'Login',onPressed: (){
                  if (_loginFormKey.currentState.validate()){
                    setState(() {
                      loading = true;
                    });
                    authManager.login(LoginRequest(email: email.text,password: password.text)).whenComplete(() => setState((){
                  loading = false;
                  }));
                  }
                },),
              ],
            ),
          ),
        ],
      ),
      loading?LoadingCircular():Container(),
    ],));
  }

}
