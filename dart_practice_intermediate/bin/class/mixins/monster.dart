import '../inheritance/feline.dart';
import 'dragon.dart';
import 'ghost.dart';

class Monster extends Feline with Dragon, Ghost {
  bool glowInDark = true;

  @override
  void test() {
    print("Testing in monster Class");
    super.test();
  }
}
