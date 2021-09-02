import 'dart:async';
import 'dart:convert';

import 'package:app_acoesfinancas/alpha_vantage_package.dart';
import 'package:app_acoesfinancas/src/alpha_vantage_client.dart';
import 'package:http/http.dart';

class BaseAPI {
  var client = AlphaVantageClient.internal();

  late String _apiKey;
  late Map<String, String> queryParams;

  BaseAPI(String key) {
    this._apiKey = key;
    this.queryParams = new Map();
  }

  String get apiKey => this._apiKey;

  set apiKey(String value) => this._apiKey = value;

  get getQueryParams => this.queryParams;

  set setQueryParams(queryParams) => this.queryParams = queryParams;

  String getAPIKey() {
    return this._apiKey;
  }

  Future<JSONObject> getRequest(
      {required String function,
      required String symbol,
      required String interval,
      required String outputsize,
      required String symbols,
      required String fromCurrency,
      required String toCurrency,
      required String market,
      required String timePeriod,
      required String seriesType}) async {
    Response response = await this.client.get(
        function: function,
        symbol: symbol,
        symbols: symbols,
        interval: interval,
        outputsize: outputsize,
        apiKey: this.getAPIKey(),
        fromCurrency: fromCurrency,
        toCurrency: toCurrency,
        market: market,
        timePeriod: timePeriod,
        seriesType: seriesType);

    _validateResponse(response);
    return JSONObject(response.body);
  }

  void _validateResponse(Response response) {
    if (response.statusCode != 200) {
      throw Exception(
          "Failed to get data from alpha vantage server. Response from server:" +
              response.body.toString());
    }
  }

  Map<String, dynamic> toJson(Response response) {
    if (response.statusCode == 200) {
      print(response.body);
      return json.decode(response.body);
    } else {
      throw Exception(
          "Failed to get data from alpha vantage server. Response from server:" +
              response.body.toString());
    }
  }
}
