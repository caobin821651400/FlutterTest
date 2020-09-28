import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatePageB extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _StatePageB();
}

class _StatePageB extends State<StatePageB> {
  bool _active = false;

  void _handleTap(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new ChildC(
        active: _active,
        onChanged: _handleTap,
      ),
    );
  }
}

///父Widget管理状态
class ChildB extends StatelessWidget {
  ChildB({Key key, this.active: false, this.onChanged}) : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  void _handle() {
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handle,
      child: new Container(
        child: new Center(
          child: new Text(
            active ? "active" : "inactive",
            style: new TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration:
            new BoxDecoration(color: active ? Colors.purple : Colors.blue),
      ),
    );
  }
}

///父Widget管理状态
class ChildC extends StatefulWidget {
  ChildC({Key key, this.active: false, this.onChanged}) : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  @override
  State<StatefulWidget> createState() => new ChildCState();
}

class ChildCState extends State<ChildC> {
  bool _highlight = false;

  void _handleTab() {
    widget.onChanged(!widget.active);
  }

  void _handleUp(TapUpDetails details) {
    setState(() {
      _highlight = true;
    });
  }

  void _handleDown(TapDownDetails details) {
    setState(() {
      _highlight = false;
    });
  }

  void _handleCancel() {
    setState(() {
      _highlight = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTapDown: _handleDown,
      onTapCancel: _handleCancel,
      onTapUp: _handleUp,
      onTap: _handleTab,
      child: new Container(
        width: 200.0,
        height: 200.0,
        child: new Container(
          child: new Center(
            child: new Text(widget.active ? 'Active' : 'Inactive',
                style: new TextStyle(fontSize: 32.0, color: Colors.white)),
          ),
        ),
        decoration: new BoxDecoration(
            color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
            border: _highlight
                ? new Border.all(
                    color: Colors.teal[700],
                    width: 10.0,
                  )
                : null),
      ),
    );
  }
}
