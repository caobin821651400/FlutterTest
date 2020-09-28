import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormTestRoute extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<FormTestRoute> {
  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();

  GlobalKey _globalKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FormState"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Form(
          key: _globalKey,
          autovalidate: true,
          child: Column(
            children: <Widget>[
              TextFormField(
                autofocus: true,
                controller: _controller1,
                decoration: InputDecoration(
                    labelText: "用户名",
                    hintText: "用户名或邮箱",
                    icon: Icon(Icons.person)
                ),
                validator: (v) {
                  return v
                      .trim()
                      .length > 0 ? null : "用户名不能为空";
                },
              ),
              TextFormField(
                  controller: _controller2,
                  decoration: InputDecoration(
                      labelText: "密码",
                      hintText: "您的登录密码",
                      icon: Icon(Icons.lock)
                  ),
                  obscureText: true,
                  //校验密码
                  validator: (v) {
                    return v
                        .trim()
                        .length > 5 ? null : "密码不能少于6位";
                  }
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: <Widget>[
                    Expanded( //作用是match_parent
                      child: Builder(builder: (context) {
                        return RaisedButton(
                          child: Text("登录"),
                          color: Colors.blue,
                          textColor: Colors.white,
                          onPressed: () {
                            if (Form.of(context).validate()) {
                              print("验证成功");
                            }
                          },
                        );
                      },),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
