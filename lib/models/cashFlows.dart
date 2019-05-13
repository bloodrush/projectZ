class CashFlowsList {
  final List<CashFlow> cashFlows;

  CashFlowsList({
    this.cashFlows,
  });

  factory CashFlowsList.fromJson(List<dynamic> parsedJson) {
    List<CashFlow> cashFlows = new List<CashFlow>();
    cashFlows = parsedJson.map((i) => CashFlow.fromJson(i)).toList();

    return new CashFlowsList(cashFlows: cashFlows);
  }
}

class CashFlow {
  final int offset;
  final List<FlowModel> flows;

  CashFlow({this.offset, this.flows});

  factory CashFlow.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['flows'] as List;
    List<FlowModel> flows = list.map((i) => FlowModel.fromJson(i)).toList();
    return CashFlow(offset: parsedJson['offset'], flows: flows);
  }
}

class FlowModel {
  final String date;
  final String purchase;
  final String loc;
  final double price;

  FlowModel({this.date, this.purchase, this.price,this.loc});

  factory FlowModel.fromJson(Map<String, dynamic> parsedJson) {
    return FlowModel(
        date: parsedJson['date'],
        purchase: parsedJson['purch'],
        price: parsedJson['price'] as double,
        loc: parsedJson['loc']);
  }
}
