import 'mammal.dart';

class Feline extends Mammal {
  bool hasClause = true;

  void grow() => print("Growing");

  @override
  void test() {
    print("Testing in feline");
    super.test();
  }
}
