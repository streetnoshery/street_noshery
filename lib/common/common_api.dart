import 'package:http/http.dart' as http;
import 'common_encryption_decryption.dart';

class API {
  final CommonEncryptionDecryption encryption = CommonEncryptionDecryption();

  Future<dynamic> request({
    required String apiString,
    required String method,
    Map<String, String>? headers,
    dynamic payload,
    Map<String, dynamic>? queryParams,
  }) async {
    var apiUri = Uri.parse(apiString);
    if (queryParams != null) {
      apiUri = Uri(
        scheme: apiUri.scheme,
        host: apiUri.host,
        port: apiUri.port,
        path: apiUri.path,
        queryParameters: queryParams,
      );
    }

    // Encrypt headers & payload
    // headers = encryption.encryptHeaders(headers ?? {});
    // String encryptedPayload = payload != null ? encryption.encryptData(payload) : '';

    http.Response response;
    if (payload != null && payload["shopId"] != null) {
  print(payload["shopId"].runtimeType);
}
    try {
      switch (method.toUpperCase()) {
        case 'GET':
          response = await http.get(apiUri, headers: headers).timeout(const Duration(seconds: 60));;
          break;
        case 'POST':
          response = await http.post(apiUri, headers: headers, body: payload).timeout(const Duration(seconds: 60));
          break;
        case 'PUT':
          response = await http.put(apiUri, headers: headers, body: payload).timeout(const Duration(seconds: 60));;
          break;
        case 'DELETE':
          response = await http.delete(apiUri, headers: headers, body: payload).timeout(const Duration(seconds: 60));;
          break;
        case 'PATCH':
          response = await http.post(apiUri, headers: headers, body: payload).timeout(const Duration(seconds: 60));;
          break;
        default:
          throw Exception('Unsupported HTTP method: $method');
      }

      print("Response Status Code: ${response.statusCode}");
      print("Response Body: ${response.body}");

      return encryption.decryptResponse(response.body);
    } catch (e) {
      print("API Request Error: $e");
       return null;
    }
  }
}
