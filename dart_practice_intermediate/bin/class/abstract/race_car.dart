import 'car.dart';

class RaceCar extends Car {
  RaceCar() {
    hasHorn = true;
    hasWheels = true;
  }

  // @override
  // void horn() {
  //   print("Printing from Racing Car");
  // }

// Doesnt have implementation but its a Abstract function
  @override
  void horn() {
    print("Honk in Racing Car");
    super.horn();
  }

  // but as a normal class we can give a implementaion for horn function in Car class
}
