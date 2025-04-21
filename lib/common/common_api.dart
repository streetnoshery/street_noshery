import 'package:http/http.dart' as http;
import 'common_encryption_decryption.dart';
import 'dart:convert';

class API {
  final CommonEncryptionDecryption encryption = CommonEncryptionDecryption();

  Future<dynamic> request({
    required String apiString,
    required String method,
    Map<String, String>? headers,
    Map<String, dynamic>? payload,
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

    final headers = {
      'Content-Type': 'application/json',
      // Add other headers if needed, e.g.
      // 'Authorization': 'Bearer your_token',
    };

    http.Response response;
    if (payload != null && payload["isEnable"] != null) {
      print(payload["isEnable"].runtimeType);
    }
    try {
      switch (method.toUpperCase()) {
        case 'GET':
          response = await http
              .get(apiUri, headers: headers)
              .timeout(const Duration(seconds: 60));
          break;
        case 'POST':
          response = await http
              .post(apiUri, headers: headers, body: jsonEncode(payload))
              .timeout(const Duration(seconds: 60));
          break;
        case 'PUT':
          response = await http
              .put(apiUri, headers: headers, body: jsonEncode(payload))
              .timeout(const Duration(seconds: 60));
          ;
          break;
        case 'DELETE':
          response = await http
              .delete(apiUri, headers: headers, body: jsonEncode(payload))
              .timeout(const Duration(seconds: 60));
          ;
          break;
        case 'PATCH':
          response = await http
              .patch(apiUri, headers: headers, body: jsonEncode(payload))
              .timeout(const Duration(seconds: 60));
          ;
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
