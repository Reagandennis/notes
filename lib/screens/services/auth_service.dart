// TODO Implement this library.
import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  final String apiUrl = 'http://185.137.234.119:8080/api/auth/signup';
  final String csrfTokenUrl = 'http://185.137.234.119:8080/csrf-token';

  Future<void> signup(String username, String email, String password) async {
    try {
      // Fetch CSRF token
      final csrfResponse = await http.get(Uri.parse(csrfTokenUrl));
      if (csrfResponse.statusCode != 200) {
        throw Exception('Failed to fetch CSRF token');
      }
      final csrfToken = jsonDecode(csrfResponse.body)['token'];

      // Make signup request with CSRF token
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'X-CSRF-TOKEN': csrfToken, // Include CSRF token in headers
        },
        body: jsonEncode({
          'username': username,
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        // Handle successful signup
        print('User registered successfully');
      } else {
        // Handle errors
        print('Signup failed: ${response.body}');
      }
    } catch (e) {
      // Handle exceptions
      print('An error occurred: $e');
    }
  }
}
