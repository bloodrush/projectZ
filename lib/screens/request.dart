import 'package:flutter/material.dart';
import '../widgets/DrawerLogged.dart';
import 'dart:async';

import 'statements.dart';

class RequestPage extends StatefulWidget {
  final String account;
  final double availableAmt;
  final double totalOutstanding;
  final double deductions;
  final double fiu;
  final String contractNumber;
  final String type;
  final String currency;
  final String client;
  final String supplier;

  RequestPage(
      {this.account,
      this.availableAmt,
      this.client,
      this.contractNumber,
      this.currency,
      this.deductions,
      this.fiu,
      this.supplier,
      this.totalOutstanding,
      this.type});

  @override
  State<StatefulWidget> createState() => RequestPageState();
}

class RequestPageState extends State<RequestPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: Duration(milliseconds: 2200), vsync: this);

    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();

    _controller.dispose();
  }

  void backToStatements() {
    _controller.reverse().then((f) => {
          Timer(new Duration(milliseconds: 80), () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => StatementsPage()));
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: LoggedDrawer(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromRGBO(94, 37, 99, 1),
        title: Text('Request Funding'),
      ),
      body: AnimatedBuilder(
        builder: (context, child) => ListView(
              children: <Widget>[
                Summary(
                    controller: _controller,
                    availableAmt: widget.availableAmt,
                    totalOutstanding: widget.totalOutstanding,
                    deductions: widget.deductions,
                    fiu: widget.fiu,
                    account: widget.account),
                Middle(
                  controller: _controller,
                  amountMax: widget.availableAmt,
                  amountValue: widget.availableAmt / 2,
                ),
                Bottom(controller: _controller)
              ],
            ),
        animation: _controller,
      ),
      floatingActionButton: CustomButton(
        onTab: backToStatements,
      ),
    );
  }
}

class Summary extends StatelessWidget {
  final AnimationController controller;
  final Animation opacity;
  final Animation zoom;

  final double availableAmt;
  final double totalOutstanding;
  final double deductions;
  final double fiu;
  final String account;

  Summary(
      {Key key,
      this.controller,
      this.availableAmt,
      this.totalOutstanding,
      this.deductions,
      this.fiu,
      this.account})
      : opacity = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0,
              0.500,
              curve: Curves.linear,
            ),
          ),
        ),
        zoom = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0,
              0.500,
              curve: Curves.elasticOut,
            ),
          ),
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      child: Opacity(
        opacity: opacity.value,
        child: Container(
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
                'ACCOUNT SUMMARY',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              ),
              Text(account,
                  style: TextStyle(color: Colors.white, fontSize: 18.0)),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Divider(
                  color: Colors.white,
                ),
              ),
              Text(availableAmt.toStringAsFixed(2),
                  style: TextStyle(color: Colors.white, fontSize: 36.0)),
              Text('Available amount',
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
                      Text(totalOutstanding.toStringAsFixed(2),
                          style:
                              TextStyle(color: Colors.white, fontSize: 18.0)),
                      Text('Total outstanding',
                          style:
                              TextStyle(color: Colors.white, fontSize: 12.0)),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(deductions.toStringAsFixed(2),
                          style:
                              TextStyle(color: Colors.white, fontSize: 18.0)),
                      Text('Deductions',
                          style:
                              TextStyle(color: Colors.white, fontSize: 12.0)),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(fiu.toStringAsFixed(2),
                          style:
                              TextStyle(color: Colors.white, fontSize: 18.0)),
                      Text('Funds in use',
                          style:
                              TextStyle(color: Colors.white, fontSize: 12.0)),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      scale: zoom.value,
    );
  }
}

class Middle extends StatefulWidget {
  final double amountValue;
  final double amountMax;

  final AnimationController controller;
  final Animation opacity;
  final Animation zoom;

  Middle({Key key, this.controller, this.amountMax, this.amountValue})
      : opacity = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.250,
              0.750,
              curve: Curves.linear,
            ),
          ),
        ),
        zoom = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.250,
              0.750,
              curve: Curves.elasticOut,
            ),
          ),
        ),
        super(key: key);

  @override
  State<StatefulWidget> createState() => MiddleState();
}

