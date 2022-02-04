import 'dart:convert';

import 'package:cli/mixins/header_mixin.dart';
import 'package:cli/url_manager.dart';
import 'package:http/http.dart';

class QuoteService with AuthHeaderMixin {
  final String apiKey;

  QuoteService({
    required this.apiKey,
  });

  Future<String> quote({required int limit, required int offset}) async {
    final queryParameters = {
      'limit': '$limit',
      'offset': '$offset',
    };

    var uri = UrlManager.quoteUri;
    Response response = await get(
        Uri.https(uri.authority, uri.path, queryParameters),
        headers: getAuthHeader(apiKey));

    final Map<String, dynamic> map = jsonDecode(response.body);
    final List<dynamic> quotes = map['docs'];
    return quotes[0]['dialog'];
  }

  Future<String> characterQuote(
      {required String charId, required int limit, required int offset}) async {
    final queryParameters = {
      'limit': '$limit',
      'offset': '$offset',
    };

    var uri = UrlManager.characterQuoteUri(charId);
    Response response = await get(
        Uri.https(uri.authority, uri.path, queryParameters),
        headers: getAuthHeader(apiKey));

    final Map<String, dynamic> map = jsonDecode(response.body);
    final List<dynamic> quotes = map['docs'];
    return quotes[0]['dialog'];
  }
}
