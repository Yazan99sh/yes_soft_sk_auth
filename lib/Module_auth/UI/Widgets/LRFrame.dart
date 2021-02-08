
import 'file:///C:/Users/syria/IdeaProjects/chat_testing/lib/Module_auth/UI/Scrollbehavior.dart';
import 'package:chat_testing/Module_auth/UI/Widgets/LoginAppBar.dart';
import 'package:chat_testing/Module_theme/ColorPicker.dart';
import 'package:flutter/material.dart';
class LRFrame extends StatelessWidget {
  final child;
  LRFrame(this.child);
  @override
  Widget build(BuildContext context) {
  return ScrollConfiguration(
      behavior: MyBehavior(),
      child: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("images/welcome.jpg"),
            )),
        child: GestureDetector(
          onTap: () {
            var focus = FocusScope.of(context);
            if (!focus.hasPrimaryFocus){
              focus.unfocus();
            }
          },
          child:Scaffold(
            backgroundColor: ColorPicker.plateColor.withOpacity(0.0),
            appBar: loginAppBar(),
            body: Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    color: ColorPicker.plateColor,
                    borderRadius: BorderRadius.circular(10)),
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
