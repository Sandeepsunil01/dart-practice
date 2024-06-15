import 'dart:math';
import 'dart:typed_data';
import 'dart:convert';
import 'package:pointycastle/pointycastle.dart';
import 'package:collection/collection.dart';
// Package that was built in Java mostly for encryption
// Package that was built in Java mostly for encryption

void main(List<String> arguments) {
  // hashExample();
  // derivingKeysExample();
  // secureRandomNumberExample();
  // streamCipherExample();
  blockCipherExample();
}

// BlockCipher
// AES Most secure till data(Military Grade Encryption)
blockCipherExample() {
  // 16 is Block size
  final key = randomBytes(16);
  final params = KeyParameter(key);

  BlockCipher cipher = BlockCipher("AES");
  cipher.init(true, params);

// Encrypt
  String plainText = "Hello Cipher";
  Uint8List plainData = createUnit8ListFromString(
      plainText.padRight(cipher.blockSize)); //PAD - Not 100% secure
  Uint8List encryptedData = cipher.process(plainData);

// Decrypt
  cipher.reset();
  cipher.init(false, params);
  Uint8List decryptedData = cipher.process(encryptedData);

  display("Plain Data", plainData);
  display("Encrypted Data", encryptedData);
  display("Decrypted Data", decryptedData);

  // Make sure they match
  Function eq = const ListEquality().equals;
  assert(eq(plainData, decryptedData));

  print(utf8.decode(decryptedData).trim());
}

// Matching 2 keys and comparing
streamCipherExample() {
  final keyBytes = randomBytes(16);
  final key = KeyParameter(keyBytes);
  final iv = randomBytes(8);
  final params = ParametersWithIV(key, iv);

  StreamCipher cipher = StreamCipher("Salsa20");
  cipher.init(true, params);

// Encrypt
  String plainText = "Hello Ciper";
  Uint8List plainData = createUnit8ListFromString(plainText);
  Uint8List encryptedData = cipher.process(plainData);

  // Decrypt
  cipher.reset();
  cipher.init(false, params);
  Uint8List decryptedData = cipher.process(encryptedData);

  display("Plain text", plainData);
  display("Encrypted data", encryptedData);
  display("Decrypted data", decryptedData);

  // Make sure they match!
  Function eq = const ListEquality().equals;
  assert(eq(plainData, decryptedData));

  print(utf8.decode(decryptedData));
}

// Secure random number
// For crypto graphy
// Example is Key Generation
secureRandomNumberExample() {
  print(randomBytes(10));
}

// String AES... is just a algorithm name
Uint8List randomBytes(int length) {
  final rnd = SecureRandom("AES/CTR/AUTO-SEED-PRNG");
  final key = Uint8List(16);
  final keyParam = KeyParameter(key);
  final params = ParametersWithIV(keyParam, Uint8List(16));

  // Adding the params
  rnd.seed(params);

  var random = Random();
  for (int i = 0; i < random.nextInt(255); i++) {
    rnd.nextUint8();
  }

  var bytes = rnd.nextBytes(length);
  return bytes;
}

// Password Encryption
derivingKeysExample() {
  String password = "passwords";
  var salt = createUnit8ListFromString("salt");
  var pkcs = KeyDerivator("SHA-1/HMAC/PBKDF2");
  var params = Pbkdf2Parameters(salt, 100, 16);

  pkcs.init(params);

  Uint8List key = pkcs.process(createUnit8ListFromString(password));
  display("Key value", key);
}

void display(String title, Uint8List value) {
  print("Title == $title");
  print("Value == $value");
  print("Encoded == ${base64.encode(value)}");
  print("----");
}

Uint8List createUnit8ListFromString(String value) {
  return Uint8List.fromList(utf8.encode(value));
}

// This is mostly used verying hashes
// Mainly to check if the data is tampered during download of file
hashExample() {
  Digest digest = Digest("SHA-256");
  String value = "Hello Hash";

  Uint8List data = Uint8List.fromList(utf8.encode(value));
  Uint8List hash = digest.process(data);

  print("Hash == $hash");
  print("Base64 == ${base64.encode(hash)}"); //Encoding is not encryption
}
