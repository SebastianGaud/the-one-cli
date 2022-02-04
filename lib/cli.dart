import 'dart:convert';

import 'package:http/http.dart';

Future<String> getQuote() async {
  
  
  Response response = await get(Uri.parse('https://the-one-api.dev/v2/quote'), 
  headers: {
    'Authorization': 'Bearer 5hc0oyCyPJfPDrCR5CX4'
  });

  final Map<String, dynamic> map = jsonDecode(response.body);
  final List<dynamic> quotes = map['docs'];
  return quotes[0]['dialog'];

}
