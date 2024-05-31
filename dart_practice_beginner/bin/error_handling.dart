void main() {
//   Error is a program failure
//   Exemptions can be handled
//   functionName();
//   usingTryCatch();
  throwErrors();
}

throwErrors() {
  try {
    int age;
    int dogYears = 7;

//     Throw custom exception
    if (dogYears != 7) throw Exception("Doy years must be 7");

    if (age == null) throw Null;

    print(age * dogYears);
  } on Null {
    print("The value of age in not defined");
  } on NoSuchMethodError {
    print("Sorry no such method");
  } catch (e) {
    print("Unknown Error -${e.toString()}");
  } finally {
    print("Completed");
  }
}

usingTryCatch() {
  try {
    int age;
    int dogYears = 7;
    print(age * dogYears);
//     Catching specific Errors
  } on NoSuchMethodError {
    print("Thats not going to happen");
  } catch (e) {
    print("Error --- ${e.toString()}");
  } finally {
    print("Finished");
  }
}

functionName() {
  int age;
  int dogYears = 7;

  print(age * dogYears);
}
