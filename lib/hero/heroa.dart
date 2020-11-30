import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app2/utils/event_bus.dart';

class HeroAPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("共享动画A")),
      body: Container(
          alignment: Alignment.topCenter,
          margin: EdgeInsets.only(top: 10),
          child: InkWell(
            child: Hero(
              tag: "avatar",
              child: ClipOval(
                child: Image.asset(
                  ximg,
                  width: 50.0,
                ),
              ),
            ),
            onTap: () {
              //打开新的路由
              Navigator.push(context, PageRouteBuilder(pageBuilder: (BuildContext context, Animation animation, Animation secondsAnimation) {
                return FadeTransition(
                  opacity: animation,
                  child: Scaffold(
                    appBar: AppBar(title: Text("共享动画B")),
                    body: HeroBPage(),
                  ),
                );
              }));
            },
          )),
    );
  }
}

class HeroBPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("转场成功"),
         Padding(
           padding: EdgeInsets.only(top: 10),
           child:  Hero(
             tag: "avatar",
             child: Image.asset(ximg),
           ),
         )
        ],
      ),
    );
  }
}
