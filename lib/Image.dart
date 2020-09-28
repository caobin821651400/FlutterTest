import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            '展示一张图界面',
            style: TextStyle(
              fontSize: 22.0,
            ),
          ),
        ),
        body: Column(
          // child: Image(
          //   image: AssetImage("assets/images/icon_5.webp"),
          //   width: 100.0,
          //   height: 100.0,
          // ),
          // child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage("assets/images/icon_5.webp"),
                width: 130.0,
                height: 130.0,
              ),
              Image(
                image: NetworkImage(
                  "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                ),
                width: 230.0,
                height: 130.0,
                //居中截取
                fit: BoxFit.cover,
                color: Colors.amberAccent,
                //着色模式
                colorBlendMode: BlendMode.colorBurn,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.access_alarm,
                    color: Colors.amberAccent,
                  ),
                  Icon(
                    Icons.cached,
                    color: Colors.green,
                  ),
                  Icon(
                    Icons.send,
                    color: Colors.teal,
                  ),
                ],
              )
            ],
          // ),
        ));
  }
}
