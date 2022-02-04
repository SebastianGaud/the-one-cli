import 'dart:io';

mixin AuthHeaderMixin {
  Map<String, String> getAuthHeader(String apiKey) {
    return {HttpHeaders.authorizationHeader: 'Bearer $apiKey'};
  }
}
