import 'package:flutter/material.dart';
import '../widgets/DrawerLogged.dart';

class StatementsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StatementsPageState();
}

class StatementsPageState extends State<StatementsPage> {
  String account = '1804040013';
  String contractNumber = 'GB13645';
  double totalOutstanding = 5500.00;
  double deductions = 1100.00;
  double fiu = 114.00;
  double availableAmt = 4286.00;

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      drawer: LoggedDrawer(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromRGBO(94, 37, 99, 1),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(''),
            Text('STATEMENTS', style: TextStyle(fontSize: 18.0)),
            Text(
              '',
              style: TextStyle(fontSize: 18.0),
            )
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(bottom: 5.0, top: 5.0),
            margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
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
                    value: account,
                    onChanged: (String newValue) {
                      setState(() {
                        account = newValue;
                      });
//                      if (newValue == '1804040014') {
//                        setState(() {
//                          totalOutstanding = 900;
//                        });
//                      } else {
//                        setState(() {
//                          totalOutstanding = 600;
//                        });
//                      }
                    },
                    items: <String>[
                      '1804040013',
                      '1804040014',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  )),
            ],
          ),
          Card(
            child: Column(
              children: <Widget>[
                Text(
                  'ACCOUNTS SUMMARY',
                  style: TextStyle(
                      color: Colors.black45, fontWeight: FontWeight.w600),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Divider(
                    color: Color.fromRGBO(94, 37, 99, 1),
                  ),
                ),
                Text('8 184.45',
                    style: TextStyle(color: Color.fromRGBO(94, 37, 99, 1), fontSize: 36.0)),
                Text('Available amount',
                    style: TextStyle(color: Color.fromRGBO(94, 37, 99, 1), fontSize: 18.0)),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Divider(
                    color: Color.fromRGBO(94, 37, 99, 1),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text('371 970.00',
                            style:
                            TextStyle(color: Color.fromRGBO(101, 121, 155, 1), fontSize: 18.0)),
                        Text('Total outstanding',
                            style:
                            TextStyle(color: Color.fromRGBO(101, 121, 155, 1), fontSize: 12.0)),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text('61 365.93',
                            style:
                            TextStyle(color: Color.fromRGBO(101, 121, 155, 1), fontSize: 18.0)),
                        Text('Deductions',
                            style:
                            TextStyle(color: Color.fromRGBO(101, 121, 155, 1), fontSize: 12.0)),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text('295 339.67',
                            style:
                            TextStyle(color: Color.fromRGBO(101, 121, 155, 1), fontSize: 18.0)),
                        Text('Funds in use',
                            style:
                            TextStyle(color: Color.fromRGBO(101, 121, 155, 1), fontSize: 12.0)),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text('GB13404',
                            style:
                            TextStyle(color: Color.fromRGBO(101, 121, 155, 1), fontSize: 18.0)),
                        Text('Contract number',
                            style:
                            TextStyle(color: Color.fromRGBO(101, 121, 155, 1), fontSize: 12.0)),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text('Classical',
                            style:
                            TextStyle(color: Color.fromRGBO(101, 121, 155, 1), fontSize: 18.0)),
                        Text('Type',
                            style:
                            TextStyle(color: Color.fromRGBO(101, 121, 155, 1), fontSize: 12.0)),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text('EUR',
                            style:
                            TextStyle(color: Color.fromRGBO(101, 121, 155, 1), fontSize: 18.0)),
                        Text('Currency',
                            style:
                            TextStyle(color: Color.fromRGBO(101, 121, 155, 1), fontSize: 12.0)),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text('FLIP FLOPS LIMITED',
                            style:
                            TextStyle(color: Color.fromRGBO(101, 121, 155, 1), fontSize: 18.0)),
                        Text('Client',
                            style:
                            TextStyle(color: Color.fromRGBO(101, 121, 155, 1), fontSize: 12.0)),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text('ASSURIX',
                            style:
                            TextStyle(color: Color.fromRGBO(101, 121, 155, 1), fontSize: 18.0)),
                        Text('Debtor',
                            style:
                            TextStyle(color: Color.fromRGBO(101, 121, 155, 1), fontSize: 12.0)),
                      ],
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
