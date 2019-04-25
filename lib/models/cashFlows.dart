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
  final List<Flow> flows;

  CashFlow({this.offset, this.flows});

  factory CashFlow.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['flows'] as List;
    List<Flow> flows = list.map((i) => Flow.fromJson(i)).toList();
    return CashFlow(offset: parsedJson['offset'], flows: flows);
  }
}

class Flow {
  final String date;
  final String purchase;
  final int price;

  Flow({this.date, this.purchase, this.price});

  factory Flow.fromJson(Map<String, dynamic> parsedJson) {
    return Flow(
        date: parsedJson['date'],
        purchase: parsedJson['purch'],
        price: parsedJson['price']);
  }
}
