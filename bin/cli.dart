import 'package:cli/cli.dart' as cli;

void main(List<String> arguments) async {
  var quote = await cli.getQuote();
  print('Hello world: $quote!');
}
