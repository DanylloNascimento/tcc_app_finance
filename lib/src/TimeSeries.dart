import 'dart:async';

import 'package:app_acoesfinancas/alpha_vantage_package.dart';
import 'package:app_acoesfinancas/src/BaseAPI.dart';


class TimeSeries extends BaseAPI {

  var _intraday = "TIME_SERIES_INTRADAY";
  var _daily = "TIME_SERIES_DAILY";
  var _dailyAdjusted = "TIME_SERIES_DAILY_ADJUSTED";
  var _weekly = "TIME_SERIES_WEEKLY";
  var _weeklyAdjusted = "TIME_SERIES_WEEKLY_ADJUSTED";
  var _monthly = "TIME_SERIES_MONTHLY";
  var _monthlyAdjusted = "TIME_SERIES_MONTHLY_ADJUSTED";
  var _batchStockQuotes = "BATCH_STOCK_QUOTES";


  TimeSeries(String key) : super(key);

  Future<JSONObject> getIntraday(String symbol, {String interval = "1min", required String outputsize})  async {
    return this.getRequest(function: _intraday, symbol: symbol, interval: interval, outputsize: outputsize, fromCurrency: '', market: '', seriesType: '', symbols: '', timePeriod: '', toCurrency: '');
  }

  Future<JSONObject> getDaily(String symbol, {required String outputsize}) async {
    return this.getRequest(function: _daily, symbol: symbol, outputsize: outputsize, fromCurrency: '', market: '', seriesType: '', symbols: '', timePeriod: '', toCurrency: '', interval: '');
  }

  Future<JSONObject> getDailyAdjusted(String symbol, {required String outputsize}) async {
    return this.getRequest(function: _dailyAdjusted, symbol: symbol, outputsize: outputsize, fromCurrency: '', interval: '', market: '', seriesType: '', symbols: '', timePeriod: '', toCurrency: '');
  }

  Future<JSONObject> getWeekly(String symbol, {required String outputsize}) async {
    return this.getRequest(function: _weekly, symbol: symbol, outputsize: outputsize, fromCurrency: '', interval: '', market: '', seriesType: '', symbols: '', timePeriod: '', toCurrency: '');
  }

  Future<JSONObject> getWeeklyAdjusted(String symbol, {required String outputsize}) async {
    return this.getRequest(function: _weeklyAdjusted, symbol: symbol, outputsize: outputsize, fromCurrency: '', interval: '', market: '', seriesType: '', symbols: '', timePeriod: '', toCurrency: '');
  }

  Future<JSONObject> getMonthly(String symbol, {required String outputsize}) async {
    return this.getRequest(function: _monthly, symbol: symbol, outputsize: outputsize, fromCurrency: '', market: '', seriesType: '', symbols: '', timePeriod: '', toCurrency: '', interval: '');
  }

  Future<JSONObject> getMonthlyAdjusted(String symbol, {required String outputsize}) async {
    return this.getRequest(function: _monthlyAdjusted, symbol: symbol, outputsize: outputsize, fromCurrency: '', market: '', seriesType: '', symbols: '', timePeriod: '', toCurrency: '', interval: '');
  }

  Future<JSONObject> getBatchStockQuotes(String symbols, {required String outputsize}) async {
    return this.getRequest(function: _batchStockQuotes, symbols:  symbols, outputsize: outputsize, fromCurrency: '', market: '', seriesType: '', timePeriod: '', toCurrency: '', interval: '', symbol: '');
  }
}