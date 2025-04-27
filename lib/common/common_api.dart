import 'dart:async';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:street_noshery/common/common_exception_mapper.dart';
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
              .timeout(const Duration(seconds: 10));
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

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return encryption.decryptResponse(response.body);
      } else {
        return {
          "error": "RequestFailed",
          "statusCode": response.statusCode,
          "message": response.reasonPhrase ?? "Request failed",
        };
      }
    } on TimeoutException catch (error) {
      return ApiException(
        message: "Timeout",
        errorCode: "400",
        errorReason: error
      );
    } on SocketException catch (_) {
      return ApiException(
        message: "Socket hangup",
        errorCode: "400",
        errorReason: _
      );
    } on FormatException catch (_) {
      return ApiException(
        message: "BadFormatResponse",
        errorCode: "400",
        errorReason: _
      );
    } catch (e) {
      print("API Request Error: $e");
      return ApiException(
        message: "Something went wrong",
        errorReason: e
      );
    }
  }
}
