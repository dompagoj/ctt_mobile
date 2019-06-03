import 'dart:convert';

import 'package:http/http.dart' as http;

Future<dynamic> test() async {
  var response = await http.get('http://api.icndb.com/jokes/random');
  var data = json.decode(response.body);
  print(data['value']['joke']);
}