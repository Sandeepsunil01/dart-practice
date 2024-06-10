import 'dart:io';

// Io is both synchronous and asynchronous
void main(List<String> arguments) {
  // fileSystem();
  // systemTempDirectory();
  // listItemsInDirectory();
  accessingFiles();
}

accessingFiles() {
  Directory directory = Directory.current;
  print(directory.path);

  File file = File("${directory.path}/text.txt");
  writeFile(file);
  readFile(file);
}

void writeFile(File file) {
  // Append write
  // Append with append the end of the file
  // Write will completely erase the file
  // Changing the append to write will replace the text inside txt file
  RandomAccessFile ref = file.openSync(mode: FileMode.write);
  ref.writeStringSync("Hello files\r\n How are you?");
  ref.flushSync();
  // Close sync internally calls flush sync
  ref.closeSync();
}

void readFile(File file) {
  if (!file.existsSync()) {
    print("File not found");
    return;
  }
  print("Reading string...");
  print(file.readAsStringSync());
  print("Reading bytes ....");
  List value = file.readAsBytesSync();
  value.forEach((item) {
    print(item);
  });
}

listItemsInDirectory() {
  Directory directory = Directory.current;
  print(directory.path);

  List<FileSystemEntity> list = directory.listSync(recursive: true);
  print(list.length);
  list.forEach((FileSystemEntity value) {
    // Stat has a special keyword it has some of the keyword
    // Where as value has many OS properties
    FileStat stat = value.statSync();
    print("Path == ${value.path}");
    print("Type == ${stat.type}");
    print("Changed == ${stat.changed}");
    print("Accessed == ${stat.accessed}");
    // Denotes system access to it
    print("Mode == ${stat.mode}");
    print("Size == ${stat.size}");
    print(" ");
  });
}

// If we dont delete this temp directly it creates a directory and stays until user cleans up disk space
systemTempDirectory() {
  // This is where temp directiry where system codes work
  Directory directory = Directory.systemTemp.createTempSync();
  print(directory.path);
  if (directory.existsSync()) {
    print("Exists");
    directory.deleteSync();
    print("Removing the directory");
  } else {
    print("Path Doesnt exists");
  }
}

fileSystem() {
  String path = "/";
  Directory directory = Directory(path);

  // wait and then run the remaining code
  if (directory.existsSync()) {
    print("Exists");
  } else {
    print("Not found");
  }
}
