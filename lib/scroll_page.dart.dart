import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ScrollPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: createCustomScrollView(),
    );
  }
}

///适用于多布局嵌套 ListView横向+ListView纵向
Widget createCustomScrollView() {
  return CustomScrollView(

    slivers: <Widget>[
      SliverAppBar(
        pinned: true,
        expandedHeight: 250,
        flexibleSpace: FlexibleSpaceBar(
          // title: Text("header"),
          background: Image.asset(
            "assets/images/icon_5.webp",
            fit: BoxFit.cover,
          ),
        ),
      ),
      SliverPadding(
        padding: EdgeInsets.all(8),
        sliver: SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 4,
          ),
          delegate: SliverChildBuilderDelegate((context, index) {
            return Container(
              alignment: Alignment.center,
              color: Colors.cyan[100 * (index % 9)],
              child: new Text('grid item $index'),
            );
          }, childCount: 20),
        ),
      ),
      SliverFixedExtentList(
        itemExtent: 50,
        delegate: SliverChildBuilderDelegate((context, index) {
          return new Container(
            alignment: Alignment.center,
            color: Colors.lightBlue[100 * (index % 9)],
            child: new Text('list item $index'),
          );
        }, childCount: 50),
      )
    ],
  );
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
            _words.insertAll(_words.length - 1, generateWordPairs().take(20).map((e) => e.asPascalCase).toList());
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(title: Text("商品列表")),
        Expanded(
          child: ListView.separated(
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
          ),
        ),
      ],
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

///GridView1
Widget createGridView() {
  return GridView(
    physics: BouncingScrollPhysics(),
    scrollDirection: Axis.vertical, //方向 默认vertical
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, //横轴三个，三列
        childAspectRatio: 1, //宽:高= ,默认是1:1
        crossAxisSpacing: 10, //主轴垂直方向间距
        mainAxisSpacing: 5 //主轴间距
        ),
    children: <Widget>[
      Container(alignment: Alignment.center, color: Colors.red, child: Text("1")),
      Container(alignment: Alignment.center, color: Colors.blue, child: Text("2")),
      Container(alignment: Alignment.center, color: Colors.orange, child: Text("3")),
      Container(alignment: Alignment.center, color: Colors.yellow, child: Text("4")),
      Container(alignment: Alignment.center, color: Colors.lightGreenAccent, child: Text("5")),
      Container(alignment: Alignment.center, color: Colors.deepPurpleAccent, child: Text("6")),
    ],
  );
}

///GridView2 ;GridView.count跟上面代码效果一样
Widget createGridView2() {
  return GridView.count(
    physics: BouncingScrollPhysics(),
    scrollDirection: Axis.vertical,
    //方向 默认vertical
    crossAxisCount: 3,
    //横轴三个，三列
    childAspectRatio: 1,
    //宽:高= ,默认是1:1
    crossAxisSpacing: 10,
    //主轴垂直方向间距
    mainAxisSpacing: 5,
    //,主轴间距
    children: <Widget>[
      Container(alignment: Alignment.center, color: Colors.red, child: Text("1")),
      Container(alignment: Alignment.center, color: Colors.blue, child: Text("2")),
      Container(alignment: Alignment.center, color: Colors.orange, child: Text("3")),
      Container(alignment: Alignment.center, color: Colors.yellow, child: Text("4")),
      Container(alignment: Alignment.center, color: Colors.lightGreenAccent, child: Text("5")),
      Container(alignment: Alignment.center, color: Colors.deepPurpleAccent, child: Text("6")),
    ],
  );
}

///GridView3
Widget createGridView3() {
  return GridView(
    physics: BouncingScrollPhysics(),
    scrollDirection: Axis.vertical, //方向 默认vertical
    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 50.0, //限制子view最大长度,每个view的长度还是等分的
        childAspectRatio: 2.0, //宽高比为2
        crossAxisSpacing: 8,
        mainAxisSpacing: 8),
    children: <Widget>[
      Container(alignment: Alignment.center, color: Colors.red, child: Text("1")),
      Container(alignment: Alignment.center, color: Colors.blue, child: Text("2")),
      Container(alignment: Alignment.center, color: Colors.orange, child: Text("3")),
      Container(alignment: Alignment.center, color: Colors.yellow, child: Text("4")),
      Container(alignment: Alignment.center, color: Colors.lightGreenAccent, child: Text("5")),
      Container(alignment: Alignment.center, color: Colors.deepPurpleAccent, child: Text("6")),
      Container(alignment: Alignment.center, color: Colors.red, child: Text("1")),
      Container(alignment: Alignment.center, color: Colors.blue, child: Text("2")),
      Container(alignment: Alignment.center, color: Colors.orange, child: Text("3")),
      Container(alignment: Alignment.center, color: Colors.yellow, child: Text("4")),
      Container(alignment: Alignment.center, color: Colors.lightGreenAccent, child: Text("5")),
      Container(alignment: Alignment.center, color: Colors.deepPurpleAccent, child: Text("6")),
    ],
  );
}

