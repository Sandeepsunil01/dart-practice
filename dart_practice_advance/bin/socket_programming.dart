import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main(List<String> arguments) {
  // tcpServer();
  // tcpClient();
  // httpGetRequest();
  // httpPostRequest();
  udpSockets();
}

// We are building a server and listening for the data
// It just sends the data out and hopes for the best as there is no 2 way connection
udpSockets() {
  var data = "Hello UDP";
  List<int> dataToSend = utf8.encode(data);
  // If there is no connection still they need port
  int port = 3000;

  // Server
  RawDatagramSocket.bind(InternetAddress.anyIPv4, port)
      .then((RawDatagramSocket udpSocket) {
    udpSocket.listen((RawSocketEvent event) {
      if (event == RawSocketEvent.read) {
        Datagram dg = udpSocket.receive()!;
        print(utf8.decode(dg.data));
      }
    });

    // Client
    udpSocket.send(dataToSend, InternetAddress.anyIPv4, port);
    print("Send");
  });
}

Future httpPostRequest() async {
  var url = "http://httpbin.org/post";
  var response =
      await http.post(Uri.parse(url), body: "name=Sandeep,color=red");
  print("Response status code =  ${response.statusCode}");
  print("Response Body = ${response.body}");
}

Future httpGetRequest() async {
  var url = "http://httpbin.org/";
  var response = await http.get(Uri.parse(url));
  print("Response satus code ${response.statusCode}");
  print("Response Body == ${response.body}");
}

// This is a client side code
Future tcpClient() async {
  var socket = await Socket.connect("127.0.0.1", 3000);
  print("Connected");
  socket.write("Hello TCP Client");
  print("Sent, Closing");
  await socket.close();
  print("Closed");
  exit(0);
}

// What are sockets?
// A socket is one endpoint of a two way communication link between two programs running on the network
// Type telnet -- telnet 127.0.0.1 3000 to get the result
Future tcpServer() async {
  var serverSocket = await ServerSocket.bind("127.0.0.1", 3000);
  print("Listening");
  await for (var socket in serverSocket) {
    socket.listen((value) {
      print(
          "Values == ${socket.remoteAddress} : ${socket.remotePort} == ${utf8.decode(value)}");
    });
  }
}
