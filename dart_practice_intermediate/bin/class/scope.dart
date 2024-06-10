class ScopeClass {
  String name = "SCOPE is very tricky";

  ScopeClass(String name) {
    // String name = "hello";
    name = name;
    print(this.name);
  }
}
