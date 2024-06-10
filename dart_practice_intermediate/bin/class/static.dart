class Static {
  // int _counter = 0;
  // Changing to static increments the value;
  static int _counter = 0;
  // On omiting static each class will have _counter as its own varibale

  Static() {
    _counter++;
    print("There are $_counter of us");
  }

  // Want to access a funtion at the class level we would add it as static
  static void run() {
    print("Running");
  }

  
}
