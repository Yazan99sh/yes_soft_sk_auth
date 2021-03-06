import 'package:chat_testing/Module_auth/UI/Widgets/LogoImage.dart';
import 'package:chat_testing/Module_auth/UI/Widgets/ProgressIndecator.dart';
import 'package:flutter/material.dart';
class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  @override
  initState(){
  super.initState();
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
              LogoImage(),
              Progress(),
            ],
          ),
        ),
      ),
    );
  }
}
