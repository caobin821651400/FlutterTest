import 'package:flutter/material.dart';
import 'package:flutter_app2/ButtonPage.dart';
import 'package:flutter_app2/CupertinoPage.dart';
import 'package:flutter_app2/Image.dart';
import 'package:flutter_app2/ParamsRoute.dart';
import 'package:flutter_app2/Router.dart';
import 'package:flutter_app2/RouterNoResgister.dart';
import 'package:flutter_app2/StatePageA.dart';
import 'package:flutter_app2/StatePageB.dart';
import 'package:flutter_app2/SwitchAndCheckBoxTestRoute.dart';
import 'package:flutter_app2/TextPage.dart';
import 'package:flutter_app2/edit_page.dart';
import 'package:flutter_app2/layout_page.dart';
import 'package:flutter_app2/progress_page.dart';

import 'FormTestRoute.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());
const String ROUTE_PAGE = "route_page";
const String PARAMS_PAGE = "params_page";
const String IMAGE_PAGE = "image_page";
const String CUPERTINO_PAGE = "cupertino_page";
const String STATEA_PAGE = "statea_page";
const String StatePageB_PAGE = "statepageb_page";
const String TEXT_PAGE = "text_page";
const String BUTTON_PAGE = "button_page";
const String SWITCHANDCHECKBOXTESTROUTE = "switchandcheckboxtestroute";
const String EDITPAGE = "editpage";
const String FORMTESTROUTE = "formtestroute";
const String PROGRESSPAGE = "ProgressPage";
const String LAYOUTPAGE = "LayoutPage";

///MyApp类代表Flutter应用，它继承了 StatelessWidget类，这也就意味着应用本身也是一个widget。
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  ///Flutter在构建页面时，会调用组件的build方法，widget的主要工作是提供一个build()方法来描述如何构建UI界面（通常是通过组合、拼装其它基础widget）。
  @override
  Widget build(BuildContext context) {
    ///MaterialApp 是Material库中提供的Flutter APP框架，通过它可以设置应用的名称、主题、语言、首页及路由列表等。MaterialApp也是一个widget。
    return MaterialApp(
      routes: {
        ///路由注册表，必须要先注册后使用
        ROUTE_PAGE: (context) => NewRoute(),

        // PARAMS_PAGE: (context) => ParamsRoute(txt: "路由名称跳转"),
        PARAMS_PAGE: (context) {
          return ParamsRoute(txt: ModalRoute.of(context).settings.arguments);
        },
        IMAGE_PAGE: (context) => ImagePage(),
        CUPERTINO_PAGE: (context) => CupertinoPage(),
        STATEA_PAGE: (context) => StatePageA(),
        StatePageB_PAGE: (context) => StatePageB(),
        TEXT_PAGE: (context) => TextPage(),
        BUTTON_PAGE: (context) => ButtonPage(),
        SWITCHANDCHECKBOXTESTROUTE: (context) => SwitchAndCheckBoxTestRoute(),
        EDITPAGE: (context) => EditPage(),
        FORMTESTROUTE: (context) => FormTestRoute(),
        PROGRESSPAGE: (context) => ProgressPage(),
        LAYOUTPAGE: (context) => LayoutPage(),
      },
      initialRoute: "/",
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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

///home 为Flutter应用的首页，它也是一个widget。
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        shadowColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            FlatButton(
              child: Text('打开新的界面'),
              textColor: Colors.green,
              disabledTextColor: Colors.red,
              disabledColor: Colors.yellow,
              hoverColor: Colors.orange,
              highlightColor: Colors.purpleAccent,
              splashColor: Colors.deepPurple,
              color: Colors.teal,
              onPressed: centerBtnClick,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: main,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void main() {
    async1().then((value) {
      print("回调结果 $value");
    });
  }

  void centerBtnClick() {
    ///通过 MaterialPageRoute 跳转
    // Navigator.push(context, MaterialPageRoute(builder: (context) {
    //   return NewRoute();
    // }));

    ///通过注册的路由表跳转 注册表带参数
    // Navigator.pushNamed(context, ROUTE_PAGE);

    ///通过注册的路由表跳转 pushNamed 传参数
    // Navigator.of(context).pushNamed(PARAMS_PAGE, arguments: "arguments参数123");

    ///没有注册的路由
    // Navigator.of(context).pushNamed("no_register", arguments: "123");

    ///展示一张图片
    // Navigator.pushNamed(context,IMAGE_PAGE);

    ///SnackBar
    // Navigator.push(context, MaterialPageRoute(builder: (context) {
    //   return SnackBarPage();
    // }));

    ///cupertino
    // Navigator.pushNamed(context,CUPERTINO_PAGE);

    ///状态A
    // Navigator.pushNamed(context,STATEA_PAGE);

    ///状态B
    // Navigator.pushNamed(context,StatePageB_PAGE);

    ///文本
    // Navigator.pushNamed(context, TEXT_PAGE);

    ///按钮
    // Navigator.pushNamed(context, BUTTON_PAGE);

    ///switch
    // Navigator.pushNamed(context, SWITCHANDCHECKBOXTESTROUTE);

    ///输入框
    // Navigator.pushNamed(context, EDITPAGE);

    ///自动验证的输入框
    // Navigator.pushNamed(context, FORMTESTROUTE);

    ///进度条
    // Navigator.pushNamed(context, PROGRESSPAGE);

    ///布局用法
    Navigator.pushNamed(context, LAYOUTPAGE);
  }

  /// 异步方法1
  void future1() {
    Future.delayed(new Duration(seconds: 2), () {
      return "结果";
    }).then((value) => {print(value)});
  }

  /// 异步方法2
  void future2() {
    Future.delayed(new Duration(seconds: 2), () {
      // return "结果";
      return AssertionError("111");
    }).then((value) {
      print(value);
    }).catchError((e) {
      print(e);
    }).whenComplete(() {
      print("异步完成了");
    });
  }

  /// 等待 合并
  void future3() {
    var a = Future.delayed(new Duration(seconds: 5), () {
      return "111";
    });

    var b = Future.delayed(new Duration(seconds: 3), () {
      return "222";
    });

    Future.wait([a, b]).then((result) {
      print("${result[0]}   ${result[1]}");
    });
  }

  ///消除回调 同步的代码执行异步的操作 有点类似kotlin的协程Z
  Future<int> login() {
    int i = 0;
    return Future.delayed(new Duration(seconds: 5), () {
      return ++i;
    }).then((value) {
      return value;
    });
  }

  Future<String> getUserInfo(int id) {
    String ss = "getUserInfo value ";
    return Future.delayed(new Duration(seconds: 3), () {
      return "$ss $id";
    }).then((value) {
      return value;
    });
  }

  Future<bool> saveUserInfo(String data) {
    return Future.delayed(new Duration(seconds: 2), () {
      print("保存成功");
    }).then((value) {
      return true;
    });
  }

  ///模拟一个 登陆-> 获取用户信息-> 保存用户信息的异步过程 代码是同步的
  ///async 表示函数式异步的，定义的函数会返回一个Future对象，可以使用then回调函数
  ///await 后面是一个Future，表示等待该异步任务完成，异步完成后才会往下走；await必须出现在 async 函数内部。
  ///只要有一个Future执行失败，就会触发错误回调
  Future<bool> async1() async {
    int id = await login();
    print("id= $id");
    String data = await getUserInfo(id);
    print("data= $data");
    return await saveUserInfo(data);
  }
}
