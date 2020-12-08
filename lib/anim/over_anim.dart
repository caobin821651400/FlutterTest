import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OverAnimPage extends StatefulWidget {
  @override
  _OverAnimPageState createState() => _OverAnimPageState();
}

class _OverAnimPageState extends State<OverAnimPage> {
  Color _decorationColor = Colors.blue;
  var duration = Duration(seconds: 1);
  bool isRed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("过度动画")),

        ///手动实现
        // body: AnimatedDecoratedBox1(
        //   duration: duration,
        //   decoration: BoxDecoration(color: _decorationColor),
        //   child: FlatButton(
        //     onPressed: () {
        //       setState(() {
        //         if (!isRed)
        //           _decorationColor = Colors.red;
        //         else
        //           _decorationColor = Colors.blue;
        //         isRed = !isRed;
        //       });
        //     },
        //     child: Text(
        //       "AnimatedDecoratedBox",
        //       style: TextStyle(color: Colors.white),
        //     ),
        //   ),
        // ),

        ///内置框架
        body: Center(
          child: AnimatedDecoratedBox2(
            decoration: BoxDecoration(color: _decorationColor),
            duration: Duration(milliseconds: _decorationColor == Colors.blue ? 400 : 2000),
            child: Builder(
              builder: (context) {
                return FlatButton(
                  onPressed: () {
                    setState(() {
                      _decorationColor = _decorationColor == Colors.blue ? Colors.red : Colors.blue;
                    });
                  },
                  child: Text(
                    "AnimatedDecoratedBox toggle",
                    style: TextStyle(color: Colors.white),
                  ),
                );
              },
            ),
          ),
        ));
  }
}

class AnimatedDecoratedBox1 extends StatefulWidget {
  final BoxDecoration decoration;
  final Widget child;
  final Duration duration;
  final Curve curve;
  final Duration reverseDuraion;

  const AnimatedDecoratedBox1({Key key, @required this.decoration, @required this.duration, this.curve, this.reverseDuraion, this.child});

  @override
  _AnimatedDecoratedBox1State createState() => _AnimatedDecoratedBox1State();
}

class _AnimatedDecoratedBox1State extends State<AnimatedDecoratedBox1> with SingleTickerProviderStateMixin {
  @protected
  AnimationController get controller => _controller;

  AnimationController _controller;

  Animation<double> _animation;

  Animation<double> get animation => _animation;

  DecorationTween _decorationTween;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: widget.duration, reverseDuration: widget.reverseDuraion, vsync: this);

    _decorationTween = DecorationTween(begin: widget.decoration);

    _updateCurve();
  }

  void _updateCurve() {
    if (widget.curve != null)
      _animation = CurvedAnimation(parent: _controller, curve: widget.curve);
    else
      _animation = _controller;
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  void didUpdateWidget(AnimatedDecoratedBox1 oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.curve != oldWidget.curve) {
      _updateCurve();
    }

    _controller.duration = widget.duration;

    _controller.reverseDuration = widget.reverseDuraion;

    if (widget.decoration != (_decorationTween.end ?? _decorationTween.begin)) {
      _decorationTween
        ..begin = _decorationTween.evaluate(_animation)
        ..end = widget.decoration;

      _controller
        ..value = 0.0
        ..forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return _body();
  }

  Widget _body() {
    return Center(
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return DecoratedBox(
            decoration: _decorationTween.animate(_animation).value,
            child: child,
          );
        },
        child: widget.child,
      ),
    );
  }
}

class AnimatedDecoratedBox2 extends ImplicitlyAnimatedWidget {
  final BoxDecoration decoration;
  final Widget child;

  AnimatedDecoratedBox2(
      {Key key,
      @required this.decoration,
      this.child,
      Curve curve = Curves.linear, //动画曲线
      @required Duration duration,
      Decoration reverseDuration})
      : super(key: key, curve: curve, duration: duration);

  @override
  ImplicitlyAnimatedWidgetState<ImplicitlyAnimatedWidget> createState() {
    return _AnimatedDecoratedBoxState();
  }
}

class _AnimatedDecoratedBoxState extends AnimatedWidgetBaseState<AnimatedDecoratedBox2> {
  DecorationTween _decorationTween;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: _decorationTween.evaluate(animation),
      child: widget.child,
    );
  }

  @override
  void forEachTween(visitor) {
    _decorationTween = visitor(_decorationTween, widget.decoration, (value) => DecorationTween(begin: value));
  }
}
