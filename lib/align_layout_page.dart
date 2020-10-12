import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlignLayoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("相对定位"),
      ),
      body: content(),
    );
  }
}

Widget content() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Container(
        height: 120,
        width: 120,
        color: Colors.blue[50],
        child: Align(
          widthFactor: 2,
          //它们是两个缩放因子，会分别乘以子元素的宽、高，最终的结果就是Align 组件的宽高。如果值为null，则组件的宽高将会占用尽可能多的空间。
          heightFactor: 2,
          // alignment: Alignment.centerLeft,//起点是中心点 (Alignment.x*childWidth/2+childWidth/2, Alignment.y*childHeight/2+childHeight/2)
          alignment: FractionalOffset(0.1, 0.1),
          //起点是左上角，实际偏移 = (FractionalOffse.x * childWidth, FractionalOffse.y * childHeight)
          child: FlutterLogo(
            size: 40,
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 20),
        color: Colors.red,
        //我们可以认为Center组件其实是对齐方式确定（Alignment.center）了
        child: Center(
          widthFactor: 2,
          heightFactor: 2,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
            child: Text("123124"),
          ),
        ),
      )
    ],
  );
}
