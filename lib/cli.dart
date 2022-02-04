import 'dart:math';

import 'package:cli/character_service.dart';
import 'package:cli/quote_service.dart';


//TODO: se alla funzione viene passato true al parametro details
//vanno stampati a video i dettagli della citazione come "Film e Personaggio"
Future<String> getQuote(
    {required String apiKey, String? character, bool? details}) async{
  
  String? charId;
  if (character != null) {
    final charService = CharacterService(apiKey:  apiKey);
    final char = await charService.searchCharacter(character);
    charId = char['_id'];
  }

  late String quote;
  var qs = QuoteService(apiKey: apiKey);
  
  if (charId != null) {
    quote = await qs.characterQuote(charId: charId, limit: 1, offset: 100);
  } else {
    var limitTotal = 2390; // limite massimo di citazioni
    var rnd = Random(DateTime.now().millisecondsSinceEpoch);
    quote = await qs.quote(limit: 1, offset: rnd.nextInt(limitTotal));
  }

  return quote;
}
