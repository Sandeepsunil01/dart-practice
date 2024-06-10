import 'class/inheritance/feline.dart';
import 'class/mixins/monster.dart';
import 'class/interfaces/manager.dart';
import 'class/abstract/race_car.dart';

// Polymorphism -> When same code behaves differently

void main(List<String> arguments) {
  // inheritance();
  // mixinExample();
  // interfaceExample();
  abstractExample();
}

// Abstract class
abstractExample() {
  RaceCar raceCar = RaceCar();
  raceCar.horn();
}

// Constract between 2 classes
interfaceExample() {
  Manager bob = Manager();
  bob.test();
}

// Line any other language we cannot simply inherite multipel classes ",". So we use a mixin
mixinExample() {
  Monster ugly = Monster();
  ugly.test();
}

// Extend keyword lets access to the different classes
inheritance() {
  Feline cat = Feline();
  cat.breath();
  cat.test();
}
