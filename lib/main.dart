import 'package:flutter/material.dart';
import 'package:flutter_app2/RouterNoResgister.dart';

import 'routes.dart';

void main() => runApp(MyApp());

///MyApp类代表Flutter应用，它继承了 StatelessWidget类，这也就意味着应用本身也是一个widget。
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  ///Flutter在构建页面时，会调用组件的build方法，widget的主要工作是提供一个build()方法来描述如何构建UI界面（通常是通过组合、拼装其它基础widget）。
  @override
  Widget build(BuildContext context) {
    ///MaterialApp 是Material库中提供的Flutter APP框架，通过它可以设置应用的名称、主题、语言、首页及路由列表等。MaterialApp也是一个widget。
    return MaterialApp(
      title: 'Flutter Demo',
      //注册首页路由
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // ignore: missing_return
      onGenerateRoute: (RouteSettings settings) {
        ///注意，onGenerateRoute只会对命名路由生效  处理除home和routes以外的路由。
        String routeName = settings.name;
        print("name= $routeName");
        if (routeName == "no_register") {
          return MaterialPageRoute(builder: (context) {
            return NoRegisterRoute(txt: "123");
          });
        } else {}
      },
      routes: routes,
    );
  }
}
