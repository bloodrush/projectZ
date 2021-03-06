import 'package:flutter/material.dart';
import '../widgets/DrawerLogged.dart';

class SimulationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SimulationPageState();
}

class _SimulationPageState extends State<SimulationPage> {
  String typeValue = 'CREDIT';
  String baremeValue = 'MONTHLY';
  String performanceValue = '';
  String insuranceValue = '';
  double amountMin = 6000.0;
  double amountMax = 25000.0;
  double amountValue = 12000.0;
  double installmentMin = 50.0;
  double installmentMax = 300.0;
  double installmentValue = 250.0;
  double durationMin = 12;
  double durationMax = 60;
  double durationValue = 32;

  dynamic _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Leasing simulation"),
          content: new Text("Do you confirm you chose this plan?"),
          actions: <Widget>[
            Row(
              children: <Widget>[
                new FlatButton(
                  child: new Text("Close"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                new FlatButton(
                  child: new Text("Confirm"),
                  onPressed: () {
                    Navigator.pushNamed(context, '/form');
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
//    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: LoggedDrawer(),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color.fromRGBO(94, 37, 99, 1),
          title: Text('Simulation'),
        ),
        body: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Type of financing'),
                      Container(
                          width: 200.0,
                          child: DropdownButton<String>(
                            isExpanded: true,
                            value: typeValue,
                            onChanged: (String newValue) {
                              setState(() {
                                typeValue = newValue;
                              });
                            },
                            items: <String>[
                              'CREDIT',
                              'CREDIT BAIL ',
                              'LOA',
                              'LLD',
                              'RESERVES OXYGEN'
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Scale'),
                      Container(
                          width: 200.0,
                          child: DropdownButton<String>(
                            isExpanded: true,
                            value: baremeValue,
                            onChanged: (String newValue) {
                              setState(() {
                                baremeValue = newValue;
                              });
                              if (newValue == 'TRIMONTHLY') {
                                setState(() {
                                  installmentMax = 900;
                                });
                              } else {
                                setState(() {
                                  installmentMax = 600;
                                });
                              }
                            },
                            items: <String>[
                              'MONTHLY',
                              'TRIMONTHLY',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Performance list'),
                      Container(
                          width: 200.0,
                          child: DropdownButton<String>(
                            isExpanded: true,
                            value: performanceValue,
                            onChanged: (String newValue) {
                              setState(() {
                                performanceValue = newValue;
                              });
                            },
                            items: <String>[
                              '',
                              'MAINTENANCE',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Insurance'),
                      Container(
                          width: 200.0,
                          child: DropdownButton<String>(
                            isExpanded: true,
                            value: insuranceValue,
                            onChanged: (String newValue) {
                              setState(() {
                                insuranceValue = newValue;
                              });
                            },
                            items: <String>['', 'DAMAGE INSURANCE']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('FDG'),
                      Container(
                        alignment: Alignment.centerLeft,
                        width: 200.0,
                        child: Checkbox(value: true, onChanged: (test) {}),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Divider(
                      color: Color.fromRGBO(94, 37, 99, 1),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        // Add one stop for each color. Stops should increase from 0 to 1
                        stops: [0.1, 0.8],
                        colors: [
                          // Colors are easy thanks to Flutter's Colors class.
                          Color.fromRGBO(101, 121, 155, 1),
                          Color.fromRGBO(94, 37, 99, 1)
                        ],
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(Icons.monetization_on),
                                  onPressed: (() => null),
                                  color: Colors.white,
                                  iconSize: 36.0,
                                ),
                                Text(
                                  'Amount',
                                  style: TextStyle(color: Colors.blueGrey[100]),
                                ),
                                Text(amountValue.toStringAsFixed(2),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18.0)),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(Icons.history),
                                  onPressed: (() => null),
                                  color: Colors.white,
                                  iconSize: 36.0,
                                ),
                                Text(
                                  'Installment',
                                  style: TextStyle(color: Colors.blueGrey[100]),
                                ),
                                Text(installmentValue.toStringAsFixed(2),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18.0)),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(Icons.calendar_today),
                                  onPressed: (() => null),
                                  color: Colors.white,
                                  iconSize: 36.0,
                                ),
                                Text(
                                  'Duration',
                                  style: TextStyle(color: Colors.blueGrey[100]),
                                ),
                                Text(durationValue.toInt().toString(),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18.0)),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(Icons.functions),
                                  onPressed: (() => null),
                                  color: Colors.white,
                                  iconSize: 36.0,
                                ),
                                Text(
                                  'Total',
                                  style: TextStyle(color: Colors.blueGrey[100]),
                                ),
                                Text((amountValue * 1.1).toStringAsFixed(2),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18.0)),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Divider(
                      color: Color.fromRGBO(94, 37, 99, 1),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.only(bottom: 5.0, top: 25.0),
                      child: Column(
                        children: <Widget>[
                          Slider(
                            divisions: 15,
                            activeColor: Color.fromRGBO(94, 37, 99, 1),
                            label: 'Amount: ' + amountValue.toStringAsFixed(2),
                            min: amountMin,
                            max: amountMax,
                            onChanged: (newRating) =>
                                setState(() => amountValue = newRating),
                            value: amountValue,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(amountMin.toString()),
                              Text('Amount'),
                              Text(amountMax.toString())
                            ],
                          ),
                        ],
                      )),
                  Container(
                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      child: Column(
                        children: <Widget>[
                          Slider(
                            activeColor: Color.fromRGBO(94, 37, 99, 1),
                            label:
                                'Installment: ' + installmentValue.toString(),
                            min: installmentMin,
                            max: installmentMax,
                            onChanged: (newInstallment) => setState(
                                () => installmentValue = newInstallment),
                            value: installmentValue,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(installmentMin.toString()),
                              Text('Installment'),
                              Text(installmentMax.toString())
                            ],
                          ),
                        ],
                      )),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5.0),
                    child: Column(
                      children: <Widget>[
                        Slider(
                          divisions: 48,
                          activeColor: Color.fromRGBO(94, 37, 99, 1),
                          label:
                              'Duration: ' + durationValue.toInt().toString(),
                          min: durationMin,
                          max: durationMax,
                          onChanged: (newDuration) =>
                              setState(() => durationValue = newDuration),
                          value: durationValue,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(durationMin.toInt().toString()),
                            Text('Duration'),
                            Text(durationMax.toInt().toString())
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.only(top: 20.0),
                          child: RaisedButton(
                              color: Color.fromRGBO(94, 37, 99, 1),
                              child: Text(
                                'AGREE & CONTINUE',
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: _showDialog)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
