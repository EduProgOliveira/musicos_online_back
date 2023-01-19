typedef InstanceGenerator<T> = T Function();

class DependencyInjector {
  DependencyInjector._();
  static final _singleton = DependencyInjector._();

  factory DependencyInjector() => _singleton;

  final _instanceMap = <Type, _InstanceGenerator<Object>>{};

  void register<T extends Object>(InstanceGenerator<T> instance,
      {bool isSingleton = true}) {
    _instanceMap[T] = _InstanceGenerator(instance, isSingleton);
  }

  T get<T extends Object>() {
    final instance = _instanceMap[T]?.getInstance();
    if (instance != null && instance is T) return instance;
    throw Exception('[ERROR] -> Instance ${T.toString()} not found');
  }
}

class _InstanceGenerator<T> {
  T? _instance;
  bool _isFirstGet = false;

  final InstanceGenerator<T> _instanceGenerator;
  _InstanceGenerator(this._instanceGenerator, bool isSingleton)
      : _isFirstGet = isSingleton;

  T? getInstance() {
    if (_isFirstGet) {
      _instance = _instanceGenerator();
      _isFirstGet = false;
    }
    return _instance ?? _instanceGenerator();
  }
}
