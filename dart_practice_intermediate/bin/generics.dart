import 'class/generic/counter.dart';

void main(List<String> arguments) {
  // introduction();
  // examples();
  genericClass();
}

// generic Classes
genericClass() {
  Counter<double> doubles = Counter<double>();
  doubles.addAll([1, 2, 3, 4]);
  doubles.add(6);
  doubles.elemenAt(3);
  doubles.total();
}

// examples
examples() {
  List<num> values = [1, 2, 3, 4, 5];
  print(addList(0, values));
}

T addList<T extends num>(T value, List<T> items) {
  T setValue = value;
  items.forEach((value) {
    // setValue = setValue + value;
  });

  return setValue;
}

// More complex example
// We dont have any null check error in this example as we are extending num from the generic
void addNumbers<T extends num>(T a, T b) {
  print(a + b);
}

// Simple Example
// T is for generic type
// Not all data class can be compiled thats why its giving error
void add<T>(T a, T b) {
  // print(a + b);
  print(a);
}

// Same code can run different type depending on what we want to do
introduction() {
  List<int> number = [];
  number.addAll([1, 2, 3, 4]);
  print(number);

  // Above same example
  List<String> string = [];
  string.addAll(["a", "b", "c", "d"]);
  print(string);

  add<int>(4, 5);
  add<double>(3, 6);
  addNumbers<int>(5, 10);
  addNumbers<double>(2, 5);
  // This doent extend num so wont work
  // addNumbers<String>("Num1", "Num2");
}
