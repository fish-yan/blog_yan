typedef void EventCallback(arg);

class FYEventBus {
  FYEventBus._internal();

  static FYEventBus _singlenton = FYEventBus._internal();

  factory FYEventBus() => _singlenton;

  Map _emap = new Map<Object, List<EventCallback>>();

  void on(eventName, EventCallback callback) {
    if (eventName == null || callback == null) return;
    _emap[eventName] ??= new List.empty();
    _emap[eventName].add(callback);
  }

  void off(eventName, [EventCallback? callback]) {
    var list = _emap[eventName];
    if (eventName == null || list == null) return;
    if (callback == null) {
      _emap[eventName] = null;
    } else {
      list.remove(callback);
    }
  }

  void emit(eventName, [arg]) {
    List<EventCallback> list = _emap[eventName];
    if (list == null) return;
    list.reversed.forEach((element) { 
      element(arg);
    });
  }
}

var bus = FYEventBus();