import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app2/ParamsRoute.dart';

class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              Text('This is new route'),
              RaisedButton(
                onPressed: () => go2ParamsRoute(context),
                child: Text("打开新界面"),
              ),
              RaisedButton(
                onPressed: () => go2NoRegisterRoute(context),
                child: Text("打开没有注册的界面"),
              )
            ],
          ),
        ));
  }



  ///路由 传参
  void go2ParamsRoute(BuildContext context) async {
    var result =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ParamsRoute(
        txt: "我是参数xxx",
      );
    }));

    print("返回结果= $result");
  }

  void go2NoRegisterRoute(BuildContext context) {}
}
