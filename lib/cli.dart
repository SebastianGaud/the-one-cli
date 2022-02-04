import 'dart:math';

import 'package:cli/quote_service.dart';


//TODO: Se alla funzione viene passato il parametro 'character'
// mi piacerebbe che venissa scelta una citazione di quel personaggio
//TODO: se alla funzione viene passato true al parametro details
//vanno stampati a video i dettagli della citazione come "Film e Personaggio"
Future<String> getQuote(
    {required String apiKey, String? character, bool? details}) {
  
  var qs = QuoteService(apiKey: apiKey);
  var limitTotal = 2390; // limite massimo di citazioni
  var rnd = Random(DateTime.now().millisecondsSinceEpoch);
  return qs.quote(limit: 1, offset: rnd.nextInt(limitTotal));
}
