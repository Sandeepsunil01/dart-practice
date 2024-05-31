import 'dart:collection';
import 'dart:io';

void main(List<String> arguments) {
  // boolean();
  // numbers();
  // strings();
  // constants();
  // userInput();
  // collections();
  // lists();
  // sets();
  // ques();
  // maps();
}

void maps() {
//   Map is a key value pair

//   Map<String, dynamic> people = {'dad': "sandeep", "son": "dk", "age": 24};

  Map<String, dynamic> people = <String, dynamic>{};

  people.putIfAbsent("dad", () => 'sandeep');
//   people.putIfAbsent("son", () => 'dk');
//   people.putIfAbsent("age", () => 24);

  print(people);
  print("Keys are ${people.keys}");
  print("Values are ${people.values}");
  print("Dad is ${people["dad"]}");
  print("Son is ${people["son"]}");
  print("Age is ${people["age"]}");
}

// Think of a Que as line
void ques() {
//   Ordered, no index add and remove from the start and end
  Queue<int> items = Queue<int>();

  items.add(1);
  items.add(2);
  items.add(3);
  items.removeFirst();
  items.removeLast();

  print(items);
}

// Similar to list but sets are unordered and do not contains duplicates
void sets() {
  Set<int> numbers = <int>{};
  numbers.add(1);
  numbers.add(2);
  numbers.add(2); //Added twice
  print(numbers);
}

void lists() {
  List test = [1, 2, 3, 4];
  print("Length == ${test.length}");
  print("First Item == ${test.first} Or ${test[0]}");

//   Element at //Whats at element 3
//   When there is no element at the given index then it goes out of range error
  print(test.elementAt(2));

//   General List
  List things = [];
  things.add(1);
  things.add("cats");
  things.add(true);

  print("Things List == $things");

//   Genric List
  List<int> numbers = <int>[];
  numbers.add(1);
  numbers.add(2);
//   On running below line we get String is not the subtype of type of int
//   numbers.add("cats");
  print(numbers);
}

// Enums/Enumarators Has to be declared outside a function/Class
enum Color { red, green, blue }

// Dart doesnt have the concept of Arrays thats why we use collections
void collections() {
  print(Color.values);
  print(Color.red);
}

void userInput() {
//   \r Referes to hard return
  stdout.write("What is your name?\r\n");
  String name = stdin.readLineSync() ?? "";

  name.isEmpty ? stderr.write("Name is Empty") : stdout.write("Hello $name");
}

void constants() {
  String hello = "hello";
  const String dart = "dart";

//   Cannot change the value
//   dart = "Dartpad";

  print('$hello $dart');
}

void strings() {
  String hello = "Hello Dart";
  print("hello Dart");
  print(hello);
  String name = "Sandeep DK";
  print("Hello $name");

//   SubString
  String firstName = name.substring(0, 7);
  print("First Name == $firstName");

//   Get the index of the String
  int index = name.indexOf(" ");
  String lastName = name.substring(index).trim();
  print("Last Name == $lastName");

//   Finding the length of
  print(name.length);

//   Contains
  print(name.contains('f'));

//   Create a List
  List parts = name.split(" ");
  print(parts);
  print(parts[0]);
  print(parts[1]);
}

void numbers() {
  num age = 34;
  // There are 2 types of numbers
//   Num aytomatically assigns wheather its a int or double

//   Int
  int people = 6;
  print("People == $people");

//   Double
  double temp = 32.06;
  print("Temperatue == $temp");

//   Pasrsing an int
  int parsedInt = int.parse('12');
  print(parsedInt);
// Trying for Error
  int error = int.tryParse('12.09') ?? 1;
  print('error = $error');

//   Math
  int dogYears = 7;
  num dogAge = age * dogYears;
  print('Your age in dog years is : $dogAge');
}

void boolean() {
  // This is for Boolean
  // In dart everything is a Object
  bool? isOne; // This is a Variable : Something that changes overtime
  print("isOne == $isOne");

  isOne = false;
  print("isOne == $isOne");

  isOne = true;
  print("isOne == $isOne");
}
