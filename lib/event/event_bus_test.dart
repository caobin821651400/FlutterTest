import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app2/utils/event_bus.dart';

class IEventBus extends StatefulWidget {
  @override
  _IEventBusState createState() => _IEventBusState();
}

class _IEventBusState extends State<IEventBus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("eventbus")),
      body: Center(
        child: RaisedButton(
          child: Text("改变首页的标题"),
          onPressed: () {
            XEventBus.emit("test", "事件总线");
          },
        ),
      ),
    );
  }
}
