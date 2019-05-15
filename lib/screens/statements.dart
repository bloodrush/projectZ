import 'package:flutter/material.dart';
import '../widgets/DrawerLogged.dart';
import './request.dart';

class StatementsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StatementsPageState();
}

class _StatementsPageState extends State<StatementsPage> {
  String _account = 'US00235 / 1804040013';
  double _availableAmt = 8144.00;
  double _totalOutstanding = 10563.00;
  double _deductions = 220.00;
  double _fiu = 199.00;
  String _contractNumber = 'GB13645';
  String _type = 'Classical';
  String _currency = 'EUR';
  String _client = 'Flip Flop Limited';
  String _supplier = 'ASSURIX';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: LoggedDrawer(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromRGBO(94, 37, 99, 1),
        title: Text('Statements'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(bottom: 5.0, top: 5.0),
            margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0)),
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'AGGREGATED ACCOUNTS SUMMARY',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Divider(
                    color: Colors.white,
                  ),
                ),
                Text('15 264.45',
                    style: TextStyle(color: Colors.white, fontSize: 36.0)),
                Text('Real availability',
                    style: TextStyle(color: Colors.white, fontSize: 18.0)),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Divider(
                    color: Colors.white,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text('371 970.00',
                            style:
                                TextStyle(color: Colors.white, fontSize: 18.0)),
                        Text('Total outstanding',
                            style:
                                TextStyle(color: Colors.white, fontSize: 12.0)),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text('61 365.93',
                            style:
                                TextStyle(color: Colors.white, fontSize: 18.0)),
                        Text('Deductions',
                            style:
                                TextStyle(color: Colors.white, fontSize: 12.0)),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text('295 339.67',
                            style:
                                TextStyle(color: Colors.white, fontSize: 18.0)),
                        Text('Funds in use',
                            style:
                                TextStyle(color: Colors.white, fontSize: 12.0)),
                      ],
                    ),
                  ],
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text('Select account'),
              Container(
                  child: DropdownButton<String>(
                value: _account,
                onChanged: (String newValue) {
                  setState(() {
                    _account = newValue;
                  });

                  switch (newValue) {
                    case 'US00452 / 1804040014':
                      setState(() {
                        _availableAmt = 4286.00;
                        _totalOutstanding = 5500.00;
                        _deductions = 1100.00;
                        _fiu = 114.00;
                        _contractNumber = 'GB13404';
                        _type = 'Classical';
                        _currency = 'EUR';
                        _client = 'Doogo shoes LTD';
                        _supplier = 'FACTORIX';
                      });
                      break;
                    case 'US00235 / 1804040013':
                      setState(() {
                        _availableAmt = 8144.00;
                        _totalOutstanding = 10563.00;
                        _deductions = 220.00;
                        _fiu = 199.00;
                        _contractNumber = 'GB13645';
                        _type = 'Classical';
                        _currency = 'EUR';
                        _client = 'Flip Flop Limited';
                        _supplier = 'ASSURIX';
                      });
                      break;
                    case 'US00333 / 1804050003':
                      setState(() {
                        _availableAmt = 1244.00;
                        _totalOutstanding = 122.12;
                        _deductions = 13.00;
                        _fiu = 223.00;
                        _contractNumber = 'GB12129';
                        _type = 'Classical';
                        _currency = 'EUR';
                        _client = 'Flip Flop Limited';
                        _supplier = 'ASSURIX';
                      });
                  }
                },
                items: <String>[
                  'US00235 / 1804040013',
                  'US00452 / 1804040014',
                  'US00333 / 1804050003',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              )),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Divider(
              color: Color.fromRGBO(94, 37, 99, 1),
            ),
          ),
          Card(
            margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
            elevation: 4.0,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                  width: double.infinity,
                  child: Container(
                    color: Color.fromRGBO(94, 37, 99, 1),
                    child: Text(
                      'ACCOUNTS SUMMARY',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Text(_availableAmt.toStringAsFixed(2),
                    style: TextStyle(
                        color: Color.fromRGBO(94, 37, 99, 1), fontSize: 36.0)),
                Text('Available amount',
                    style: TextStyle(
                        color: Color.fromRGBO(94, 37, 99, 1), fontSize: 18.0)),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Divider(
                    color: Color.fromRGBO(94, 37, 99, 1),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: <Widget>[
                          Text(_totalOutstanding.toStringAsFixed(2),
                              style: TextStyle(
                                  color: Color.fromRGBO(101, 121, 155, 1),
                                  fontSize: 18.0)),
                          Text('Total outstanding',
                              style: TextStyle(
                                  color: Color.fromRGBO(101, 121, 155, 1),
                                  fontSize: 12.0)),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: <Widget>[
                          Text(_deductions.toStringAsFixed(2),
                              style: TextStyle(
                                  color: Color.fromRGBO(101, 121, 155, 1),
                                  fontSize: 18.0)),
                          Text('Deductions',
                              style: TextStyle(
                                  color: Color.fromRGBO(101, 121, 155, 1),
                                  fontSize: 12.0)),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: <Widget>[
                          Text(_fiu.toStringAsFixed(2),
                              style: TextStyle(
                                  color: Color.fromRGBO(101, 121, 155, 1),
                                  fontSize: 18.0)),
                          Text('Funds in use',
                              style: TextStyle(
                                  color: Color.fromRGBO(101, 121, 155, 1),
                                  fontSize: 12.0)),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: <Widget>[
                          Text(_contractNumber,
                              style: TextStyle(
                                  color: Color.fromRGBO(101, 121, 155, 1),
                                  fontSize: 18.0)),
                          Text('Contract number',
                              style: TextStyle(
                                  color: Color.fromRGBO(101, 121, 155, 1),
                                  fontSize: 12.0)),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: <Widget>[
                          Text(_type,
                              style: TextStyle(
                                  color: Color.fromRGBO(101, 121, 155, 1),
                                  fontSize: 18.0)),
                          Text('Contract type',
                              style: TextStyle(
                                  color: Color.fromRGBO(101, 121, 155, 1),
                                  fontSize: 12.0)),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: <Widget>[
                          Text(_currency,
                              style: TextStyle(
                                  color: Color.fromRGBO(101, 121, 155, 1),
                                  fontSize: 18.0)),
                          Text('Currency',
                              style: TextStyle(
                                  color: Color.fromRGBO(101, 121, 155, 1),
                                  fontSize: 12.0)),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: <Widget>[
                          Text(_client,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color.fromRGBO(101, 121, 155, 1),
                                  fontSize: 18.0)),
                          Text('Client',
                              style: TextStyle(
                                  color: Color.fromRGBO(101, 121, 155, 1),
                                  fontSize: 12.0)),
                        ],
                      ),
                    ),
                    // Expanded(
                    //   flex: 1,
                    //   child: Column(
                    //     children: <Widget>[
                    //       Text(_supplier,
                    //           style: TextStyle(
                    //               color: Color.fromRGBO(101, 121, 155, 1),
                    //               fontSize: 18.0)),
                    //       Text('Supplier',
                    //           style: TextStyle(
                    //               color: Color.fromRGBO(101, 121, 155, 1),
                    //               fontSize: 12.0)),
                    //     ],
                    //   ),
                    // ),
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: RaisedButton(
                child: Text(
                  'REQUEST FUNDING',
                  style: TextStyle(color: Colors.white),
                ),
                color: Color.fromRGBO(94, 37, 99, 1),
                splashColor: Colors.white,
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RequestPage(
                            account: _account,
                            availableAmt: _availableAmt,
                            client: _client,
                            contractNumber: _contractNumber,
                            currency: _currency,
                            deductions: _deductions,
                            fiu: _fiu,
                            supplier: _supplier,
                            totalOutstanding: _totalOutstanding,
                            type: _type,
                          ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
