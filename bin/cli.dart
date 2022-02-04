import 'dart:convert';

import 'package:cli/cli.dart' as cli;
import 'dart:io';

import 'package:cli/configuration_provider.dart';


// void main(List<String> arguments) async {
//   final file = File('./apiKey.txt');
//   final String apiKey = file.readAsStringSync();
//   var quote =
//       await cli.getQuote(apiKey: apiKey, character: 'Legolas', details: true);
//   print('$quote!');
// }

void main(List<String> arguments) async {
  var provider = ConfigurationProvider(path: './apiKey.json');
  final config = await provider.getConfigurationAsync();
  
  // var quote =
  //     await cli.getQuote(apiKey: mapApiKey['ApiKey']!, character: 'Legolas', details: true);
  // print('$quote!');
}
