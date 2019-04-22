import "dart:async" show Future;
import "package:flutter/services.dart" show rootBundle;
import "dart:convert";
import "../models/cashFlows.dart";

Future<String> _loadCashFlowAsset() async {
  return await rootBundle.loadString('lib/assets/cashFlows.json');
}

Future loadCashFlow() async {
  String jsonPhotos = await _loadCashFlowAsset();
  final jsonResponse = json.decode(jsonPhotos);
  CashFlowsList cashFlowsList = CashFlowsList.fromJson(jsonResponse);
  print("photos " + cashFlowsList.cashFlows[0].purchase);

  return cashFlowsList.cashFlows;
}
