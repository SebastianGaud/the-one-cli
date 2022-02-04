import 'package:cli/cli.dart' as cli;
import 'package:cli/configuration_provider.dart';

void main(List<String> arguments) async {
  var provider = ConfigurationProvider(path: './apiKey.json');
  final c = provider.getConfigurationAsync();
  final config = await c;
  var quote =
      await cli.getQuote(apiKey: config.apiKey, character: 'Legolas', details: true);
  print('$quote!');
}
