import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShareWidget extends InheritedWidget {
  const ShareWidget({
    this.data,
    this.str,
    @required Widget child,
  })  : assert(child != null),
        super(child: child);

  final int data; //需要在子树中共享的数据，保存点击次数
  final String str; //需要在子树中共享的数据，保存点击次数

  //定义一个便捷方法，方便子树中的widget获取共享数据
  static ShareWidget of(BuildContext context) {
    //dependOnInheritedWidgetOfExactType可以共享数据
    // return context.dependOnInheritedWidgetOfExactType<ShareWidget>();
    //下面这种不能共享数据
    return context.getElementForInheritedWidgetOfExactType<ShareWidget>().widget;
  }

  //该回调决定当data发生变化时，是否通知子树中依赖data的Widget
  @override
  bool updateShouldNotify(ShareWidget old) {
    //如果返回true，则子树中依赖(build函数中有调用)本widget
    //的子widget的`state.didChangeDependencies`会被调用
    return old.data != data;
  }
}

class _TestWidget extends StatefulWidget {
  @override
  __TestWidgetState createState() => new __TestWidgetState();
}

class __TestWidgetState extends State<_TestWidget> {
  @override
  Widget build(BuildContext context) {
    //使用InheritedWidget中的共享数据
    // return Text(ShareWidget.of(context).data.toString());
    return Text("546");

  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //父或祖先widget中的InheritedWidget改变(updateShouldNotify返回true)时会被调用。
    //如果build中没有依赖InheritedWidget，则此回调不会被调用。
    print("Dependencies change->>${ShareWidget.of(context).str}");
  }
}

class InheritedWidgetTestRoute extends StatefulWidget {
  @override
  _InheritedWidgetTestRouteState createState() => new _InheritedWidgetTestRouteState();
}

class _InheritedWidgetTestRouteState extends State<InheritedWidgetTestRoute> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ShareWidget(
          //使用ShareDataWidget
          data: count,
          str: "${count.ceilToDouble()}",
          child: Scaffold(
            appBar: AppBar(
              title: Text("数据共享"),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: _TestWidget(), //子widget中依赖ShareDataWidget
                  ),
                  RaisedButton(
                    child: Text("Increment"),
                    //每点击一次，将count自增，然后重新build,ShareDataWidget的data将被更新
                    onPressed: () => setState(() => ++count),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
