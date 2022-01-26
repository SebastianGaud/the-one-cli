import '../to_rule_them_all.dart' show API_KEY;

const _urlAuthority = 'the-one-api.dev';

class UrlManager {
    
    static String get apiKey {
      return API_KEY;
    }

    static String get baseUrl {
      return Uri.https(_urlAuthority, '').toString();
    }

    static Uri getUrlFromSegment(String segment){
      return Uri.https(_urlAuthority, 'v2/$segment');
    }
}
