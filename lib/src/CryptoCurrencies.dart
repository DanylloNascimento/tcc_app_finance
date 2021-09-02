
import 'dart:async';

import 'package:app_acoesfinancas/alpha_vantage_package.dart';
import 'package:app_acoesfinancas/src/BaseAPI.dart';



class CryptoCurrencies extends BaseAPI {

  String _INTRADAY = "DIGITAL_CURRENCY_INTRADAY";
  String _DAILY = "DIGITAL_CURRENCY_DAILY";
  String _WEEKLY = "DIGITAL_CURRENCY_WEEKLY";
  String _MONTHLY = "DIGITAL_CURRENCY_MONTHLY";

  CryptoCurrencies(String key) : super(key);

  Future<JSONObject> getIntraday(String symbol, String market) {
    return this.getRequest(function: _INTRADAY, market: market, fromCurrency: '', interval: '', outputsize: '', seriesType: '', symbol: '', symbols: '', timePeriod: '', toCurrency: '' );

  }

  Future<JSONObject> getDaily(String symbol, String market) {
    return this.getRequest(function: _DAILY, market: market, fromCurrency: '', interval: '', outputsize: '', seriesType: '', symbol: '', symbols: '', timePeriod: '', toCurrency: '' );
  }

  Future<JSONObject> getWeekly(String symbol, String market) {
    return this.getRequest(function: _WEEKLY, market: market, fromCurrency: '', interval: '', outputsize: '', seriesType: '', symbol: '', symbols: '', timePeriod: '', toCurrency: '' );
  }

  Future<JSONObject> getMonthly(String symbol, String market) {
    return this.getRequest(function: _MONTHLY, market: market, fromCurrency: '', interval: '', outputsize: '', seriesType: '', symbol: '', symbols: '', timePeriod: '', toCurrency: '' );
  }

}