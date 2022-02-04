class UrlManager {
  static const String _baseUrl = "https://the-one-api.dev/v2";
  static const String _quoteSegment = "quote";
  static const String _characterSegment = 'character';

  static Uri get characterUri => Uri.parse("$_baseUrl/$_characterSegment");
  
  static Uri characterQuoteUri(String charId) =>
      Uri.parse("$_baseUrl/$_characterSegment/$charId/$_quoteSegment");

  static Uri get quoteUri => Uri.parse("$_baseUrl/$_quoteSegment");
}
