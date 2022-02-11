import 'dart:convert';

import 'package:cli/mixins/header_mixin.dart';
import 'package:cli/url_manager.dart';
import 'package:http/http.dart' show get;

/*

{
  "_id": "5cd99d4bde30eff6ebccfbbe",
  "height": "",
  "race": "Human",
  "gender": "Female",
  "birth": "",
  "spouse": "Belemir",
  "death": "",
  "realm": "",
  "hair": "",
  "name": "Adanel",
  "wikiUrl": "http://lotr.wikia.com//wiki/Adanel"
},


*/


class CharacterService with AuthHeaderMixin {
  final String apiKey;
  CharacterService({
    required this.apiKey,
  });

  Future<Map<String, dynamic>> searchCharacter(String name) async{
    Uri uri = UrlManager.characterUri;
    final queryParams = {
      'name': '$name'
    };
    uri = Uri.https(uri.authority, uri.path, queryParams);
    final res =await get(uri, headers: getAuthHeader(apiKey));
    final map = jsonDecode(res.body);
    return map;
  }

  Future<Map<String, dynamic>> getCharacter(String idChar) async {
    var uri = Uri.parse("${UrlManager.characterUri.toString()}/$idChar");
    var res = await get(uri, headers: getAuthHeader(apiKey));
    var data = jsonDecode(res.body);
    return data['docs'][0];
  }
}
