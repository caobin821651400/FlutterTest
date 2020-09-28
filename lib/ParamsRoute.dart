import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ParamsRoute extends StatelessWidget {
  ParamsRoute({
    Key key,
    @required this.txt, //接受一个txt参数
  }) : super(key: key);

  final String txt;

  @override
  Widget build(BuildContext context) {
    ///通过settings获取参数
    var params = ModalRoute.of(context).settings.arguments;
    print("通过settings获取到的参数= $params");

    return Scaffold(
      appBar: AppBar(
        title: Text("提示"),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(txt),
              RaisedButton(
                onPressed: () => Navigator.pop(context, "我是返回值"),
                child: Text("返回"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
