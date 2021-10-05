import 'dart:convert';

import 'package:http/http.dart' show Client;

class NetworkHelper {
  NetworkHelper(this.url);

  Client client = Client();
  final String url;

  Future<Map<String, dynamic>> getData() async {
    final response = await client.get(url);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load api.');
    }
  }
}