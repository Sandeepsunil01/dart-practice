import 'package:dart_mysql/dart_mysql.dart';

void main(List<String> argument) {
  // selectingRows();
  // insertData();
  namesAndIndexes();
}

namesAndIndexes() async {
  var settings = ConnectionSettings(
      host: 'localhost',
      port: 3306,
      user: 'root',
      password: 'Sandeep@23',
      db: 'school');
  var con = await MySqlConnection.connect(settings);

  var results = await con.query("Select * from teachers");

  for (var row in results) {
    print('Name: ${row[0]}, email: ${row[1]}');
  }
  con.close();
}

// Using queries
insertData() async {
  var settings = ConnectionSettings(
      host: 'localhost',
      port: 3306,
      user: 'root',
      password: 'Sandeep@23',
      db: 'school');
  var con = await MySqlConnection.connect(settings);

  var result = await con.query(
      'insert into teachers (name, topic) values (?, ?)', ['Bob', 'Science']);
  print("Result == ${result.insertId}");
  con.close();
}

Future selectingRows() async {
  var settings = ConnectionSettings(
      host: 'localhost',
      port: 3306,
      user: 'root',
      password: 'Sandeep@23',
      db: 'school');
  var con = await MySqlConnection.connect(settings);

  var results = await con.query("Select * from teachers");
  print("Results = ${results.length} rows");
  con.close();
  // exit(0);
}
