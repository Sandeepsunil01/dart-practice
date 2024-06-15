import 'dart:io';
import 'dart:convert';
import 'package:archive/archive.dart';
import 'package:path/path.dart' as p;

void main(List<String> arguments) {
  // gzipCompression();
  // gzipAndZLib();
  zipFiles();
}

zipFiles() {
  List<String> files = [];

  Directory.current.listSync().forEach((FileSystemEntity fse) {
    if (fse.statSync().type == FileSystemEntityType.file) {
      files.add(fse.path);
    }
  });

  String zipFile =
      "/Volumes/SiteRecast/CodeBase/Open_Source_Projects/dart-practice/dart_practice_advance/zipfile.zip";

  zip(files, zipFile);
  unzip(zipFile,
      "/Volumes/SiteRecast/CodeBase/Open_Source_Projects/dart-practice/dart_practice_advance/Decompressed");
}

void zip(List<String> files, String file) {
  Archive archive = Archive();
  files.forEach((String path) {
    File file = File(path);

    ArchiveFile archiveFile = ArchiveFile(
        p.basename(path), file.lengthSync(), file.readAsBytesSync());

    archive.addFile(archiveFile);
  });

  ZipEncoder encoder = ZipEncoder();
  File f = File(file);
  f.writeAsBytesSync(encoder.encode(archive)!);

  print("Compressed");
}

void unzip(String zip, String path) {
  File file = File(zip);

  Archive archive = ZipDecoder().decodeBytes(file.readAsBytesSync());

  archive.forEach((ArchiveFile archiveFile) {
    File file = File("$path/${archiveFile.name}");
    file.createSync(recursive: true);
    file.writeAsBytesSync(archiveFile.content);
  });

  print("Decompressed");
}

// GZip is Faster
// ZLib has a better compression ratio
gzipAndZLib() {
  int zLib = testCompresser(zlib);
  int gZip = testCompresser(gzip);
  print("ZLib = =$zLib");
  print("GZip = =$gZip");
}

String generateData() {
  String data = "";
  for (int i = 0; i < 1000; i++) {
    data = data + "Hello Compression\r\n";
  }
  return data;
}

int testCompresser(var codec) {
  String data = generateData();

  List original = utf8.encode(data);
  List<int> compressed = codec.encode(original);
  List<int> decompress = codec.decode(compressed);

  print("Testing ${codec.toString()}");
  print("Original ${original.length}");
  print("Compressed ${compressed.length}");
  print("Decompressed ${decompress.length}");

  print(" ");

  String decded = utf8.decode(decompress);
  assert(data == decded);

  return compressed.length;
}

// Sending large bytes of data accross internet is slower so compress and send the data
gzipCompression() {
  String data = "";
  for (int i = 0; i < 100; i++) {
    data = "${data}Hello GZip";
  }

  // Original Data
  List<int> original = utf8.encode(data);

  // Compress Data
  // GZip is an algorithm that compress data
  List<int> compressed = gzip.encode(original);

  // Decompress
  List<int> decompress = gzip.decode(compressed);

  print("original ${original.length} Bytes");
  print("Compressed ${compressed.length} Bytes");
  print("Decompressed ${decompress.length} Bytes");

  String decode = utf8.decode(decompress);
  // print("Decoded == $decode");
  assert(data == decode);
}
