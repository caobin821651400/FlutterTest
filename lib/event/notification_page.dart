import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("通知"),
      ),
      body: _demo2(),
    );
  }

  Widget _demo1() {
    return Center(
      child: NotificationListener(
        onNotification: (notification) {
          switch (notification.runtimeType) {
            case ScrollStartNotification:
              print("开始滚动");
              break;
            case ScrollUpdateNotification:
              print("正在滚动");
              break;
            case ScrollEndNotification:
              print("滚动停止");
              break;
            case OverscrollNotification:
              print("滑动到边界");
              break;
          }
          return;
        },
        child: ListView.separated(
            separatorBuilder: (context, position) {
              return Divider(height: 1, indent: 1, color: Colors.grey);
            },
            itemBuilder: (context, item) {
              return ListTile(title: Text("$item"));
            },
            itemCount: 50),
      ),
    );
  }

  Widget _demo2() {
    return Center(
      child: NotificationListener<ScrollEndNotification>(
        onNotification: (f) {
          print(f);
          return;
        },
        child: ListView.separated(
            separatorBuilder: (context, position) {
              return Divider(height: 1, indent: 1, color: Colors.grey);
            },
            itemBuilder: (context, item) {
              return ListTile(title: Text("$item"));
            },
            itemCount: 50),
      ),
    );
  }
}
