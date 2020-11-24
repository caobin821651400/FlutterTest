import 'package:flutter/cupertino.dart';

class ScaleAnimRoute extends StatefulWidget {
  @override
  _ScaleAnimRouteState createState() => _ScaleAnimRouteState();
}

//需要继承TickerProvider，如果有多个AnimationController，则应该使用TickerProviderStateMixin。
class _ScaleAnimRouteState extends State<ScaleAnimRoute> with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(duration: const Duration(seconds: 3), vsync: this);
    //使用弹性动画
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInBack);
    //图片宽高从0到300
    _animation = Tween(begin: 0.0, end: 300.0).animate(_controller);
    //启动动画
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimWidget(
      animation: _animation,
    );
  }
}

/// 集成AnimatedWidget
class AnimWidget extends AnimatedWidget {
  AnimWidget({Key key, Animation<double> animation}) : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Center(
      child: Image.asset(
        "assets/images/icon_5.webp",
        width: animation.value,
        height: animation.value,
      ),
    );
  }
}
