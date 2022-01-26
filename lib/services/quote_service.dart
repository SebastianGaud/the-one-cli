import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:http/http.dart' show get;
import 'package:to_rule_them_all/utils/url_manager.dart';
import 'package:to_rule_them_all/utils/urls.dart';


/*
 "docs": [
        {
            "_id": "5cd96e05de30eff6ebcce7e9",
            "dialog": "Deagol!",
            "movie": "5cd95395de30eff6ebccde5d",
            "character": "5cd99d4bde30eff6ebccfe9e"
        },

*/


//FIXME: Computazionalmente errato, chiamiamo un API richiedendo una lista ma poi estrapoliamo un solo elemento
class QuoteService {
  Future<String> getRandomQuoteAsync() async {
      var res = await get(UrlManager.getUrlFromSegment(UrlSegments.Quote), headers: {
        HttpHeaders.authorizationHeader: 'Bearer ${UrlManager.apiKey}'
      });

      Map<String, dynamic> map = json.decode(res.body);
      var rand = Random(DateTime.now().second).nextInt(1000);
      return map['docs'][rand]['dialog'];
  }
}