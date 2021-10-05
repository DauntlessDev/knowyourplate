import 'dart:convert';

import 'package:http/http.dart' show Client;

class NetworkHelper {
  NetworkHelper(this.url);

  Client client = Client();
  final String url;

  Future<Map<String, dynamic>> getData(int tries) async {
    final response = await client.get(url);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      if (tries < 50) {
        print('tried prediction $tries');
        return getData(tries + 1);
      } else {
        throw Exception('Failed to load api.');
      }
    }
  }
}
