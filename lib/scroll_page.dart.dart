import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScrollPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("滑动"),
      ),
      body: LoadMoreListView(),
    );
  }
}

///普通的ListView
Widget createListView() {
  return Scrollbar(
    child: ListView.separated(
      physics: BouncingScrollPhysics(),
      itemCount: 100,
      // itemExtent: 50,
      separatorBuilder: (context, index) {
        return Divider(color: Colors.grey, indent: 10, endIndent: 10);
      },
      itemBuilder: (context, index) {
        return ListTile(
          title: Text("$index"),
        );
      },
    ),
  );
}

///加载更多的ListView
class LoadMoreListView extends StatefulWidget {
  @override
  _LoadMoreListViewState createState() => _LoadMoreListViewState();
}

class _LoadMoreListViewState extends State<LoadMoreListView> {
  static const loadingTxt = "努力加载中...";
  var _words = <String>[loadingTxt];

  @override
  void initState() {
    super.initState();
    _retrieveData();
  }

  ///模拟一次加载20条数据
  void _retrieveData() {
    print("位置：${_words.length - 1}");

    Future.delayed(Duration(seconds: 2)).then((value) => {
          setState(() {
            _words.insertAll(
                _words.length - 1,
                generateWordPairs()
                    .take(20)
                    .map((e) => e.asPascalCase)
                    .toList());
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: _words.length,
      physics: BouncingScrollPhysics(),
      separatorBuilder: (context, index) => Divider(
        color: Colors.grey,
      ),
      itemBuilder: (context, index) {
        //如果到了表尾
        if (_words[index] == loadingTxt) {
          //不足100条，继续获取数据
          if (_words.length - 1 < 100) {
            _retrieveData();
            return Container(
              padding: EdgeInsets.all(16),
              alignment: Alignment.center,
              child: SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              ),
            );
          } else {
            //已经加载了100条
            return Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(16),
              child: Text("没有更多了", style: TextStyle(color: Colors.grey)),
            );
          }
        }
        //显示单词列表项
        return ListTile(title: Text("${_words[index]}"));
      },
    );
  }
}

///类似android的ScrollView
Widget createScrollView() {
  return Scrollbar(
    child: SingleChildScrollView(
      physics: BouncingScrollPhysics(), //ios越界回弹效果
      // physics: ClampingScrollPhysics(),//android系统的越界阴影
      reverse: false, //是否反方向
      child: Column(
        children: <Widget>[
          Container(
            height: 500,
            color: Colors.red,
          ),
          Container(
            height: 500,
            color: Colors.blue,
          ),
          Container(
            height: 500,
            color: Colors.yellow,
          ),
          Container(
            height: 500,
            color: Colors.lightGreenAccent,
          ),
        ],
      ),
    ),
  );
}
