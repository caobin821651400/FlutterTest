import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditPage extends StatefulWidget {
  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  TextEditingController _controller = TextEditingController();

  FocusNode _focusNode1 = FocusNode();
  FocusNode _focusNode2 = FocusNode();
  FocusScopeNode focusScopeNode;

  @override
  void initState() {
    _controller.addListener(() {
      print(_controller.text);
      print("焦点 ${_focusNode2.hasFocus}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("输入框"),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            autofocus: true,
            focusNode: _focusNode1,
            decoration: InputDecoration(
              labelText: "姓名",
              hintText: "请输入姓名",
              prefixIcon: Icon(Icons.person),
            ),
          ),
          TextField(
            autofocus: true,
            controller: _controller,
            focusNode: _focusNode2,
            obscureText: true,
            decoration: InputDecoration(
              labelText: "密码",
              hintText: "请输入密码",
              prefixIcon: Icon(Icons.lock),
            ),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: "请输入用户名",
              border: InputBorder.none, //隐藏下划线
              prefixIcon: Icon(Icons.person),
              // // 未获得焦点下划线设为灰色
              // enabledBorder: UnderlineInputBorder(
              //   borderSide: BorderSide(color: Colors.blue),
              // ),
              // //获得焦点下划线设为蓝色
              // focusedBorder: UnderlineInputBorder(
              //   borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              //   borderSide: BorderSide(color: Colors.red),
              // ),
            ),
          ),
          _buildTextField(context),
          Builder(
            builder: (context) {
              return Column(
                children: <Widget>[
                  RaisedButton(
                    child: Text("移动焦点"),
                    onPressed: () {
                      FocusScope.of(context).requestFocus(_focusNode2);
                    },
                  ),
                  RaisedButton(
                    child: Text("隐藏键盘"),
                    onPressed: () {
                      _focusNode1.unfocus();
                      _focusNode2.unfocus();
                    },
                  )
                ],
              );
            },
          )
        ],
      ),
    );
  }
}

Container _buildTextField(BuildContext context) {
  return Container(
      width: 300,
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10),
          hintText: "请输入0...",
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red), gapPadding: 100.0),
        ),
      ));
}
