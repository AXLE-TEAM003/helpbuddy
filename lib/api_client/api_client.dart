import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiClient {
  final String baseUrl = 'http://twgoapp.com/api/api';
  final String authToken;

  ApiClient.auths() : authToken = '';
  ApiClient({required this.authToken});

  Future<dynamic> authGet(String endpoint) async {
    final response = await http.get(
      Uri.parse('$baseUrl/$endpoint/'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );
    return _handleResponse(response);
  }

  Future<dynamic> authPost(String endpoint, Map<String, dynamic> body) async {
    final response = await http.post(
      Uri.parse('$baseUrl/$endpoint/'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(body),
    );
    return _handleResponse(response);
  }

  Future<dynamic> get(String endpoint) async {
    final response = await http.get(
      Uri.parse('$baseUrl/$endpoint/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $authToken',
      },
    );
    return _handleResponse(response);
  }

  Future<dynamic> post(String endpoint, Map<String, dynamic> body) async {
    final response = await http.post(
      Uri.parse('$baseUrl/$endpoint/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $authToken',
      },
      body: jsonEncode(body),
    );
    return _handleResponse(response);
  }

  dynamic _handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return json.decode(response.body);
    } else {
      return response.statusCode;
    }
  }
}
