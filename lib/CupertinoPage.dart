import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(

      navigationBar: CupertinoNavigationBar(
        middle: Text("CupertinoNavigationBar"),
      ),
      child: Center(
        child:  CupertinoButton(
          color: Colors.blue,
          child: Text("按钮"),
          onPressed: (){
          },
        ),
      ),
    );
  }
}