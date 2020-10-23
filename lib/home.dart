import 'package:flutter/material.dart';

import 'routes.dart';

List<Widget> _items = const <Widget>[
  const _HomeItem("展示一张图片", Colors.green, IMAGE_PAGE),
  const _HomeItem("SnackBar使用", Colors.lightBlue, SNACKBARPAGE),
  const _HomeItem("cupertino", Colors.amber, CUPERTINO_PAGE),
  const _HomeItem("状态A", Colors.brown, STATEA_PAGE),
  const _HomeItem("状态B", Colors.deepOrange, StatePageB_PAGE),
  const _HomeItem("文本", Colors.indigo, TEXT_PAGE),
  const _HomeItem("按钮", Colors.red, BUTTON_PAGE),
  const _HomeItem("switch开关", Colors.pink, SWITCHANDCHECKBOXTESTROUTE),
  const _HomeItem("输入框", Colors.purple, EDITPAGE),
  const _HomeItem("自动校验输入框", Colors.blue, FORMTESTROUTE),

  ///*****
  const _HomeItem("进度条", Colors.green, PROGRESSPAGE),
  const _HomeItem("布局用法", Colors.lightBlue, LAYOUTPAGE),
  const _HomeItem("弹性布局", Colors.amber, FLEXLAYOUTPAGE),
  const _HomeItem("流式布局", Colors.brown, FLOWLAYOUTPAGE),
  const _HomeItem("叠层布局", Colors.deepOrange, STACKLAYOUTPAGE),
  const _HomeItem("相对布局", Colors.indigo, ALIGNLAYOUTPAGE),
  const _HomeItem("尺寸限制", Colors.red, BOXPAGE),
  const _HomeItem("转换", Colors.pink, TRANSFORMPAGE),
  const _HomeItem("scaffold使用", Colors.purple, SCAFFOLDPAGE),
  const _HomeItem("clip剪裁", Colors.blue, CLIPPAGE),

  ///*****
  const _HomeItem("滑动布局", Colors.green, SCROLLPAGE),
  const _HomeItem("CustomScrollViewPage组合", Colors.lightBlue, CUSTOMSCROLLVIEWPAGE),
  const _HomeItem("功能型组件", Colors.amber, FUNCTIONPAGE),
  const _HomeItem("数据widget共享", Colors.brown, INHERITEDWIDGETTESTROUTE),
  const _HomeItem("购物车数据共享示例", Colors.deepOrange, PROVIDERPAGE),
  const _HomeItem("颜色相关", Colors.indigo, COLORPAGE),
  const _HomeItem("异步更新", Colors.red, AYSNUIPAGE),
];

///home 为Flutter应用的首页，它也是一个widget。
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Demo Home Page"),
        shadowColor: Colors.red,
      ),
      body: Scrollbar(
          child: ListView.builder(
        itemBuilder: (context, index) => _items[index],
        itemCount: _items.length,
      )),
    );
  }
}

class _HomeItem extends StatelessWidget {
  const _HomeItem(this.title, this.background, this.routeName);

  //背景色
  final Color background;
  final String routeName;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5, left: 10, right: 10),
      child: RaisedButton(
        onPressed: () {
          Navigator.of(context).pushNamed(routeName);
        },
        color: background,
        child: Text("$title", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}