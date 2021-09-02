import 'dart:async';

import 'package:app_acoesfinancas/alpha_vantage_package.dart';
import 'package:app_acoesfinancas/src/BaseAPI.dart';

class ForeignExchange extends BaseAPI {

  ForeignExchange(String key) : super(key);


  Future<JSONObject> getCurrencyExchangeRate(String fromCurrency, String toCurrency) {
    return this.getRequest(function: "CURRENCY_EXCHANGE_RATE", fromCurrency: fromCurrency, toCurrency: toCurrency, interval: '', market: '', seriesType: '', outputsize: '', symbol: '', symbols: '', timePeriod: '' );

  }
}