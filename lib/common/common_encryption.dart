import 'dart:convert';

import 'package:encrypt/encrypt.dart';

class Encryption {
  String encryptData(dynamic data) {
    // Your encryption key and initialization vector (IV)
    final key = Key.fromUtf8(
        'your-32-char-long-key-here'); // Must be 32 characters for AES-256
    final iv = IV.fromUtf8('16-characters-IV'); // Must be 16 characters

    // Encrypt payload
    final encrypter = Encrypter(AES(key));
    final encryptedPayload = encrypter.encrypt(json.encode(data), iv: iv);

    final encodedpayload = json.encode({
      'data': encryptedPayload.base64,
    });
    return encodedpayload;
  }

  String encryptHeaders(dynamic headers) {
    // Your encryption key and initialization vector (IV)
    final key = Key.fromUtf8(
        'your-32-char-long-key-here'); // Must be 32 characters for AES-256
    final iv = IV.fromUtf8('16-characters-IV'); // Must be 16 characters

    // Encrypt payload
    final encrypter = Encrypter(AES(key));
    // Encrypt headers (optional, if required)
    final encryptedHeaders = encrypter.encrypt(json.encode(headers), iv: iv);

    final encodedHeaders = json.encode({
      'data': encryptedHeaders.base64,
    });
    return encodedHeaders;
  }

  Uri getURI(String url) {
    // Make an HTTP POST request
    final apiUrl = Uri.parse(url);
    return apiUrl;
  }
}
