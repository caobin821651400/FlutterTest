import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _chick() {
      print("111");
    }

    return new Container(
      decoration: new BoxDecoration(color: Colors.white),
      child: Center(
        child: Column(
          children: <Widget>[
            Text(
              "123455" * 10,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textScaleFactor: 3.0,
              textAlign: TextAlign.left,
              style: new TextStyle(fontSize: 11.0),
            ),
            Text(
              "哈哈哈哈哈哈哈" * 6,
              overflow: TextOverflow.fade,
              textAlign: TextAlign.center,
              style: new TextStyle(fontSize: 11.0),
            ),
            Text(
              "你好啊",
              style: new TextStyle(
                fontSize: 20.0,
                color: Colors.blue,
                height: 2.0,
                background: new Paint()..color = Colors.yellow,
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.dotted,
              ),
            ),
            Text.rich(TextSpan(
              children: [
                TextSpan(text: "home:", style: TextStyle(fontSize: 10.0)),
                TextSpan(
                    text: "www.baidu.com",
                    style: TextStyle(
                        fontSize: 10.0, color: Colors.lightGreenAccent)),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
