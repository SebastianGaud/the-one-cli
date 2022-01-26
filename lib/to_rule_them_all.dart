import 'package:args/args.dart';
import 'package:to_rule_them_all/services/quote_service.dart';
import 'package:to_rule_them_all/utils/url_manager.dart';
import 'package:to_rule_them_all/utils/urls.dart';

// ignore: non_constant_identifier_names
late final String API_KEY;

void setup(List<String> arguments) {
  final parser = ArgParser()
    ..addOption('api-key', mandatory: true)
    ..addOption('character', abbr: 'c', mandatory: false)
    ..addOption('details',
        abbr: 'd',
        mandatory: false,
        defaultsTo: 'false',
        allowed: ['true', 'false']);

  final result = parser.parse(arguments);

  API_KEY = result['api-key'];

  theOneCli().then((value) => print(value));
}

Future theOneCli({String? char, bool detailed = false}) async {
  var data = await QuoteService().getRandomQuoteAsync();
  print(data);
}
