import 'dart:convert';
import 'package:encrypt/encrypt.dart';

class CommonEncryptionDecryption {
  final Key key = Key.fromUtf8('your-32-char-long-key-here'); // 32 characters for AES-256
  final IV iv = IV.fromUtf8('16-characters-IV'); // 16 characters

  final Encrypter encrypter;

  CommonEncryptionDecryption() : encrypter = Encrypter(AES(Key.fromUtf8('your-32-char-long-key-here')));

  /// Encrypt data (payload)
  String encryptData(dynamic data) {
    final encryptedPayload = encrypter.encrypt(json.encode(data), iv: iv);
    return json.encode({'data': encryptedPayload.base64});
  }

  /// Encrypt headers
  Map<String, String> encryptHeaders(Map<String, String> headers) {
    final encryptedHeaders = encrypter.encrypt(json.encode(headers), iv: iv);
    return {
      'Authorization': encrypter.encrypt('Bearer your_token', iv: iv).base64,
      'Encrypted-Headers': encryptedHeaders.base64,
      'Content-Type': 'application/json',
    };
  }

  /// 🔓 Decrypt API Response
  dynamic decryptResponse(String encryptedResponse) {
    try {
      final Map<String, dynamic> decodedResponse = json.decode(encryptedResponse);
      final String encryptedData = decodedResponse['data'];

      final decryptedData = encrypter.decrypt64(encryptedData, iv: iv);
      return json.decode(decryptedData); // Return as JSON
    } catch (e) {
      print('Decryption error: $e');
      return null; // Handle error case
    }
  }
}
