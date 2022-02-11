import 'dart:math';

import 'package:cli/character_service.dart';
import 'package:cli/movie_service.dart';
import 'package:cli/quote_service.dart';
import 'package:cli/url_manager.dart';


/*
        {
            "_id": "5cd96e05de30eff6ebcce7e9",
            "dialog": "Deagol!",
            "movie": "5cd95395de30eff6ebccde5d",
            "character": "5cd99d4bde30eff6ebccfe9e",
            "id": "5cd96e05de30eff6ebcce7e9"
        },
*/

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

  late Map<String, dynamic> quote;
  var qs = QuoteService(apiKey: apiKey);
  
  if (charId != null) {
    quote = await qs.characterQuote(charId: charId, limit: 1, offset: 100);
  } else {
    var limitTotal = 2390; // limite massimo di citazioni
    var rnd = Random(DateTime.now().millisecondsSinceEpoch);
    quote = await qs.quote(limit: 1, offset: rnd.nextInt(limitTotal));
  }

  if (details ?? false) {
    var movie = await MovieService(apiKey: apiKey).getMovie(quote['movie']);
    var char = await CharacterService(apiKey: apiKey).getCharacter(quote['character']);

    return {
        "Character": char['name'],
        "Movie": movie['name'],
        "Quote": quote['dialog']
    }.toString();
  }

  return quote['dialog'];
}
