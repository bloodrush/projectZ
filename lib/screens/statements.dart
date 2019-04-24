import 'package:flutter/material.dart';
import '../widgets/DrawerLogged.dart';

class StatementsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StatementsPageState();
}

class StatementsPageState extends State<StatementsPage> {
  String account = '1804040013';
  double availableAmt = 8144.00;
  double totalOutstanding = 2345.00;
  double deductions = 220.00;
  double fiu = 199.00;
  String contractNumber = 'GB13645';
  String type = 'Classical';
  String currency = 'EUR';
  String client = 'Flip Flop Limited';
  String supplier = 'ASSURIX';




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
      body: Column(
        children: <Widget>[
          Hero(

            tag: 'myHero',
            child:
            Container(
              padding: EdgeInsets.only(bottom: 5.0, top: 5.0),
              margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0), bottomRight: Radius.circular(10.0)),
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

                      switch (newValue) {
                        case '1804040014':
                          setState(() {
                            availableAmt = 4286.00;
                            totalOutstanding = 5500.00;
                            deductions = 1100.00;
                            fiu = 114.00;
                            contractNumber = 'GB13404';
                            type = 'Classical';
                            currency = 'EUR';
                            client = 'Doogo shoes LTD';
                            supplier = 'FACTORIX';
                          });
                          break;
                          case '1804040013':
                          setState(() {
                            availableAmt = 8144.00;
                            totalOutstanding = 2345.00;
                            deductions = 220.00;
                            fiu = 199.00;
                            contractNumber = 'GB13645';
                            type = 'Classical';
                            currency = 'EUR';
                            client = 'Flip Flop Limited';
                            supplier = 'ASSURIX';
                          });
                          break;
                        case '1804050003':
                          setState(() {
                            availableAmt = 1244.00;
                            totalOutstanding = 122.12;
                            deductions = 13.00;
                            fiu = 223.00;
                            contractNumber = 'GB12129';
                            type = 'Classical';
                            currency = 'EUR';
                            client = 'Flip Flop Limited';
                            supplier = 'ASSURIX';
                          });
                      }

                    },
                    items: <String>[
                      '1804040013',
                      '1804040014',
                      '1804050003',
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
                    child:                 Text(
                      'ACCOUNTS SUMMARY',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ),

                ),
                Text(availableAmt.toString(),
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
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: <Widget>[
                          Text(totalOutstanding.toString(),
                              style:
                              TextStyle(color: Color.fromRGBO(101, 121, 155, 1), fontSize: 18.0)),
                          Text('Total outstanding',
                              style:
                              TextStyle(color: Color.fromRGBO(101, 121, 155, 1), fontSize: 12.0)),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: <Widget>[
                          Text(deductions.toString(),
                              style:
                              TextStyle(color: Color.fromRGBO(101, 121, 155, 1), fontSize: 18.0)),
                          Text('Deductions',
                              style:
                              TextStyle(color: Color.fromRGBO(101, 121, 155, 1), fontSize: 12.0)),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: <Widget>[
                          Text(fiu.toString(),
                              style:
                              TextStyle(color: Color.fromRGBO(101, 121, 155, 1), fontSize: 18.0)),
                          Text('Funds in use',
                              style:
                              TextStyle(color: Color.fromRGBO(101, 121, 155, 1), fontSize: 12.0)),
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
                          Text(contractNumber,
                              style:
                              TextStyle(color: Color.fromRGBO(101, 121, 155, 1), fontSize: 18.0)),
                          Text('Contract number',
                              style:
                              TextStyle(color: Color.fromRGBO(101, 121, 155, 1), fontSize: 12.0)),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                    child: Column(
                      children: <Widget>[
                        Text(type,
                            style:
                            TextStyle(color: Color.fromRGBO(101, 121, 155, 1), fontSize: 18.0)),
                        Text('Contract type',
                            style:
                            TextStyle(color: Color.fromRGBO(101, 121, 155, 1), fontSize: 12.0)),
                      ],
                    ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: <Widget>[
                          Text(currency,
                              style:
                              TextStyle(color: Color.fromRGBO(101, 121, 155, 1), fontSize: 18.0)),
                          Text('Currency',
                              style:
                              TextStyle(color: Color.fromRGBO(101, 121, 155, 1), fontSize: 12.0)),
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
                          Text(client,
                              textAlign: TextAlign.center,
                              style:
                              TextStyle(color: Color.fromRGBO(101, 121, 155, 1), fontSize: 18.0)),
                          Text('Client',
                              style:
                              TextStyle(color: Color.fromRGBO(101, 121, 155, 1), fontSize: 12.0)),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: <Widget>[
                          Text(supplier,
                              style:
                              TextStyle(color: Color.fromRGBO(101, 121, 155, 1), fontSize: 18.0)),
                          Text('Supplier',
                              style:
                              TextStyle(color: Color.fromRGBO(101, 121, 155, 1), fontSize: 12.0)),
                        ],
                      ),
                    )

                    ,
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: RaisedButton(
                child: Text('REQUEST FUNDING', style: TextStyle(color: Colors.white),),
                color: Color.fromRGBO(94, 37, 99, 1),
                onPressed: () {
                  Navigator.pushNamed(context, '/request');
                }),
          ),
        ],
      ),
    );
  }
}
