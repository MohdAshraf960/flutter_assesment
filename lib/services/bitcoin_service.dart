import 'dart:convert';

import 'package:currency/config/config.dart';
import 'package:currency/core/core.dart';
import 'package:currency/models/model.dart';

class BitcoinService {
  final DioClient _dioClient;

  BitcoinService({required DioClient dioClient}) : _dioClient = dioClient;

  Future<BitcoinPrice> getBitcoin() async {
    try {
      BitcoinPrice bitcoinPrice;
      var data = await _dioClient.get(ApiRoutes.currentPrice);

      var decoded = jsonDecode(data);

      bitcoinPrice = BitcoinPrice.fromJson(decoded);
      return bitcoinPrice;
    } catch (e) {
      rethrow;
    }
  }
}
