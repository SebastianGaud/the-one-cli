import 'package:cli/cli.dart' as cli;
import 'dart:io';

void main(List<String> arguments) async {
  final String apiKey = File('./apiKey.txt').readAsStringSync();
  var quote =
      await cli.getQuote(apiKey: apiKey, character: 'Legolas', details: true);
  print('$quote!');
}
