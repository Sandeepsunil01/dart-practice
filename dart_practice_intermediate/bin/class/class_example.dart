class ClassExample {
  String _name = "";

  // Animal() {
  //   print('Constructed');
  //   _name = "Sunil";
  // }

  ClassExample(String name) {
    _name = name;
  }

  void sayHello() {
    if (_name.isEmpty) {
      print("Hello");
    } else {
      print("Hello $_name nice to meet you");
    }
  }

  // anything with _ is called private varible, It cannot be accessed outside class
}
