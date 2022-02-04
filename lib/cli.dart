import 'dart:math';

import 'package:cli/quote_service.dart';

Future<String> getQuote({required String apiKey}) {
  var qs = QuoteService(apiKey: apiKey);

  var limitTotal = 2390; // limite massimo di citazioni
  var rnd = Random(DateTime.now().millisecondsSinceEpoch);
  return qs.quote(limit: 1, offset: rnd.nextInt(limitTotal));
}
