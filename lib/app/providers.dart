import 'package:currency/injector/injector.dart';
import 'package:currency/services/service.dart';
import 'package:currency/view_models/view_models.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(
    create: (_) => BitCoinViewModel(bitcoinService: getIt<BitcoinService>()),
  ),
];
