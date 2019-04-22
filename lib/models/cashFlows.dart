class CashFlowModel {
  final String date;
  final String purchase;
  final int price;

  CashFlowModel({this.date, this.purchase, this.price});

  factory CashFlowModel.fromJson(Map<String, dynamic> parsedJSON) {
    return CashFlowModel(
        date: parsedJSON['date'],
        purchase: parsedJSON['purch'],
        price: parsedJSON['price']);
  }
}

class CashFlowsList {
  final List<CashFlowModel> cashFlows;

  CashFlowsList({this.cashFlows});

  factory CashFlowsList.fromJson(List<dynamic> parsedJson) {
    List<CashFlowModel> cashFlows = new List<CashFlowModel>();
    cashFlows = parsedJson.map((i) => CashFlowModel.fromJson(i)).toList();

    return new CashFlowsList(
      cashFlows: cashFlows,
    );
  }
}
