import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app2/toast.dart';

class FunctionPage extends StatefulWidget {
  @override
  _FunctionPageState createState() => _FunctionPageState();
}

class _FunctionPageState extends State<FunctionPage> {
  DateTime _lastPressedAt; //上次点击时间
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("功能型组件"),
      ),
      body: _continuousTwo(),
    );
  }

  ///拦截系统返回键 ==false拦截
  _continuousTwo() {
    return WillPopScope(
      onWillPop: () async {
        if (_lastPressedAt == null || DateTime.now().difference(_lastPressedAt) > Duration(seconds: 2)) {
          _lastPressedAt = DateTime.now();
          Toast.toast(context, "再按一次退出");
          return false;
        }
        return true;
      },
      child: Center(
        child: Text("连续两次退出"),
      ),
    );
  }
}
