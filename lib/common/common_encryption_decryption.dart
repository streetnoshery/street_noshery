import 'dart:convert';
import 'package:encrypt/encrypt.dart';

final Key key = Key.fromUtf8('sumitkumargodwansumitkumargodwan'); // 32-byte key for AES-256
final IV iv = IV.fromUtf8('sumitkumargodwan'); // 16-byte static IV
class CommonEncryptionDecryption {

  final Encrypter encrypter = Encrypter(AES(key, mode: AESMode.cbc));
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
      final String encryptedDataString = decodedResponse['response'];

      // Convert the encrypted response from hex format
      final Encrypted encryptedData = Encrypted.fromBase16(encryptedDataString);
      print('encrypted Data: $encryptedData');
      // Decrypt the response
      // Decrypt the response
      final String decryptedData = encrypter.decrypt(encryptedData, iv: iv);

      return json.decode(decryptedData); // Return as JSON
    } catch (e) {
      print('Decryption error: $e');
      return null; // Handle error case
    }
  }
}
