
class UrlManager {
  static const String _baseUrl = "https://the-one-api.dev/v2";
  static const String _quoteSegment = "quote";

  static Uri get quoteUri => Uri.parse("$_baseUrl/$_quoteSegment");
}