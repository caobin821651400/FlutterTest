import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScaffoldPage extends StatefulWidget {
  @override
  _ScaffoldPageState createState() => _ScaffoldPageState();
}

class _ScaffoldPageState extends State<ScaffoldPage>
    with SingleTickerProviderStateMixin {
  List tabs = ["新闻", "历史", "图片"];
  TabController _tabController;
  int _selectIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectIndex = index;
      print("$index");
    });
  }

  @override
  void initState() {
    super.initState();
    // 创建Controller
    _tabController = TabController(length: tabs.length, vsync: this);
    _tabController.addListener(() {
      // switch(_tabController.index)
      print("${_tabController.index}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        leading: createLeading(),
        bottom: createTabBar(_tabController, tabs),
        title: Text("Scaffold"),
        centerTitle: true,
        backgroundColor: Colors.red,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      drawer: MyDrawer(),
      bottomNavigationBar: createBottomBar2(_selectIndex, _onItemTapped),
      body: TabBarView(
        controller: _tabController,
        children: tabs.map((e) {
          return Container(
            alignment: Alignment.center,
            child: Text(
              e,
              textScaleFactor: 5,
            ),
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          print("FloatingActionButton Add");
        },
      ),
    );
  }
}

///创建底部导航栏2
BottomAppBar createBottomBar2(int selectIndex, Function(int) onItemTapped) {
  return BottomAppBar(
    color: Colors.white,
    shape: CircularNotchedRectangle(), // 底部导航栏打一个圆形的洞
    child: Row(
      children: [
        IconButton(icon: Icon(Icons.home)),
        SizedBox(), //中间位置空出
        IconButton(icon: Icon(Icons.business)),
      ],
      mainAxisAlignment: MainAxisAlignment.spaceAround, //均分底部导航栏横向空间
    ),
  );
}

///创建底部导航栏
BottomNavigationBar createBottomBar(
    int selectIndex, Function(int) onItemTapped) {
  return BottomNavigationBar(
    items: <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("首页")),
      BottomNavigationBarItem(icon: Icon(Icons.business), title: Text("商业")),
      BottomNavigationBarItem(icon: Icon(Icons.school), title: Text("学校")),
    ],
    currentIndex: selectIndex,
    fixedColor: Colors.blue,
    onTap: onItemTapped,
  );
}

///自定义抽屉栏的按钮图标
Widget createLeading() {
  return Builder(builder: (context) {
    return IconButton(
        icon: Icon(Icons.ac_unit),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        });
  });
}

///tabBar
TabBar createTabBar(TabController controller, List list) {
  return TabBar(
    labelColor: Colors.white,
    indicatorColor: Colors.green,
    controller: controller,
    tabs: list.map((e) => Tab(text: e)).toList(),
  );
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
          context: context,
          removeTop: true, //移除顶部菜单默认留白
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 38),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: ClipOval(
                        child: Image.asset(
                          "assets/images/icon_5.webp",
                          width: 80,
                        ),
                      ),
                    ),
                    Text("欢迎XXXX")
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    ListTile(
                      leading: const Icon(Icons.add),
                      title: Text("Add"),
                      onTap: () {
                        print("1111");
                      },
                      focusColor: Colors.green,
                    ),
                    ListTile(
                      leading: const Icon(Icons.settings),
                      title: Text("Settings"),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
