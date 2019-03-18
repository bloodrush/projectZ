import 'package:flutter/material.dart';

// import '../widgets/DrawerLogged.dart';
import '../widgets/DrawerLogged.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FormPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: LoggedDrawer(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromRGBO(94, 37, 99, 1),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(''),
            Text('CLIENT INFO', style: TextStyle(fontSize: 18.0)),
            Text(
              '',
              style: TextStyle(fontSize: 18.0),
            )
          ],
        ),
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
                    Text('First name'),
                    Container(
                      width: 200.0,
                      child: TextField(
                        textCapitalization: TextCapitalization.words,
                        autofocus: true,
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Family name'),
                    Container(
                      width: 200.0,
                      child: TextField(
                          textCapitalization: TextCapitalization.words),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Age'),
                    Container(
                      width: 200.0,
                      child: TextField(
                        textCapitalization: TextCapitalization.words,
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Country'),
                    Container(
                        width: 200.0,
                        child: TextField(
                            textCapitalization: TextCapitalization.words,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(Icons.search),
//                                onPressed: _showDialog(),
                              ),
                            )
                        )
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('State'),
                    Container(
                      width: 200.0,
                      child: TextField(
                          textCapitalization: TextCapitalization.words),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('City'),
                    Container(
                      width: 200.0,
                      child: TextField(
                          textCapitalization: TextCapitalization.words),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Post code'),
                    Container(
                      width: 200.0,
                      child: TextField(),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Address'),
                    Container(
                      width: 200.0,
                      child: TextField(
                        maxLength: 40,
                      ),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                      child: Checkbox(value: false, onChanged: (test) {}),
                    ),
                    Text('Agree with the terms and conditions')
                  ],
                ),
                Container(
                    margin: EdgeInsets.only(top: 20.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          RaisedButton(
                            color: Color.fromRGBO(94, 37, 99, 1),
                            child: Text(
                              'GO BACK TO SIMULATION',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, '/simulation');
                            },
                          ),
                          RaisedButton(
                            color: Color.fromRGBO(94, 37, 99, 1),
                            child: Text(
                              'SUBMIT',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              final snackBar = SnackBar(
                                  content:
                                  Text('You request has been submitted.'));
                              _scaffoldKey.currentState.showSnackBar(snackBar);
                            },
                          )
                        ])),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Alert Dialog title"),
          content: new Text("Alert Dialog body"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
    return null;
  }
}
