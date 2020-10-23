import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AysnUiPage extends StatefulWidget {
  @override
  _AysnUiPageState createState() => _AysnUiPageState();
}

class _AysnUiPageState extends State<AysnUiPage> {
  @override
  Widget build(BuildContext context) {
    return demo2();
  }
}

Future<String> aysnData() async {
  return Future.delayed(Duration(seconds: 2), () => "我是从互联网上获取的数据");
}
///适用于网络请求
demo1() {
  return Scaffold(
    appBar: AppBar(
      title: Text("异步加载"),
    ),
    body: Center(
      child: FutureBuilder<String>(
        future: aysnData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              //失败
              return Text("请求失败 ${snapshot.error}");
            } else {
              return Text("请求成功 ${snapshot.data}");
            }
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    ),
  );
}

Stream<int> counter() {
  return Stream.periodic(Duration(seconds: 1), (i) {
    return i;
  });
}
///上传下载
demo2() {
  return Scaffold(
    appBar: AppBar(
      title: Text("异步加载"),
    ),
    body: Center(
      child: StreamBuilder<int>(
        stream: counter(),
        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
          if (snapshot.hasError) return Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Text('没有Stream');
            case ConnectionState.waiting:
              return Text('等待数据...');
            case ConnectionState.active:
              return Text('active: ${snapshot.data}');
            case ConnectionState.done:
              return Text('Stream已关闭');
          }
          return null; // unreachable
        },
      ),
    ),
  );
}
