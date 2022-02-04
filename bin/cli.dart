import 'package:cli/cli.dart' as cli;

// TODO: L'api key va messa in un file e letta dal file
// è sbagliato averla chiodata a codice
const String apiKey = '5hc0oyCyPJfPDrCR5CX4';

void main(List<String> arguments) async {
  var quote = await cli.getQuote(apiKey: apiKey, character: 'Legolas', details: true);
  print('$quote!');
}
