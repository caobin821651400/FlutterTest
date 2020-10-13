import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlowLayoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return content();
  }
}

Widget content() {
  return Scaffold(
    appBar: AppBar(
      title: Text("流式布局"),
    ),
    body: Column(
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          child: Wrap(
            direction: Axis.horizontal,
            spacing: 10.0,
            //主轴方向子widget的间距
            runSpacing: 50.0,
            //纵轴方向的间距
            // runAlignment: WrapAlignment.start,//纵轴方向的对齐方式
            alignment: WrapAlignment.center,
            //主轴对齐方式
            children: <Widget>[
              Chip(
                avatar: CircleAvatar(
                  backgroundColor: Colors.blueAccent,
                  child: Text("A"),
                ),
                label: Text("张三"),
              ),
              new Chip(
                avatar: new CircleAvatar(
                    backgroundColor: Colors.blue, child: Text('M')),
                label: new Text('Lafayette'),
              ),
              new Chip(
                avatar: new CircleAvatar(
                    backgroundColor: Colors.blue, child: Text('H')),
                label: new Text('Mulligan'),
              ),
              new Chip(
                avatar: new CircleAvatar(
                    backgroundColor: Colors.blue, child: Text('J')),
                label: new Text('Laurens'),
              ),
            ],
          ),
        ),
        createFlow(),
      ],
    ),
  );
}

Widget createFlow() {
  return Flow(
    delegate: TestFlowDelegate(margin: EdgeInsets.all(10.0)),
    children: <Widget>[
       Container(
        width: 50.0,
        height: 50.0,
        color: Colors.red,
      ),
       Container(
        width: 50.0,
        height: 50.0,
        color: Colors.green,
      ),
       Container(
        width: 50.0,
        height: 50.0,
        color: Colors.blue,
      ),
       Container(
        width: 50.0,
        height: 50.0,
        color: Colors.yellow,
      ),
       Container(
        width: 50.0,
        height: 50.0,
        color: Colors.brown,
      ),
       Container(
        width: 50.0,
        height: 50.0,
        color: Colors.purple,
      ),
    ],
  );
}

class TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;

  TestFlowDelegate({this.margin});

  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    //计算每一个子widget的位置
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i).width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i,
            transform: new Matrix4.translationValues(x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i).height + margin.top + margin.bottom;
        //绘制子widget(有优化)
        context.paintChild(i,
            transform: new Matrix4.translationValues(x, y, 0.0));
        x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }

  @override
  getSize(BoxConstraints constraints) {
    //指定Flow的大小
    return Size(double.infinity, 200.0);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}
