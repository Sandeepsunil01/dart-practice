void main() {
//   basicFunction();
//   sayHello("sandeep");
//   print("Your Age in DogYears is ${dogYears(20)}");
//   Paint Example
//   int wall1 = squareFeet(10, 10);
//   int wall2 = squareFeet(10, 20);
//   int wall3 = squareFeet(10, 10);
//   int wall4 = squareFeet(10, 20);
//   int ceiling = squareFeet(20, 10);
//   double paint = paintNeeded(wall1, wall2, wall3, wall4, ceiling);
//   print("You need Gallons of ${paint}");
//   optionalHello("Sandeep");
//   download("fileName.txt", true);
//   print("Footage == ${squareFeetNamed(width: 10, length: 20)}");
//   downloadNamed("myfile.txt", port: 35);

//   int age = 43;
//   var dogYears = calculateYears;
//   var catYears = calculateYears;

//   print("Dog Years == ${dogYears(age: age, multiplier: 7)}");
//   print("Cat Years == ${catYears(age: age, multiplier: 2)}");

//   anonmousFunction();
  practice(maxNumber: 10);
}

practice({required int maxNumber}) {
  for (int i = 1; i <= maxNumber; i++) {
    if (i == maxNumber / 2) {
      print("half way there");
    } else {
      print(i);
    }
  }
}

anonmousFunction() {
  //   Annonmous Function
//   This is called internal function function is valid still it doesnt print out hello
  () {
    print("Hello");
  };

  List people = ["sandeep", "dk", "sunil", 24];

//   Both are same
  people.forEach(print);
  print("------");
  people.forEach((name) {
    print(name);
  });
  print("------");
  people.where((name) {
    switch (name) {
      case 'sandeep':
        return true;
      case 'dk':
        return false;
      case 'sunil':
        return true;
      default:
        return false;
    }
  }).forEach(print);
}

// This is not recommended but still need to know
// Functions as Arguments/Objects
int calculateYears({required int age, required int multiplier}) {
  return age * multiplier;
}

// Positioned Argument
void downloadNamed(String file, {int port = 80}) {
  print("Download $file on port $port");
}

// Named Argument
int squareFeetNamed({required int width, required int length}) {
  return width * length;
}

// Optional Parametes
void download(String file, [bool open = false]) {
  print("Downloading $file");
  if (open) {
    print("Opening $file");
  }
}

// Optional Parameteres
void optionalHello([String name = ""]) {
  if (name.isNotEmpty) {
//     Gives one space in between hello and name
    name = name.padLeft(name.length + 1);
  }
  print("Hello$name");
}

double paintNeeded(int wall1, int wall2, int wall3, int wall4, int ceiling) {
  int footage = wall1 + wall2 + wall3 + wall4 + ceiling;
  return footage / 30;
}

int squareFeet(int width, int length) {
  return width * length;
}

int dogYears(int age) {
  return age * 7;
}

void sayHello(String name) {
  print("Hello $name");
}

void basicFunction() {
  print("Testing");
}
