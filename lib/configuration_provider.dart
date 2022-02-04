import 'dart:convert';

import 'dart:io';

import 'package:cli/model/Configuration.dart';

class ConfigurationProvider {
  final String path;

  ConfigurationProvider({
    required this.path,
  });

  Future<Configuration> getConfigurationAsync() async {
    final file = File('./apiKey.json');
    final String json = await file.readAsString();
    final Map<String, dynamic> mapApiKey = jsonDecode(json);
    return Configuration(apiKey:mapApiKey['ApiKey']);
  }
}
