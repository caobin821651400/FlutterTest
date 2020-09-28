import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoRegisterRoute extends StatelessWidget {
  NoRegisterRoute({Key key, @required this.txt}) : super(key: key);

  final String txt;

  @override
  Widget build(BuildContext context) {
    ///参数
    var params = ModalRoute.of(context).settings.arguments;
    print("NoRegisterRoute收到参数= $params");

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'NewRoute 界面',
            style: TextStyle(
              fontSize: 22.0,
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('没有注册的路由界面  $txt'),
              RaisedButton(
                onPressed: () => go2(context),
                child: Text("打开新界面"),
              )
            ],
          ),
        ));
  }

  ///路由 传参
  void go2(BuildContext context) async {}
}
