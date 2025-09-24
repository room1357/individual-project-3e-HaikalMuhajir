import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants/api_endpoints.dart';

class ApiService {
  Future<Map<String, dynamic>> post(String endpoint, Map<String, dynamic> body) async {
    final url = Uri.parse(ApiEndpoints.baseUrl + endpoint);

    final response = await http.post(
      url,
      body: jsonEncode(body),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Error ${response.statusCode}: ${response.body}");
    }
  }

  Future<Map<String, dynamic>> get(String endpoint, {String? token}) async {
    final url = Uri.parse(ApiEndpoints.baseUrl + endpoint);

    final response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
        if (token != null) "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Error ${response.statusCode}: ${response.body}");
    }
  }
}
