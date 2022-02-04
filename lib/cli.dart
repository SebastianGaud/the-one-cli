import 'dart:math';

import 'package:cli/quote_service.dart';

Future<String> getQuote({required String apiKey}) {
  var qs = QuoteService(apiKey: apiKey);

  var rnd = Random(DateTime.now().millisecondsSinceEpoch);
  return qs.quote(quotePosition: rnd.nextInt(1000));
}
