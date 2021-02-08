import 'package:chat_testing/Module_auth/UI/Screen/LogedTest.dart';
import 'package:chat_testing/Module_auth/UI/Screen/Login.dart';
import 'package:chat_testing/Module_auth/UI/Screen/Register.dart';
import 'package:chat_testing/Module_auth/UI/Screen/WelcomePage.dart';
import 'package:chat_testing/Module_auth/authorization_routes.dart';
import 'package:chat_testing/abstracts/module/yes_module.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class AuthorizationModule extends YesModule {
  AuthorizationModule() {}

  @override
  Map<String, WidgetBuilder> getRoutes() {
    return {
      AuthorizationRoutes.LOGIN_SCREEN: (context) => Login(),
      AuthorizationRoutes.REGISTER_SCREEN: (context) => Register(),
      AuthorizationRoutes.WelcomePage: (context) => WelcomePage(),
      AuthorizationRoutes.Logged: (context) => Logged(),
    };
  }
}
