import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BoxPage extends StatelessWidget {
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
      ConstrainedBox(
        // constraints: BoxConstraints(
        //   minWidth: double.infinity,//尽可能的大
        //   minHeight: 100,
        // ),
        // constraints: BoxConstraints.expand(width: 100, height: 100.0),
        constraints: BoxConstraints.tight(Size(100, 200)),
        // child: FractionallySizedBox(),//可以根据父容器宽高的百分比来设置子组件宽高
        child: Container(
          height: 50, //这里的设置就没有用了
          color: Colors.red,
          child: Text(
            "12123",
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            // maxLines: 7,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 30, left: 30),
        decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: [Colors.red, Colors.orange[700]]), //渐变
            borderRadius: BorderRadius.circular(5.0),
            boxShadow: [
              BoxShadow(
                  color: Colors.green,
                  offset: Offset(0.0, 0.0), //阴影的偏移
                  blurRadius: 4.0),//阴影的范围
            ]),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 18.0),
          child: Text(
            "Login",
            style: TextStyle(color: Colors.white),
          ),
        ),
      )
    ],
  );
}
