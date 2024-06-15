import 'dart:async';
import 'dart:io';

int counter = 0;

void main(List<String> arguments) {
  // asynchronousCallbacks();
  // futures();
  asynAndAwaitExample();
}

asynAndAwaitExample() async {
  print("Starting");
  File file = await appendFile();
  print("Appended to file ${file.path}");
  print("*** End");
}

Future<File> appendFile() async {
  File file = File("${Directory.current.path}test.txt");
  DateTime dateTime = DateTime.now();
  return file.writeAsString("$dateTime\r\n", mode: FileMode.append);
}

futures() {
  String path = "${Directory.current.path}test.txt";
  print("Appending to $path");
  File file = File(path);

  Future<RandomAccessFile> rdf = file.open(mode: FileMode.append);
  rdf.then((RandomAccessFile rf) {
    print("File has been opened");

    rf
        .writeString("Hello file ")
        .then((value) {
          print("File has been appended");
        })
        .catchError(() => print("Error"))
        .whenComplete(() => rf.close());
  });

  print("******** Process Ended");
}

// asynchrons callbacks examples
asynchronousCallbacks() {
  Duration duration = Duration(seconds: 1);
  Timer timer = Timer.periodic(duration, timeOut);
  print("Started ${getTime()}");
}

void timeOut(Timer timer) {
  print('Timer: ${getTime()}');
  counter++;
  if (counter >= 5) {
    timer.cancel();
  }
}

// Timers and Callback
String getTime() {
  DateTime dateTime = DateTime.now();
  return dateTime.toString();
}
