import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatePageA extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _StateAPageA();
}

class _StateAPageA extends State<StatePageA> {
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      // onTap: _handleTap,
      onLongPress: _handleTap,

      ///创建个容器 container
      child: new Container(
        width: 220.0,
        height: 220.0,
        decoration: new BoxDecoration(
            color: _active ? Colors.amberAccent : Colors.purple),
        child: new Center(
          child: new Text(
            _active ? 'Active' : 'Inactive',
            style: new TextStyle(fontSize: 30.0, color: Colors.orange),
          ),
        ),
      ),
    );
  }
}
