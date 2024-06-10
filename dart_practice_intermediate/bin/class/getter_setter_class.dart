class GetterSetter {
  String _name = "";
  int _age = 0;

  GetterSetter(String name, int age) {
    _name = name;
    _age = age;
  }

  String get name => _name;
  int get age => _age;

  set name(String value) => _name = value;
  set age(int value) => _age = value * 7;
}
