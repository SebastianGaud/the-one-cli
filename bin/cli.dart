import 'package:cli/cli.dart' as cli;

const String apiKey = '5hc0oyCyPJfPDrCR5CX4';

void main(List<String> arguments) async {
  var quote = await cli.getQuote(apiKey: apiKey);
  print('$quote!');
}
