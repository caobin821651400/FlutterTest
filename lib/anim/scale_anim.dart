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
    //图片宽高从0到300
    _animation = Tween(begin: 0.0, end: 300.0).animate(_controller);

    //使用弹性动画
    // _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInBack);

    //使用自定义动画
    _animation.addStatusListener((status) {
      switch (status) {
        case AnimationStatus.completed:
          //结束时反向在执行一次
          print("AnimationStatus.completed");
          _controller.reverse();
          break;
        case AnimationStatus.dismissed:
          //动画在起始点停止
          print("AnimationStatus.dismissed");
          _controller.forward();
          break;
        case AnimationStatus.forward:
          //动画在正向执行
          print("AnimationStatus.forward");
          break;
        case AnimationStatus.reverse:
          //动画在反向执行
          print("AnimationStatus.reverse");
          break;
      }
    });

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
    // return AnimWidget(
    //   animation: _animation,
    // );
    ///第二种 通过AnimatedBuilder实现
    ///通过这种方式只有重构AnimatedBuilder下面的Widget
    return AnimWidget2(
      animation: _animation,
      child: Image.asset("assets/images/icon_5.webp"),
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

class AnimWidget2 extends StatelessWidget {
  AnimWidget2({Key key, this.animation, this.child});

  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      child: child,
      builder: (BuildContext ctx, Widget child) {
        return Center(
          child: Container(
            alignment: Alignment.center,
            width: animation.value,
            height: animation.value,
            child: child,
          ),
        );
      },
    );
  }
}
