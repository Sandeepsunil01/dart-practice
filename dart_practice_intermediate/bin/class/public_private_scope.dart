class PublicAndPrivateScope {
  String _name = "";
  int _age = 0;
  String breed = "";

  // _ indicates the variables cannot be used outside on this class

  PublicAndPrivateScope(String name, int age, String breed) {
    this._name = name;
    _age = age;
    this.breed = breed;
  }

  void sayHelloScope() => print(
      "hello scope my name is $_name I am $_age Years old, and I am $breed ");

  void _display(String message) {
    print("Message $message");
  }

  void saySomething(String message) {
    _display(message);
  }
}
