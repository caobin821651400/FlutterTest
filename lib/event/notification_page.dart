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
      body: MyNotificationPage(),
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

class MyNotification extends Notification {
  final String msg;

  MyNotification(this.msg);
}

class MyNotificationPage extends StatefulWidget {
  @override
  _MyNotificationPageState createState() => _MyNotificationPageState();
}

class _MyNotificationPageState extends State<MyNotificationPage> {
  String _msg = "";

  @override
  Widget build(BuildContext context) {
    return NotificationListener<MyNotification>(
      onNotification: (notification) {
        print("收到通知 ${notification.msg}");
        return false;
      },
      child: NotificationListener<MyNotification>(
        onNotification: (notification) {
          setState(() {
            _msg += notification.msg + "  ";
          });
          //如果这里返回true了 上面的onNotification就收不到通知
          return false;
        },
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(_msg),
              Builder(
                builder: (context) {
                  return RaisedButton(
                    onPressed: () => {
                      //分发入口
                      MyNotification("hi ").dispatch(context)
                    },
                    child: Text("发送通知"),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
