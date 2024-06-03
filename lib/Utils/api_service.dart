import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Model/response_model.dart';

class SignInApiService {
  final String _baseUrl = 'https://apptest.dokandemo.com/wp-json/jwt-auth/v1/token';

  Future<Map<String, dynamic>> authenticateUser(String username, String password) async {
    final url = Uri.parse(_baseUrl);

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to authenticate user: ${response.reasonPhrase}');
    }
  }

  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse('assets/response/response.json'));

    if (response.statusCode == 200) {
      List<dynamic> jsonList = json.decode(response.body);
      return Product.fromJsonList(jsonList);
    } else {
      throw Exception('Failed to load products');
    }
  }



  Future<void> registerUser(String username, String email, String password) async {
    final url = 'http://apptest.dokandemo.com/wp-json/wp/v2/users/register';

    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'username': username,
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      // Registration successful
      return jsonDecode(response.body);
    } else {
      // Registration failed
      print('Failed to register user: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  }
}
