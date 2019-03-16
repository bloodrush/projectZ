import 'package:flutter/material.dart';

String typeValue = 'CREDIT';
String baremeValue = 'MONTHLY';
String performanceValue = '';
String insuranceValue = '';

class SimulationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SimulationPageState();
}

class _SimulationPageState extends State<SimulationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: (() => null),
              color: Colors.white,
              alignment: Alignment.centerLeft,
              iconSize: 32.0,
            ),
            Text('SIMULATION', style: TextStyle(fontSize: 18.0)),
            Text(
              '',
              style: TextStyle(fontSize: 18.0),
            )
          ],
        ),
      ),
      body:
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
                        child:
                    DropdownButton<String>(
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
                        child:
                        DropdownButton<String>(
                          isExpanded: true,
                          value: baremeValue,
                          onChanged: (String newValue) {
                            setState(() {
                              baremeValue = newValue;
                            });
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
                        child:
                        DropdownButton<String>(
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
                        child:
                        DropdownButton<String>(
                          isExpanded: true,
                          value: insuranceValue,
                          onChanged: (String newValue) {
                            setState(() {
                              insuranceValue = newValue;
                            });
                          },
                          items: <String>[
                            '',
                            'DAMAGE INSURANCE'
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
                    Text('FDG'),
                    Container(
                      alignment: Alignment.centerLeft,
                        width: 200.0,
                        child:
                        Checkbox(value: true, onChanged: null),
                    )
                  ],
                ),
                Container(padding: EdgeInsets.symmetric(horizontal: 20.0), child: Divider( color: Colors.red,),)

              ],
            ),
      ),
    );
  }
}
