import 'dart:convert';
import 'dart:io';

void main(List<String> arguments) {
  // osVaraibles();
  // runningProcesses();
  communicateWithTheProcess();
}

communicateWithTheProcess() {
  Process.start("cat", []).then((Process process) {
    // Transform the output
    process.stdout.transform(utf8.decoder).listen((data) => print(data));

    // Send data to the process
    process.stdin.writeln("Hello Files");

    // Stop the process
    process.kill();

    // Exit code
    process.exitCode.then((int code) {
      print("Exit code : $code");

      // Exit
      exit(0);
    });
  });
}

// Process is Copy of a executable running in memory
// Arguments are sending along with program
runningProcesses() {
  Process.run("ls", ["-l"]).then((ProcessResult result) {
    //dont want to send arguments then send [""]
    print(result.stdout);
    print("Exit Code: ${result.exitCode}"); //O is everything went good
  });
}

osVaraibles() {
  print("OS: ${Platform.operatingSystem}");
  print("Version: ${Platform.version}");

  // Platform Specific Code
  if (Platform.isWindows) {
    print("This is a Windows OS");
  } else {
    print("This is a code for normal OS");
  }
  // To get current path of the opened file
  print("Path: ${Platform.script.path}");
  print("Dart Path: ${Platform.executable}");

  Platform.environment.keys.forEach((key) {
    print("ENV: ${Platform.environment[key]}");
  });
}
