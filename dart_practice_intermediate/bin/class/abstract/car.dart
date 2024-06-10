// Abstract class is like a Abstract Concept
// Its not a class but a concept
// Similar to interface but can inhert from it
abstract class Car {
  late bool hasWheels;
  late bool hasHorn;

// This is a abstract function without the implementation
  // void horn();

// This is with the implementation
// Using this we can access super varaibel in the RacingCar class
  void horn() {
    print("Printing from Horn Class");
  }
}
