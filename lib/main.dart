import 'package:chat_testing/Module_auth/authoriazation_module.dart';
import 'package:chat_testing/Module_auth/authorization_routes.dart';
import 'package:chat_testing/Module_theme/ColorPicker.dart';
import 'package:chat_testing/module_splash/UI/Loading.dart';
import 'package:chat_testing/module_splash/UI/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var fullRoutesList = <String, WidgetBuilder>{};
    AuthorizationModule authorizationModule = AuthorizationModule();
    fullRoutesList.addAll(authorizationModule.getRoutes());
    return MaterialApp(
      title: 'Chet Chat',
      routes: fullRoutesList,
      theme: ThemeData(
        primarySwatch:ColorPicker.primarySwitch,
      ),
      home:FutureBuilder(
        future: _initialization,
        builder: (context,snapshot){
          if (snapshot.connectionState==ConnectionState.waiting){
            return Loading();
          }
          else if (snapshot.hasError){
            return Container(child: Center(child: Text('${snapshot.error}',style: TextStyle(fontSize: 14),),),);
          }
          else {
         return SplashScreen();
          }
        },
      ),
    );
  }
}
