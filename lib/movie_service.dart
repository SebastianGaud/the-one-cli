import 'dart:convert';

import 'package:http/http.dart' show get;

import 'package:cli/mixins/header_mixin.dart';
import 'package:cli/url_manager.dart';

class MovieService with AuthHeaderMixin {
  final String apiKey;
  MovieService({
    required this.apiKey,
  });
  
  Future<Map<String, dynamic>> getMovie(String idMovie) async{
      Uri url = Uri.parse("${UrlManager.movieUrl.toString()}/$idMovie");
      var res = await get(url, headers: getAuthHeader(apiKey));
      var data = jsonDecode(res.body);
      return data["docs"][0];
  }
}
