import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonPage extends StatelessWidget {
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
              "演示按钮的使用",
              style: TextStyle(fontSize: 20.0),
            ),
            RaisedButton.icon(
              icon: Icon(Icons.send),
              label: Text("123"),
              onPressed: () {
                print("11111");
              },
            ),
            FlatButton(
              child: Text("456"),
              onPressed: () {
                print("22222");
              },
            ),
            OutlineButton(
              child: Text("789"),
              focusColor: Colors.yellow,
              onPressed: () {
                print("333333333");
              },
            ),
            FlatButton(
              color: Colors.blue,
              textColor: Colors.white,
              highlightColor: Colors.blue[700],
              splashColor: Colors.grey,
              child: Text("Submit"),
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                      color: Colors.red, width: 2.0, style: BorderStyle.solid),
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(10.0),
                  )),
              // shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(20.0)),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
