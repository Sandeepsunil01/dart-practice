class ThisKeyword {
  int age = 1;
  String name = "fiddo";

  ThisKeyword(int age, String name) {
    // age = age;
    // name = name;
    this.age = age;
    this.name = name;
  }

  int ageInDogYears() => age * 7;
}
