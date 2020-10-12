import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlexLayoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return content();
  }
}

Widget content() {
  return Scaffold(
    appBar: AppBar(
      title: Text("弹性布局"),
    ),
    body: Column(
      children: <Widget>[
        Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                height: 30,
                color: Colors.red,
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                height: 20.0,
                color: Colors.green,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: SizedBox(
            height: 100,
            child: Flex(
              direction: Axis.vertical,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 30.0,
                    color: Colors.red,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.indigoAccent,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 30.0,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}