///GridView4 GridView.extent跟上面代码效果一样
Widget createGridView4() {
  return GridView.extent(
    physics: BouncingScrollPhysics(),
    scrollDirection: Axis.vertical,
    //方向 默认vertical
    maxCrossAxisExtent: 50.0,
    //限制子view最大长度,每个view的长度还是等分的
    childAspectRatio: 1.0,
    //宽高比为2
    crossAxisSpacing: 8,
    mainAxisSpacing: 8,
    children: <Widget>[
      Container(alignment: Alignment.center, color: Colors.red, child: Text("1")),
      Container(alignment: Alignment.center, color: Colors.blue, child: Text("2")),
      Container(alignment: Alignment.center, color: Colors.orange, child: Text("3")),
      Container(alignment: Alignment.center, color: Colors.yellow, child: Text("4")),
      Container(alignment: Alignment.center, color: Colors.lightGreenAccent, child: Text("5")),
      Container(alignment: Alignment.center, color: Colors.deepPurpleAccent, child: Text("6")),
      Container(alignment: Alignment.center, color: Colors.red, child: Text("1")),
      Container(alignment: Alignment.center, color: Colors.blue, child: Text("2")),
      Container(alignment: Alignment.center, color: Colors.orange, child: Text("3")),
      Container(alignment: Alignment.center, color: Colors.yellow, child: Text("4")),
      Container(alignment: Alignment.center, color: Colors.lightGreenAccent, child: Text("5")),
      Container(alignment: Alignment.center, color: Colors.deepPurpleAccent, child: Text("6")),
    ],
  );
}

///GridView5
class GridView5 extends StatefulWidget {
  @override
  _GridView5State createState() => _GridView5State();
}

class _GridView5State extends State<GridView5> {
  List<String> _icons = []; //保存Icon数据

  @override
  void initState() {
    super.initState();
    _retrieveIcons();
  }

  //模拟异步获取数据
  void _retrieveIcons() {
    Future.delayed(Duration(milliseconds: 200)).then((e) {
      setState(() {
        for (int i = 0; i < 20; i++) {
          _icons.add("第${i + 1}");
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: BouncingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1,
      ),
      itemCount: _icons.length,
      itemBuilder: (context, index) {
        if (index == _icons.length - 1 && index < 200) {
          _retrieveIcons();
        }
        return Container(alignment: Alignment.center, color: index % 2 == 0 ? Colors.blue : Colors.red, child: Text(_icons[index]));
      },
    );
  }
}

Widget createMultipleGridView() {
  return StaggeredGridView.countBuilder(
    physics: BouncingScrollPhysics(),
    crossAxisCount: 4,
    itemCount: 8,
    itemBuilder: (BuildContext context, int index) => new Container(
        color: Colors.green,
        child: new Center(
          child: new CircleAvatar(
            backgroundColor: Colors.white,
            child: new Text('$index'),
          ),
        )),
    staggeredTileBuilder: (int index) => new StaggeredTile.count(2, index.isEven ? 3 : 1),
    // new StaggeredTile.count(1, 4),
    mainAxisSpacing: 4.0,
    crossAxisSpacing: 4.0,
  );
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
List<StaggeredTile> _staggeredTiles = const <StaggeredTile>[
  const StaggeredTile.count(4, 4),
  const StaggeredTile.count(4, 2),
  const StaggeredTile.count(2, 4),
  const StaggeredTile.count(2, 2),
  const StaggeredTile.count(4, 4),
  const StaggeredTile.count(2, 4),
  const StaggeredTile.count(2, 2),
  const StaggeredTile.count(6, 2),
  const StaggeredTile.count(2, 2),
  const StaggeredTile.count(8, 2),
];

List<Widget> _tiles = const <Widget>[
  const _Example01Tile(Colors.green, 0),
  const _Example01Tile(Colors.lightBlue, 1),
  const _Example01Tile(Colors.amber, 2),
  const _Example01Tile(Colors.brown, 3),
  const _Example01Tile(Colors.deepOrange, 4),
  const _Example01Tile(Colors.indigo, 5),
  const _Example01Tile(Colors.red, 6),
  const _Example01Tile(Colors.pink, 7),
  const _Example01Tile(Colors.purple, 8),
  const _Example01Tile(Colors.blue, 9),
];

Widget createMultipleGridView2() {
  return new Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: new StaggeredGridView.count(
        crossAxisCount: 8,
        staggeredTiles: _staggeredTiles,
        children: _tiles,
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        padding: const EdgeInsets.all(4.0),
      ));
}

class _Example01Tile extends StatelessWidget {
  const _Example01Tile(this.backgroundColor, this.index);

  final Color backgroundColor;
  final int index;

  @override
  Widget build(BuildContext context) {
    return new Card(
      color: backgroundColor,
      child: new InkWell(
        onTap: () {},
        child: new Center(
          child: Text(
            "$index",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
