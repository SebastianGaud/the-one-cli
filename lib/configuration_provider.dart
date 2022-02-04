import 'dart:convert';

import 'dart:io';

import 'package:cli/model/Configuration.dart';

class ConfigurationProvider {
  final String path;

  ConfigurationProvider({
    required this.path,
  });

  Future<Configuration> getConfigurationAsync() async {
    final file = File(path);
    final String json = await file.readAsString();
    final Map<String, dynamic> mapApiKey = jsonDecode(json);
    return Configuration(apiKey:mapApiKey['ApiKey']);
  }
}
