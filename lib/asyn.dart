

/// 异步方法1
void future1() {
  Future.delayed(new Duration(seconds: 2), () {
    return "结果";
  }).then((value) => {print(value)});
}

/// 异步方法2
void future2() {
  Future.delayed(new Duration(seconds: 2), () {
    // return "结果";
    return AssertionError("111");
  }).then((value) {
    print(value);
  }).catchError((e) {
    print(e);
  }).whenComplete(() {
    print("异步完成了");
  });
}

/// 等待 合并
void future3() {
  var a = Future.delayed(new Duration(seconds: 5), () {
    return "111";
  });

  var b = Future.delayed(new Duration(seconds: 3), () {
    return "222";
  });

  Future.wait([a, b]).then((result) {
    print("${result[0]}   ${result[1]}");
  });
}

///消除回调 同步的代码执行异步的操作 有点类似kotlin的协程Z
Future<int> login() {
  int i = 0;
  return Future.delayed(new Duration(seconds: 5), () {
    return ++i;
  }).then((value) {
    return value;
  });
}

Future<String> getUserInfo(int id) {
  String ss = "getUserInfo value ";
  return Future.delayed(new Duration(seconds: 3), () {
    return "$ss $id";
  }).then((value) {
    return value;
  });
}

Future<bool> saveUserInfo(String data) {
  return Future.delayed(new Duration(seconds: 2), () {
    print("保存成功");
  }).then((value) {
    return true;
  });
}

///模拟一个 登陆-> 获取用户信息-> 保存用户信息的异步过程 代码是同步的
///async 表示函数式异步的，定义的函数会返回一个Future对象，可以使用then回调函数
///await 后面是一个Future，表示等待该异步任务完成，异步完成后才会往下走；await必须出现在 async 函数内部。
///只要有一个Future执行失败，就会触发错误回调
Future<bool> async1() async {
  int id = await login();
  print("id= $id");
  String data = await getUserInfo(id);
  print("data= $data");
  return await saveUserInfo(data);
}