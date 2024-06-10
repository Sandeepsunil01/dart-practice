import 'employee.dart';

// If you are using implemnets you have to use all the function/variables used in Employee
// Differnece between inherite and implement is
// 1. Inherite you have to inherite all the properties.
// 2. Implement you have to implement by your self from ground up
class Manager implements Employee {
  String name = "Bob";

  void test() {
    print("Printing in Manage");
  }
}
