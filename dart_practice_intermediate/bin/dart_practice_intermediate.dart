import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart' as http;

// Inbackgrund dart is converting this function to a class and its called in memory
// Code reuser
void main(List<String> arguments) {
  // myCode.sayHello();
  // convertFunction();
  downloadWebPage();
}

downloadWebPage() {
  Uri url = Uri.parse('https://google.com');

// Synchronous and Asynorous
// Synchronous is One at a Time
// Asynchronous is many at a time

// The below call is Asynchronous - we send a request and wait for it to return result
  http.get(url).then((response) {
    print("Response status == ${response.statusCode}");
    print("Response Body == ${response.body}");
  });
}

convertFunction() {
  String value = 'Hello Dart';

  // Encode
  List<int> ebytes = utf8.encode(value);
  String encoded = base64.encode(ebytes);
  print("Encoded == $encoded");

  // Decode
  List<int> dbytes = base64.decode(encoded);
  String decoded = utf8.decode(dbytes);
  print("Decoded == $decoded");
}
