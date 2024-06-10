import 'class/my_class.dart';
import 'class/class_example.dart';
import 'class/this_keyword.dart';
import 'class/employee.dart';
import 'class/scope.dart';
import 'class/public_private_scope.dart';
import 'class/getter_setter_class.dart';
import 'class/static.dart';

// Class is a blue print of objects with lifecycle
void main(List<String> arguments) {
  // basicClassUsage();
  // classConstructure();
  // thisKeyWord();
  // employeeClass();
  // scopeExample();
  // publicAndPrivateScope();
  // getterAndSetters();
  staticExample();
}

staticExample() {
  Static staticExample = Static();
  Static staticExample2 = Static();
  Static staticExample3 = Static();

  // Accessing functions on giving static keyword
  Static.run();
}

getterAndSetters() {
  GetterSetter getterSetter = GetterSetter("Sandeep", 24);
  print("Name and age = ${getterSetter.name} and ${getterSetter.age}"); //Getter
  getterSetter.name = "Sunil"; //Setter
  getterSetter.age = 3; //Setter
  print("Name and age = ${getterSetter.name} and ${getterSetter.age}"); //Getter
}

publicAndPrivateScope() {
  PublicAndPrivateScope publicAndPrivateScope =
      PublicAndPrivateScope("fluffy", 16, "Short hair");

// publicAndPrivateScope._name; //This doesnt work its called encapsulation
// publicAndPrivateScope._display('Hello'); //This shows that it doesnt have instance
  publicAndPrivateScope.saySomething("Hello");

// Modifying variable
  publicAndPrivateScope.breed = "mixed";
  publicAndPrivateScope.sayHelloScope();
}

// Dont use same variable names because it causes issues with the scope
scopeExample() {
  ScopeClass scopeClass = ScopeClass("Scope Example");

  for (int i = 0; i < 10; i++) {
    print(i);
    if (i < 8) {
      // int i = 5; //Valid but causes issues
      if (i > 4) {
        print("i is < 8 and > 4");
      }
    }
  }
}

employeeClass() {
  Employee employee = Employee("sandeep", "Software Engineer");
  print(employee.printResult());
}

thisKeyWord() {
  ThisKeyword bob = ThisKeyword(6, "Bob");
  print("${bob.name} is ${bob.ageInDogYears()} dog years old");
}

// Deconstructor
// Right before the class deleted on memory
// Dart doesnt allow us to do this
classConstructure() {
  ClassExample hello = ClassExample("Sandeep");
  ClassExample hello2 = ClassExample("Sunil");

  hello.sayHello();
  hello2.sayHello();
}
// After getting to this line then all the memroy is automatically deleted in dart in other language we have to manually delete this is called garbage collection

basicClassUsage() {
// Create a instance of clas
  MyClass myClass = MyClass();

  // Creating same class with different varibales
  MyClass class2 = MyClass();

// Dart has garbage collection in the background we never have to worry about the memory
  myClass.sayHello("Dart");
  class2.sayHello("Sandeep");
}
