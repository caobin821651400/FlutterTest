import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClipPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("clip裁剪"),
      ),
      body: content(),
    );
  }
}

Widget content() {
  Widget avatar = Image.asset("assets/images/icon_5.webp", width: 60);

  return Center(
    child: Column(
      children: <Widget>[
        avatar,
        ClipOval(child: avatar),
        ClipRRect(
          //圆角矩阵
          borderRadius: BorderRadius.circular(5),
          child: avatar,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              widthFactor: .5,
              child: avatar,
            ),
            Text("你好世界", style: TextStyle(color: Colors.green),)
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ClipRect(
              child: Align(
                alignment: Alignment.topLeft,
                widthFactor: .5,//实际宽度=60*.5
                child: avatar,
              ),
            ),
            Text("你好世界", style: TextStyle(color: Colors.green),)
          ],
        ),
        DecoratedBox(
          decoration: BoxDecoration(color: Colors.red),
          child: ClipRect(
            clipper: MyClipper(),
            child: avatar,
          ),
        )
      ],
    ),
  );
}

class MyClipper extends CustomClipper<Rect>{
  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(10.0, 15.0, 40.0, 30.0);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return false;
  }
}
