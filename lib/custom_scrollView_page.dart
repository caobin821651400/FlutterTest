import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomScrollViewPage extends StatelessWidget {
  final _data = <Color>[
    Colors.purple[50],
    Colors.purple[100],
    Colors.purple[200],
    Colors.purple[300],
    Colors.purple[400],
    Colors.purple[500],
    Colors.purple[600],
    Colors.purple[700],
    Colors.purple[800],
    Colors.purple[900],

    Colors.red[50],
    Colors.red[100],
    Colors.red[200],
    Colors.red[300],
    Colors.red[400],
    Colors.red[500],
    Colors.red[600],
    Colors.red[700],
    Colors.red[800],
    Colors.red[900],
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomScrollView(
        anchor: 0,
        scrollDirection: Axis.vertical,
        reverse: false,
        slivers: <Widget>[_buildAppBar(), _buildSliverFixedExtentList()],
      ),
    );
  }

  Widget _buildSliverFixedExtentList() => SliverFixedExtentList(
        itemExtent: 50,
        delegate: SliverChildBuilderDelegate((_, index) {
          return Container(
            alignment: Alignment.center,
            width: 100,
            height: 50,
            color: _data[index],
            child: Text(
              colorString(_data[index]),
              style: TextStyle(color: Colors.white, shadows: [Shadow(color: Colors.black, offset: Offset(.5, .5), blurRadius: 2)]),
            ),
          );
        }, childCount: _data.length),
      );

  String colorString(Color color) => "#${color.value.toRadixString(16).padLeft(8, '0').toUpperCase()}";

  ///
  _buildAppBar() {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 190, //展开高度
      // leading: Container(
      //     margin: EdgeInsets.all(10),
      //     child: ClipOval(
      //       child: Image.asset(
      //         "assets/images/icon_5.webp",
      //         fit: BoxFit.cover,
      //       ),
      //     )),
      flexibleSpace: FlexibleSpaceBar(
        //伸展处布局
        titlePadding: EdgeInsets.only(left: 55, bottom: 15), //标题边距
        collapseMode: CollapseMode.parallax,
        title: Container(
          color: Colors.red,
          child: Text("123"),
        ),
        // title: Text(
        //   "CustomScrollView",
        //   style: TextStyle(color: Colors.white, shadows: [Shadow(color: Colors.blue, offset: Offset(1, 1), blurRadius: 2)]),
        // ),
        background: Image.asset("assets/images/monkey.webp",fit: BoxFit.cover,),
      ),
    );
  }
}
