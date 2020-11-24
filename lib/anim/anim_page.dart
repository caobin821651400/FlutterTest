import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app2/anim/scale_anim.dart';

class AnimPage extends StatefulWidget {
  @override
  _AnimPageState createState() => _AnimPageState();
}

class _AnimPageState extends State<AnimPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("动画")),
      body: _demo1(),
    );
  }

  Widget _demo1() {
    return ScaleAnimRoute();
  }
}
