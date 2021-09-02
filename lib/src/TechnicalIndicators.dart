import 'dart:async';

import 'package:app_acoesfinancas/alpha_vantage_package.dart';
import 'package:app_acoesfinancas/src/BaseAPI.dart';



class TechnicalIndicators extends BaseAPI {

  TechnicalIndicators(String key) : super(key);

  Future<JSONObject> getSMA(String symbol, {String interval = "1min", String timePeriod = "60", String seriesType="open"}) {
    return this.getRequest(function: "SMA", symbol: symbol, interval: interval, timePeriod: timePeriod, seriesType: seriesType, fromCurrency: '', market: '', outputsize: '', symbols: '', toCurrency: '' );
  }

  Future<JSONObject> getEMA(String symbol, {String interval = "1min", String timePeriod = "60", String seriesType="open"}) {
    return this.getRequest(function: "EMA", symbol: symbol, interval: interval, timePeriod: timePeriod, seriesType: seriesType, fromCurrency: '', market: '', outputsize: '', symbols: '', toCurrency: '' );
  }

  Future<JSONObject> getWMA(String symbol, {String interval = "1min", String timePeriod = "60", String seriesType="open"}) {
    return this.getRequest(function: "WMA", symbol: symbol, interval: interval, timePeriod: timePeriod, seriesType: seriesType, fromCurrency: '', market: '', outputsize: '', symbols: '', toCurrency: '' );
  }

  Future<JSONObject> getDEMA(String symbol, {String interval = "1min", String timePeriod = "60", String seriesType="open"}) {
    return this.getRequest(function: "DEMA", symbol: symbol, interval: interval, timePeriod: timePeriod, seriesType: seriesType , fromCurrency: '', market: '', outputsize: '', symbols: '', toCurrency: '' );
  }

  Future<JSONObject> getTEMA(String symbol, {String interval = "1min", String timePeriod = "60", String seriesType="open"}) {
    return this.getRequest(function: "TEMA", symbol: symbol, interval: interval, timePeriod: timePeriod, seriesType: seriesType , fromCurrency: '', market: '', outputsize: '', symbols: '', toCurrency: '' );
  }

  Future<JSONObject> getTRIMA(String symbol, {String interval = "1min", String timePeriod = "60", String seriesType="open"}) {
    return this.getRequest(function: "TRIMA", symbol: symbol, interval: interval, timePeriod: timePeriod, seriesType: seriesType , fromCurrency: '', market: '', outputsize: '', symbols: '', toCurrency: '' );
  }

  Future<JSONObject> getKAMA(String symbol, {String interval = "1min", String timePeriod = "60", String seriesType="open"}) {
    return this.getRequest(function: "KAMA", symbol: symbol, interval: interval, timePeriod: timePeriod, seriesType: seriesType, fromCurrency: '', market: '', outputsize: '', symbols: '', toCurrency: '' );
  }

  Future<JSONObject> getMAMA(String symbol, {String interval = "1min", required String fastlimit, required String slowlimit, String seriesType="open"}) {
    return this.getRequest(function: "EMA", symbol: symbol, interval: interval, seriesType: seriesType, fromCurrency: '', market: '', outputsize: '', symbols: '', timePeriod: '', toCurrency: '' );
  }

  Future<JSONObject> getT3(String symbol, {String interval = "1min", String timePeriod = "60", String seriesType="open"}) {
    return this.getRequest(function: "T3", symbol: symbol, interval: interval, timePeriod: timePeriod, seriesType: seriesType, fromCurrency: '', market: '', outputsize: '', symbols: '', toCurrency: '' );
  }
}