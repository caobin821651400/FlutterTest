import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app2/toast.dart';

class DialogPage extends StatefulWidget {
  @override
  _DialogPageState createState() => _DialogPageState();
}

class _DialogPageState extends State<DialogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("弹窗")),
        body: Container(
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              RaisedButton(
                child: Text("弹出对话框"),
                onPressed: () async {
                  bool isDel = await showDialog1(context);
                  print("返回值= $isDel");
                },
              ),
              RaisedButton(
                child: Text("单选框"),
                onPressed: () async {
                  String str = await showSimpleDialog(context);
                  print("返回值= $str");
                },
              ),
              RaisedButton(
                child: Text("列表弹窗"),
                onPressed: () async {
                  String str = await showListDialog(context);
                  print("返回值= $str");
                },
              ),
            ],
          ),
        ));
  }
}

///列表弹窗
Future<String> showListDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Column(
            children: <Widget>[
              ListTile(title: Text("请选择")),
              Expanded(
                  child: ListView.builder(
                itemCount: 30,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text("$index"),
                    onTap: () => Navigator.of(context).pop("$index"),
                  );
                },
              )),
            ],
          ),
        );
      });
}

///单选框
Future<String> showSimpleDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text("选择性别"),
          children: <Widget>[
            SimpleDialogOption(
              child: Text("男"),
              onPressed: () => Navigator.of(context).pop("男"),
            ),
            SimpleDialogOption(
              child: Text("女"),
              onPressed: () => Navigator.of(context).pop("女"),
            ),
          ],
        );
      });
}

///简单的弹窗
Future<bool> showDialog1(BuildContext context) {
  return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text("温馨提示"),
          content: SingleChildScrollView(
            child: Text("确定删除吗" * 100),
          ),
          contentTextStyle: TextStyle(color: Colors.red),
          actions: <Widget>[
            FlatButton(
              child: Text("取消"),
              onPressed: () => Navigator.of(context).pop(false),
            ),
            FlatButton(
              child: Text("删除"),
              onPressed: () {
                Toast.toast(context, "删除成功");
                Navigator.of(context).pop(true);
              },
            )
          ],
        );
      });
}
