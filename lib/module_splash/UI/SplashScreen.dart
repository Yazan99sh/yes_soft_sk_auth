import 'package:chat_testing/Module_auth/authorization_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  initState(){
  super.initState();
    FirebaseAuth auth = FirebaseAuth.instance;
    auth.authStateChanges()
        .listen((User user) {
          print(mounted);
      if (user == null) {
         Navigator.pushNamed(context,AuthorizationRoutes.WelcomePage,);
        print('User is currently signed out!');
      } else {
         //FirebaseAuth.instance.signOut();
        Navigator.pushNamed(context,AuthorizationRoutes.Logged);
        print('User is signed in!');
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(51, 51, 51, 1),
        child: Center(
          child: Column(
            mainAxisAlignment:MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top:65),
                  child: Image.asset('images/logo2.png',width: 100,height: 100,),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:25),
                child: Container(
                    width: 100,
                    child: LinearProgressIndicator()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