class MiddleState extends State<Middle> {
  var initValue;
  double sliderValue;
  TextEditingController _myController = TextEditingController();

  @override
  initState() {
    super.initState();
    _myController.text = widget.amountMax.toStringAsFixed(2);
    sliderValue = widget.amountMax;
  }

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      child: Opacity(
        opacity: widget.opacity.value,
        child: InkWell(
          onTap: () {
            // print('tab');
            // widget.controller.reverse();
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(bottom: 5.0, top: 5.0),
            margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    padding: EdgeInsets.only(bottom: 5.0, top: 5.0),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(bottom: 30),
                          child: Column(
                            children: <Widget>[
                              Container(
                                width: 200.0,
                                child: TextFormField(
                                  controller: _myController,
                                  onFieldSubmitted: (e) {
                                    setState(
                                        () => sliderValue = double.tryParse(e));
                                  },
                                  textAlign: TextAlign.center,
                                  autocorrect: false,
                                  keyboardType: TextInputType.number,
                                  style: TextStyle(
                                      color: Color.fromRGBO(94, 37, 99, 1),
                                      fontSize: 36.0),
                                  autofocus: false,
                                ),
                              ),
                              Text('Funding amount',
                                  style: TextStyle(
                                      color: Color.fromRGBO(94, 37, 99, 1),
                                      fontSize: 18.0)),
                            ],
                          ),
                        ),
                        Slider(
                          divisions: 30,
                          activeColor: Color.fromRGBO(94, 37, 99, 1),
                          label: 'Amount: ' + _myController.text,
                          min: 0,
                          max: widget.amountMax,
                          onChanged: (newRating) => {
                                print(newRating),
                                setState(() => sliderValue = newRating),
                                _myController.text =
                                    sliderValue.toStringAsFixed(2)
                              },
                          value: sliderValue,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('0.00'),
                            Text('Amount'),
                            Text(widget.amountMax.toStringAsFixed(2))
                          ],
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
      scale: widget.zoom.value,
    );
  }
}

class Bottom extends StatefulWidget {
  final AnimationController controller;
  final Animation opacity;
  final Animation zoom;

  Bottom({Key key, this.controller})
      : opacity = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.450,
              0.850,
              curve: Curves.linear,
            ),
          ),
        ),
        zoom = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.450,
              0.850,
              curve: Curves.elasticOut,
            ),
          ),
        ),
        super(key: key);

  @override
  State<StatefulWidget> createState() => BottomState();
}

class BottomState extends State<Bottom> {
  var bankAcc;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      child: Opacity(
        opacity: widget.opacity.value,
        child: Container(
          height: 100,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(bottom: 5.0, top: 5.0),
          margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Bank account'),
                  Container(
                      width: 200.0,
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: bankAcc,
//                        onChanged: (String newValue) {
//                          setState(() {
//                            typeValue = newValue;
//                          });
//                        },
                        items: <String>[
                          '9908749871',
                          '1206944571',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String value) {
                          setState(() {
                            bankAcc = value;
                          });
                        },
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
      scale: widget.zoom.value,
    );
  }
}

class CustomButton extends StatelessWidget {
  final GestureTapCallback onTab;

  const CustomButton({Key key, this.onTab}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          RaisedButton(
            color: Color.fromRGBO(94, 37, 99, 1),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text('BACK', style: TextStyle(color: Colors.white))
                ],
              ),
            ),
            onPressed: () {
              onTab();r
            },
          ),
          RaisedButton(
            color: Color.fromRGBO(94, 37, 99, 1),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text('SUBMIT REQUEST', style: TextStyle(color: Colors.white))
                ],
              ),
            ),

            onPressed: () {
              final snackBar = SnackBar(content: Text('You request has been submitted.'),action:SnackBarAction(
              label: 'View',
              onPressed: () {
                // Some code to undo the change!
              },
                 ) ,);
              Scaffold.of(context).showSnackBar(snackBar);
            },

//            onPressed: () {
//              onTab();
//            },
          )
        ]);
  }
}
