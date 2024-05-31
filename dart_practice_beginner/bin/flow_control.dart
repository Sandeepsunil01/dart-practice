void main() {
//   assertion();
//   ifElseCondition();
//   scope();
//   switches();
//   doWhileLoop();
//   forLoop();
  practice();
}

practice() {
  for (int i = 0; i < 10; i++) {
    if (i == 5) {
      print("You are half way ther");
    } else {
      print("Number = $i");
    }
  }
}

// Initial Value, range and then incremnet/decrement
void forLoop() {
  List people = ["sandeep", "DK", "Sunil"];

  print(people);

  for (int i = 0; i < people.length; i++) {
    print("Person at $i is ${people[i]}");
  }

//   The only problem in this we dont have index
  people.forEach((person) {
    print(person);
  });
}

void doWhileLoop() {
  int value;
  int init = 1;
  int max = 5;

  value = init;

//   First runs and then evaluates
//   Atleast run once then use do while
  do {
    print("Value in do loop is $value");
    value++;
  } while (value <= max);

  print("Done with do loop");

  value = init;

//   Evaluates and then runs the value
//   Want to evalualate and then run use while
  while (value <= max) {
    print("Value in while loop is $value");
    value++;
  }
  print("Dont with while loop");

//   Infinite loop
//   If i dont add conditions for continue and break then the program runs infinitely
  value = init;

  do {
    print("Value = $value");
    value++;
    if (value == 3) {
      print("Value is 3");
      continue;
    }

    if (value > 5) {
      print("Value is greater than 5");
      break;
    }
  } while (true);

  print("Completed Infinite Loop");
}

// Cannot use conditions on cases this is used when we have specific values
void switches() {
  int age = 21;

  switch (age) {
    case 18:
      print("You are minor");
      break;

    case 21:
      print("You are Adult");
      break;

    case 65:
      print("You are Senior");
      break;

    default:
      print("Nothing special about this age");
      break;
  }

  print("Finished");
}

// Scope is just a bubble where a variable live in
void scope() {
  int age = 45;
  if (age == 43) {
//     print("You are 43 and hass bills ${hasBills}");
//     Has bills not declared in above scope
  } else {
    bool hasBills = true;
    print("You are $age and has bills $hasBills");
  }
}

void ifElseCondition() {
  int age = 43;
  if (age == 43) {
    print("Your age is 43 years");
  }
  if (age != 43) {
    print("Your age is not 43 years");
  }

  if (age < 18) {
    print("You are a minor");
    if (age < 13) {
      print("You are not even a teenager");
    }
  }

  if (age > 65) {
    print("You are a senior citizen");
    if (age > 102) {
      print("You are lucky to be alive");
    }
  }

  if (age == 21) {
    print("Congragulation to your special year");
  } else {
    print("This is just a normal year");
    if (age < 18) {
      print("You are a minor");
    } else {
      print("You are an adult");
    }
  }
}

// Used to validated
void assertion() {
  print("Starting");
  int age = 35;
  assert(age == 34);
//   Gets failed assertion
//   This is similar to throwing error
  print("Finished");
}