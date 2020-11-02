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
              RaisedButton(
                child: Text("自定义弹窗"),
                onPressed: () async {
                  showMyCustomDialog(context);
                },
              ),
              RaisedButton(
                child: Text("复选框状态"),
                onPressed: () async {
                  showDialogCheckBox(context);
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
          child: Container(
            height: MediaQuery.of(context).size.height * 0.5,
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

Future<void> showMyCustomDialog(BuildContext context) {
  return showCustomDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("自定义的对话框"),
          content: Text("内容区域内容区域内容区域内容区域"),
          actions: <Widget>[
            FlatButton(
              child: Text("取消"),
              onPressed: () {
                print("取消");
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text("确定"),
              onPressed: () {
                Toast.toast(context, "确定");
              },
            )
          ],
        );
      });
}

///自定义对话框
Future<T> showCustomDialog<T>({@required BuildContext context, bool isCanCancel = true, WidgetBuilder builder}) {
  final ThemeData themeData = Theme.of(context, shadowThemeOnly: true);

  return showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
        final Widget pageChild = Builder(builder: builder);
        return SafeArea(
          child: Builder(builder: (BuildContext context) {
            return themeData != null ? Theme(data: themeData, child: pageChild) : pageChild;
          }),
        );
      },
      barrierDismissible: isCanCancel,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black54,
      transitionDuration: const Duration(milliseconds: 300),
      transitionBuilder: _buildMaterialDialogTransitions);
}

Widget _buildMaterialDialogTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
//使用缩放动画
  return ScaleTransition(
    scale: CurvedAnimation(parent: animation, curve: Curves.easeOut),
    child: child,
  );
}

///弹窗复选框
Future<bool> showDialogCheckBox(BuildContext context) {
  bool isCheck = false;
  return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text("温馨提示"),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("您确定要删除当前文件吗?"),
              Row(
                children: <Widget>[
                  Text("同时删除子目录？"),
                  //第一种方式不太好，context是取得showDialog下面的，导致过多的重绘
                  // Checkbox(
                  //   value: isCheck,
                  //   onChanged: (bool value) {
                  //     (context as Element).markNeedsBuild();
                  //     isCheck = !isCheck;
                  //   },
                  // ),
                  //第二种缩小的context范围，只是Checkbox的context
                  Builder(
                    builder: (BuildContext context) {
                      return Checkbox(
                        value: isCheck,
                        onChanged: (bool value) {
                          (context as Element).markNeedsBuild();
                          isCheck = !isCheck;
                        },
                      );
                    },
                  )
                ],
              )
            ],
          ),
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
