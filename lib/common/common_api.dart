import 'package:http/http.dart' as http;

class API {
  Future<dynamic> api(Uri apiUri, String headers, String payload) async {
    final response = await http.post(
      apiUri,
      headers: {
        'Authorization': 'Bearer $headers', // Example of encrypting headers
        'Content-Type': 'application/json',
      },
      body: payload,
    );

    return response;
  }
}
