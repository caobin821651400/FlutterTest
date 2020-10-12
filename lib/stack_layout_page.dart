
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StackLayoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("堆叠布局"),
      ),
      body: content(),
    );
  }
}

Widget content() {
  return ConstrainedBox(
    constraints: BoxConstraints.expand(),
    child: Stack(
      alignment: Alignment.center, //用来给未指定位置的widget的对其方式
      fit: StackFit.expand,//此参数用于确定没有定位的子组件如何去适应Stack的大小。StackFit.loose表示使用子组件的大小，StackFit.expand表示扩伸到Stack的大小。
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.all(10.0),
          // padding: EdgeInsets.only(left: 10, right: 10),
          child: Text(
            "123木头人",
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.red,
        ),
        Positioned(
          width: 100,
          left: 10,
          top: 10,
          child: Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            color: Colors.blue,
            child: Text("哈哈哈"),
          ),
        ),
        Positioned(
          right: 10,
          bottom: 10,
          child: Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            color: Colors.amberAccent,
            child: Text("哈哈哈"),
          ),
        )
      ],
    ),
  );
}
