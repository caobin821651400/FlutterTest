import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransformPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BOX"),
      ),
      body: content(),
    );
  }
}

Widget content() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Container(
        width: double.infinity,
        height: 120,
        color: Colors.yellow,
        // margin: EdgeInsets.only(top: 50),
        alignment: Alignment.center,
        child: Container(
          color: Colors.blue,
          child: Transform(
            alignment: Alignment.topRight,
            transform: Matrix4.skewY(0.3),
            child: Container(
              padding: EdgeInsets.all(8.0),
              color: Colors.red,
              child: Text("Apartment for rent!"),
            ),
          ),
        ),
      ),

      ///Transform 注意使用Transform。xx的时候只会影响他的child，实际本身的大小并未改变
      ///Transform的变换是应用在绘制阶段，而并不是应用在布局(layout)阶段，所以无论对子组件应用何种变化，
      ///其占用空间的大小和在屏幕上的位置都是固定不变的，因为这些是在布局阶段就确定的。下面我们具体说明：
      Container(
        margin: EdgeInsets.only(top: 20, left: 30),
        decoration: BoxDecoration(color: Colors.red),
        //默认原点为左上角，左移20像素，向上平移5像素
        child: Transform.translate(
          offset: Offset(-20.0, -5.0),
          child: Text("Hello world"),
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 30, left: 30),
        child: DecoratedBox(
          decoration: BoxDecoration(color: Colors.red),
          child: Transform.rotate(
            angle: math.pi / 2,
            child: Text("哈哈哈哈"),
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 30, left: 30),
        child: DecoratedBox(
          decoration: BoxDecoration(color: Colors.orange),
          child: Transform.scale(
            scale: 1.5,
            child: Text("缩小"),
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 30, left: 30),
        color: Colors.green,
        child: RotatedBox(
          quarterTurns: 1, //顺时针旋转90°
          child: Text("旋转"),
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 30, left: 100),
        width: 100,
        height: 100,
        // color: Colors.blue, //与decoration不能共存
        decoration: BoxDecoration(
          gradient: RadialGradient(
              colors: [Colors.red, Colors.orange],
              center: Alignment.topLeft,
              radius: 0.98),
        ),
        transform: Matrix4.rotationZ(.2),
        // transform: Matrix4.translationValues(20, 10, 0),
        child: Text(
          "123",
          style: TextStyle(color: Colors.white),
        ),
        alignment: Alignment.center,
      )
    ],
  );
}
