import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../toast.dart';

class EventPage extends StatefulWidget {
  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  PointerEvent _event;
  String _eventName = "event_name";
  double _top = 0.0; //距顶部的偏移
  double _left = 0.0; //距左边的偏移

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("事件处理"),
      ),
      body: _demo7(),
    );
  }

  Widget _demo1() {
    return Listener(
      child: Container(
        alignment: Alignment.center,
        color: Colors.blue,
        height: 200,
        width: double.infinity,
        child: Text(_event?.toString() ?? "", style: TextStyle(color: Colors.white, fontSize: 11)),
      ),
      onPointerDown: (event) => setState(() => _event = event),
      onPointerMove: (event) => setState(() => _event = event),
      onPointerUp: (event) => setState(() => _event = event),
    );
  }

  Widget _demo2() {
    return Listener(
        child: ConstrainedBox(
          constraints: BoxConstraints.tight(Size(300.0, 150.0)),
          child: Center(child: Text("Box A")),
        ),
        behavior: HitTestBehavior.opaque,
        onPointerDown: (event) => print("down A"));
  }

  Widget _demo3() {
    return Stack(
      children: <Widget>[
        Listener(
          child: ConstrainedBox(
            constraints: BoxConstraints.tight(Size(300.0, 200.0)),
            child: DecoratedBox(decoration: BoxDecoration(color: Colors.blue)),
          ),
          onPointerDown: (event) => print("down0"),
        ),
        Listener(
          child: ConstrainedBox(
            constraints: BoxConstraints.tight(Size(200.0, 100.0)),
            child: Center(child: Text("左上角200*100范围内非文本区域点击")),
          ),
          onPointerDown: (event) => print("down1"),
          behavior: HitTestBehavior.translucent, //放开此行注释后可以"点透",透明的地方两边都接受点击事件
        )
      ],
    );
  }

  Widget _demo4() {
    return Listener(
      child: Container(
        alignment: Alignment.center,
        color: Colors.blue,
        height: 200,
        width: double.infinity,
        child: Text("ContainerA"),
      ),
      onPointerDown: (event) => Toast.toast(context, "down A"),
    );
  }

  Widget _demo5() {
    return Listener(
      //IgnorePointer本身和子Widget都不接收事件
      //AbsorbPointer本身接收；子Widget不接收事件
      child: AbsorbPointer(
        child: Listener(
          child: Container(
            alignment: Alignment.center,
            color: Colors.blue,
            height: 200,
            width: double.infinity,
            child: Text("ContainerA"),
          ),
          onPointerDown: (event) => print("down A"),
        ),
      ),
      onPointerDown: (event) => print("down B"),
    );
  }

  Widget _demo6() {
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        color: Colors.blue,
        width: 200.0,
        height: 100.0,
        child: Text(
          _eventName,
          style: TextStyle(color: Colors.white),
        ),
      ),
      onTap: () => _updateText("onTap"),
      onDoubleTap: () => _updateText("onDoubleTap"),
      onLongPress: () => _updateText("onLongPress"),
    );
  }

  void _updateText(String text) {
    setState(() {
      _eventName = text;
    });
  }

  Widget _demo7() {
    return Stack(
      children: <Widget>[
        Positioned(
          top: _top,
          left: _left,
          child: GestureDetector(
            child: CircleAvatar(
              child: Text("A"),
            ),
            onPanDown: (e) {
              //手指按下位置，相对于屏幕
              print("用户手指按下：${e.globalPosition}");
            },
            onPanUpdate: (e) {
              //手指滑动回调此方法
              setState(() {
                _left += e.delta.dx;
                _top += e.delta.dy;
              });
            },
            onPanEnd: (e) {
              //打印滑动结束的时候在X Y轴上的速度
              print("速度= $e.velocity");
            },
          ),
        )
      ],
    );
  }
}
