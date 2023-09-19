class Currency {
  final String code;
  final String symbol;
  final String rate;
  final String description;
  final double rateFloat;

  Currency(
      {required this.code,
      required this.symbol,
      required this.rate,
      required this.description,
      required this.rateFloat});

  factory Currency.fromJson(Map<String, dynamic> json) {
    return Currency(
      code: json['code'] ?? '',
      symbol: json['symbol'] ?? '',
      rate: json['rate'] ?? '',
      description: json['description'] ?? '',
      rateFloat: (json['rate_float'] as num?)?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['code'] = code;
    data['symbol'] = symbol;
    data['rate'] = rate;
    data['description'] = description;
    data['rate_float'] = rateFloat;
    return data;
  }
}
