import 'package:flutter/material.dart';
import 'package:currency/core/core.dart';
import 'package:currency/models/model.dart';
import 'package:currency/services/service.dart';

class BitCoinViewModel with ChangeNotifier {
  final BitcoinService _bitcoinService;

  final List<String> currencyArray = ["Select", 'EUR', 'GBP', 'USD'];
  bool _isLoading = false;
  String selectedCurrency = 'Select';

  String? selectedPrice = 'Price';

  BitcoinPrice? bitcoinPrice;

  BitCoinViewModel({required BitcoinService bitcoinService})
      : _bitcoinService = bitcoinService;

  onCurrencyChnaged(index) {
    selectedCurrency = currencyArray[index];

    if (selectedCurrency != "Select") {
      selectedPrice =
          bitcoinPrice?.bpi[selectedCurrency]?.rateFloat.toStringAsFixed(2);
    } else {
      selectedPrice = 'Price';
    }

    notifyListeners();
  }

  bool get isLoading => _isLoading;

  set isLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  getBitcoin() async {
    try {
      isLoading = true;
      bitcoinPrice = await _bitcoinService.getBitcoin();
      isLoading = false;
    } catch (e) {
      isLoading = false;
      AppException.onError(e);
    }
  }
}
