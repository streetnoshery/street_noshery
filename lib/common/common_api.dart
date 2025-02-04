import 'package:http/http.dart' as http;
import 'common_encryption_decryption.dart';

class API {
  final CommonEncryptionDecryption encryption = CommonEncryptionDecryption();

  Future<dynamic> request({
    required Uri apiUri,
    required String method,
    Map<String, String>? headers,
    dynamic payload,
    Map<String, dynamic>? queryParams,
  }) async {
    if (queryParams != null) {
      apiUri = Uri(
        scheme: apiUri.scheme,
        host: apiUri.host,
        path: apiUri.path,
        queryParameters: queryParams,
      );
    }

    // Encrypt headers & payload
    headers = encryption.encryptHeaders(headers ?? {});
    String encryptedPayload = payload != null ? encryption.encryptData(payload) : '';

    http.Response response;
    switch (method.toUpperCase()) {
      case 'GET':
        response = await http.get(apiUri, headers: headers);
        break;
      case 'POST':
        response = await http.post(apiUri, headers: headers, body: encryptedPayload);
        break;
      case 'PUT':
        response = await http.put(apiUri, headers: headers, body: encryptedPayload);
        break;
      case 'DELETE':
        response = await http.delete(apiUri, headers: headers, body: encryptedPayload);
        break;
      default:
        throw Exception('Unsupported HTTP method: $method');
    }

    // 🔓 Decrypt the response
    return encryption.decryptResponse(response.body);
  }
}
