import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShopItem {
  ShopItem(this.price, this.count);

  double price; //商品单价
  int count; // 商品份数

}

class CartModel extends ChangeNotifier {
  //用于保存购物车中的商品列表
  final List<ShopItem> _items = [];

  // 禁止改变购物车里的商品信息
  UnmodifiableListView<ShopItem> get items => UnmodifiableListView(_items);

  //获取总价 previousValue上一次操作的结果  0表示初始值
  double get totalPrice => _items.fold(0, (previousValue, element) => previousValue + element.count * element.price);

  ///添加到购物车
  void add(ShopItem item) {
    _items.add(item);
    //通知订阅者，重新构建InheritedProvider更新状态
    notifyListeners();
  }
}

class ProviderPage extends StatefulWidget {
  @override
  _ProviderPageState createState() => _ProviderPageState();
}

class _ProviderPageState extends State<ProviderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("购物车")),
      body: ChangeNotifierProvider<CartModel>(
        data: CartModel(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                XConsumer<CartModel>(
                    builder: (context, cart) {
                  return Text("总价${cart.totalPrice}");
                }),
                XConsumer<CartModel>(
                    boo: false,
                    builder: (context, cart) {
                      print("RaisedButton");
                      return RaisedButton(
                        child: Text("添加商品"),
                        onPressed: () {
                          cart.add(ShopItem(10, 1));
                        },
                      );
                    })
              ],
            )
          ],
        ),
      ),
    );
  }
}

class XConsumer<T> extends StatelessWidget {


  const XConsumer({Key key, this.builder, this.child, this.boo=true})
      : assert(builder != null),
        super(key: key);

  final bool boo;
  final Widget child;
  final Widget Function(BuildContext context, T value) builder;

  @override
  Widget build(BuildContext context) {
    return builder(context, ChangeNotifierProvider.of<T>(context, listen: boo));
  }
}

class ChangeNotifierProvider<T extends ChangeNotifier> extends StatefulWidget {
  ChangeNotifierProvider({
    Key key,
    this.data,
    this.child,
  });

  final Widget child;
  final T data;

  //定义一个便捷方法，方便子树中的widget获取共享数据
  static T of<T>(BuildContext context, {bool listen = true}) {
    final provider = listen
        ? context.dependOnInheritedWidgetOfExactType<InheritedProvider<T>>()
        : context.getElementForInheritedWidgetOfExactType<InheritedProvider<T>>()?.widget as InheritedProvider<T>;
    return provider.data;
  }

  @override
  _ChangeNotifierProviderState<T> createState() => _ChangeNotifierProviderState<T>();
}

// 一个通用的InheritedWidget，保存任需要跨组件共享的状态
class InheritedProvider<T> extends InheritedWidget {
  InheritedProvider({@required this.data, Widget child}) : super(child: child);

  //共享状态使用泛型
  final T data;

  @override
  bool updateShouldNotify(InheritedProvider<T> old) {
    //在此简单返回true，则每次更新都会调用依赖其的子孙节点的`didChangeDependencies`。
    return true;
  }
}

class _ChangeNotifierProviderState<T extends ChangeNotifier> extends State<ChangeNotifierProvider<T>> {
  void update() {
    //如果数据发生变化（model类调用了notifyListeners），重新构建InheritedProvider
    setState(() => {});
  }

  @override
  void didUpdateWidget(ChangeNotifierProvider<T> oldWidget) {
    //当Provider更新时，如果新旧数据不"=="，则解绑旧数据监听，同时添加新数据监听
    if (widget.data != oldWidget.data) {
      oldWidget.data.removeListener(update);
      widget.data.addListener(update);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    // 给model添加监听器
    widget.data.addListener(update);
    super.initState();
  }

  @override
  void dispose() {
    // 移除model的监听器
    widget.data.removeListener(update);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InheritedProvider<T>(
      data: widget.data,
      child: widget.child,
    );
  }
}
