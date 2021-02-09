
import 'package:chat_testing/abstracts/module/yes_module.dart';
import 'package:chat_testing/module_profile/UI/screens/LogedTest.dart';
import 'package:chat_testing/module_profile/profile_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ProfileModule extends YesModule {
  ProfileModule() {}

  @override
  Map<String, WidgetBuilder> getRoutes() {
    return {
      ProfileRoutes.Logged: (context) => Logged(),
    };
  }
}
