import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SnackBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("子树中获取State对象"),
      ),
      body: Center(
        child: Builder(
          builder: (context) {
            return RaisedButton(
              onPressed: () {
                // //获取state对象 Ancestor 安塞死特 Scaffold 死开服
                // ScaffoldState state = context.findAncestorStateOfType();
                // state.showSnackBar(SnackBar(
                //   content: Text("弹出来SnackBar"),
                // ));

                //****************第二种实现
                ScaffoldState state = Scaffold.of(context);
                state.showSnackBar(SnackBar(
                  content: Text("弹出来SnackBar"),
                ));
              },
              child: Text("show snackBar"),
            );
          },
        ),
      ),
    );
  }
}
