import 'dart:convert';

import 'package:http/http.dart' as http;

Future fetchNews() async {
  try {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      return json.decode(response.body.toString());
    }
  } catch (e) {
      Exception(e);
  }
}
