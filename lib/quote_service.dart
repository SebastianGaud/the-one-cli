import 'dart:convert';
import 'dart:math';

import 'package:cli/mixins/header_mixin.dart';
import 'package:cli/url_manager.dart';
import 'package:http/http.dart';

class QuoteService with AuthHeaderMixin {
  final String apiKey;

  QuoteService({
    required this.apiKey,
  });

  Future<String> quote({required int quotePosition}) async {
    Response response =
        await get(UrlManager.quoteUri, headers: getAuthHeader(apiKey));

    final Map<String, dynamic> map = jsonDecode(response.body);
    final List<dynamic> quotes = map['docs'];
    return quotes[quotePosition]['dialog'];
  }
}
