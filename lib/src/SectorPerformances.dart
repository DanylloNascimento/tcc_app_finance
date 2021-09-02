
import 'dart:async';

import 'package:app_acoesfinancas/alpha_vantage_package.dart';
import 'package:app_acoesfinancas/src/BaseAPI.dart';



class SectorPerformances extends BaseAPI {

  SectorPerformances(String key) : super(key);

  Future<JSONObject> getSectorPerformances() {
    return this.getRequest(function: "SECTOR", fromCurrency: '', interval: '', market: '', outputsize: '', seriesType: '', symbol: '', symbols: '', timePeriod: '', toCurrency: '');
  }
}