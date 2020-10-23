import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemeTestRoute();
    // return CommonHeaderBar(
    //   title: "标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题",
    //   color: Colors.white,
    // );
  }
}

class CommonHeaderBar extends StatelessWidget {
  final String title;
  final Color color;

  const CommonHeaderBar({Key key, this.title, this.color}) : super(key: key); //背景颜色

  @override
  Widget build(BuildContext context) {
    return _body(context);
  }

  _body(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("颜色相关")),
      body: Container(
        height: 50,
        alignment: Alignment.center,
        constraints: BoxConstraints(minHeight: 50, minWidth: double.infinity),
        decoration: BoxDecoration(
          color: color,
          boxShadow: [BoxShadow(color: Colors.black26, offset: Offset(0, 3), blurRadius: 3)],
        ),
        child: Stack(
          alignment: Alignment.center, //未指定位置的子Widget居中
          fit: StackFit.expand,
          children: <Widget>[
            Positioned(
              left: 12,
              width: 60,
              child: RaisedButton(
                child: Text("返回"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 80),
              alignment: Alignment.center,
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: color.computeLuminance() < 0.5 ? Colors.white : Colors.black,
                ),
              ),
            ),
            Positioned(
              right: 0,
              child: IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ThemeTestRoute extends StatefulWidget {
  @override
  _ThemeTestRouteState createState() => _ThemeTestRouteState();
}

class _ThemeTestRouteState extends State<ThemeTestRoute> {
  Color _themeColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    return Theme(
      data: ThemeData(
          // primarySwatch: _themeColor, //只要颜色决定导航栏、等颜色
          primaryColor: _themeColor,
          iconTheme: IconThemeData(color: _themeColor)),
      child: Scaffold(
        appBar: AppBar(
          title: Text("主题"),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.change_history),
          onPressed: () {
            setState(() {
              _themeColor = _themeColor == Colors.teal ? Colors.blue : Colors.teal;
            });
          },
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //第一行Icon使用主题中的iconTheme
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[Icon(Icons.favorite), Icon(Icons.airport_shuttle), Text("  颜色跟随主题")]),
            //为第二行Icon自定义颜色（固定为黑色)
            Theme(
              data: themeData.copyWith(
                iconTheme: themeData.iconTheme.copyWith(color: Colors.black),
              ),
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[Icon(Icons.favorite), Icon(Icons.airport_shuttle), Text("  颜色固定黑色")]),
            ),
          ],
        ),
      ),
    );
  }
}
