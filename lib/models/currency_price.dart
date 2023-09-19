import 'package:currency/models/currency.dart';
import 'package:currency/models/time.dart';

class BitcoinPrice {
  final Time time;
  final String disclaimer;
  final String chartName;
  final Map<String, Currency> bpi;

  BitcoinPrice(
      {required this.time,
      required this.disclaimer,
      required this.chartName,
      required this.bpi});

  factory BitcoinPrice.fromJson(Map<String, dynamic> json) {
    final bpiMap = Map<String, dynamic>.from(json['bpi'] ?? {});
    return BitcoinPrice(
      time: Time.fromJson(json['time'] ?? {}),
      disclaimer: json['disclaimer'] ?? '',
      chartName: json['chartName'] ?? '',
      bpi: bpiMap.map((key, value) => MapEntry(key, Currency.fromJson(value))),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['time'] = time.toJson();
    data['disclaimer'] = disclaimer;
    data['chartName'] = chartName;
    data['bpi'] = bpi.map((key, value) => MapEntry(key, value.toJson()));
    return data;
  }
}
