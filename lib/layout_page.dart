import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LayoutPage extends StatefulWidget {
  @override
  _LayoutPageState createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("布局的用法"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "hello ",
                style: TextStyle(color: Colors.red),
              ),
              Text("i am joker")
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            //如果为MainAxisSize.min, 则次属性无效
            children: <Widget>[
              Text(
                "hello ",
                style: TextStyle(color: Colors.orange),
              ),
              Text("i am joker")
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max, //min相当于自适应 max填充满
            //表示纵轴对其方式,Row中子Widget高度不一
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment(0, 0),
                //居中，类似坐标轴
                height: 50,
                width: 50,
                color: Colors.yellow,
                child: Text(
                  "hello ",
                  style: TextStyle(color: Colors.deepOrangeAccent),
                ),
              ),
              Container(
                  // height: 10,
                  padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                  color: Colors.blueAccent,
                  child: Text("i am joker"))
            ],
          ),
          Row(
            ///表示子view的方向
            textDirection: TextDirection.rtl, //ltr left to right的意思
            mainAxisAlignment: MainAxisAlignment.start, //从哪里开始  中国一般是左到右
            children: <Widget>[
              Text(
                "123 ",
                style: TextStyle(color: Colors.green),
              ),
              Text("木头人")
            ],
          ),
          Row(
            //从 起点开始 跟verticalDirection有关系
            crossAxisAlignment: CrossAxisAlignment.start,
            //方向 从下到上
            verticalDirection: VerticalDirection.up,
            children: <Widget>[
              Text("hello ",
                  style:
                      TextStyle(fontSize: 30, color: Colors.deepOrangeAccent)),
              Text("i am joker")
            ],
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              // alignment: Alignment.center,
              // constraints: BoxConstraints(maxHeight: 100,maxWidth: 100),
              color: Colors.indigo,
              // width: 200,
              // height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[Text("123"), Text("代办数量代办数量")],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
