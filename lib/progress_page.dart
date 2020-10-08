import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProgressPage extends StatefulWidget {
  @override
  _ProgressPageState createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage>
    with SingleTickerProviderStateMixin {
  int _progress = 0;
  AnimationController _container;
  Duration timeSpace = const Duration(seconds: 1);
  Timer _timer;

  @override
  void initState() {
    _container =
        new AnimationController(vsync: this, duration: Duration(seconds: 3));
    _container.forward();
    _container.addListener(
        () => setState(() => {print("value ${_container.value}")}));
    super.initState();
  }

  @override
  void dispose() {
    _container.dispose();
    _timer.cancel();
    super.dispose();
  }

  void change() {
    _timer = Timer.periodic(timeSpace, (timer) {
      print("进度 $_progress");
      setState(() {
        if (_progress > 10) {
          timer.cancel();
        }
        _progress++;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("进度条"),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: getLinearProgressIndicator(_progress.toDouble() / 10),
          ),
          getLinearProgressIndicator2(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: getCircularProgressIndicator(),
          ),
          getCircularProgressIndicator2(_progress.toDouble() / 10),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: getCircularProgressIndicator3(_progress.toDouble() / 10),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: getCircularProgressIndicator4(_container),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    child: Text("开始"),
                    onPressed: () {
                      change();
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

///渐变的进度条
Widget getCircularProgressIndicator4(AnimationController container) {
  return Padding(
    padding: EdgeInsets.all(16),
    child: LinearProgressIndicator(
      backgroundColor: Colors.grey[200],
      valueColor: ColorTween(begin: Colors.grey, end: Colors.green)
          .animate(container), // 从灰色变成蓝色
      value: container.value,
    ),
  );
}

///进度50%
LinearProgressIndicator getLinearProgressIndicator(double progress) {
  return LinearProgressIndicator(
    backgroundColor: Colors.blue,
    valueColor: AlwaysStoppedAnimation(Colors.red),
    value: progress,
  );
}

///无限循环的
LinearProgressIndicator getLinearProgressIndicator2() {
  return LinearProgressIndicator(
    backgroundColor: Colors.blue,
    valueColor: AlwaysStoppedAnimation(Colors.red),
    // value: .5,当value为null的时候则是无限循环的
  );
}

///圆形的
CircularProgressIndicator getCircularProgressIndicator() {
  return CircularProgressIndicator(
    backgroundColor: Colors.blue,
    valueColor: AlwaysStoppedAnimation(Colors.red),
    // value: .5,当value为null的时候则是无限循环的
    strokeWidth: 3.0,
  );
}

///圆形的
CircularProgressIndicator getCircularProgressIndicator2(double progress) {
  return CircularProgressIndicator(
    backgroundColor: Colors.grey,
    valueColor: AlwaysStoppedAnimation(Colors.red),
    value: progress,
    strokeWidth: 6.0,
  );
}

///指定尺寸
///圆形的
SizedBox getCircularProgressIndicator3(double progress) {
  return SizedBox(
    width: 100,
    height: 100,
    child: CircularProgressIndicator(
      backgroundColor: Colors.grey,
      valueColor: AlwaysStoppedAnimation(Colors.deepOrangeAccent),
      value: progress,
      strokeWidth: 2.0,
    ),
  );
}
