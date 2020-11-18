typedef void EventCallback(arg);

//定义一个 top-level全局的bus

var XEventBus = EventBus();

class EventBus {
  //私有构造函数
  EventBus._internal();

  ///单例
  static EventBus _singleton = new EventBus._internal();

  ///工厂构造函数
  factory EventBus() => _singleton;

  ///保存订阅者队列 key:id  value :事件队列
  var _emap = Map<Object, List<EventCallback>>();

  ///添加订阅者到队列
  void on(eventName, EventCallback f) {
    if (eventName == null || f == null) return;
    //判断不为空 add
    _emap[eventName] ??= List<EventCallback>();
    _emap[eventName].add(f);
  }

  ///移除订阅者
  void remove(eventName, [EventCallback f]) {
    if (eventName == null) return;
    var list = _emap[eventName];
    if (list == null || list.isEmpty) return;
    if (f == null) {
      _emap[eventName] = null;
    } else {
      list.remove(f);
    }
  }

  ///触发事件
  void emit(eventName, [arg]) {
    if (eventName == null) return;
    var list = _emap[eventName];
    if (list == null || list.isEmpty) return;
    int len = list.length - 1;
    //反向遍历，防止订阅者在回调中移除自身带来的下标错位
    for (var i = len; i > -1; --i) {
      list[i](arg);
    }
  }
}
