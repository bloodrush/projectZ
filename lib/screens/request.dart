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
    _controller =
        AnimationController(duration: Duration(milliseconds: 2200), vsync: this)
          ..repeat();

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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(''),
            Text('REQUEST FINANCING', style: TextStyle(fontSize: 18.0)),
            Text(
              '',
              style: TextStyle(fontSize: 18.0),
            )
          ],
        ),
      ),
      body: AnimatedBuilder(
        builder: (context, child) => ListView(
              children: <Widget>[
                Summary(controller: _controller),
                Middle(controller: _controller),
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

  Summary({Key key, this.controller})
      : opacity = Tween<double>(begin: 0.0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.05,
              0.500,
              curve: Curves.linear,
            ),
          ),
        ),
        zoom = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.05,
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
          margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 50.0),
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
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
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
            ],
          ),
        ),
      ),
      scale: zoom.value,
    );
  }
}

class Middle extends StatelessWidget {
  final AnimationController controller;
  final Animation opacity;
  final Animation zoom;

  Middle({Key key, this.controller})
      : opacity = Tween<double>(begin: 0.3, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.150,
              0.650,
              curve: Curves.linear,
            ),
          ),
        ),
        zoom = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.150,
              0.650,
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
        child: InkWell(
          onTap: () {
            print('tab');
            controller.reverse();
          },
          child: Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(bottom: 5.0, top: 5.0),
            margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 50.0),
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
                  'Middle Container',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
      ),
      scale: zoom.value,
    );
  }
}

class Bottom extends StatelessWidget {
  final AnimationController controller;
  final Animation opacity;
  final Animation zoom;

  Bottom({Key key, this.controller})
      : opacity = Tween<double>(begin: 0.3, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.250,
              0.850,
              curve: Curves.linear,
            ),
          ),
        ),
        zoom = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.250,
              0.850,
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
          height: 100,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(bottom: 5.0, top: 5.0),
          margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 50.0),
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
                'Bottom Container',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
      scale: zoom.value,
    );
  }
}

class CustomButton extends StatelessWidget {
  final GestureTapCallback onTab;

  const CustomButton({Key key, this.onTab}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RawMaterialButton(
      fillColor: Colors.grey[400],
      splashColor: Colors.deepPurple[200],
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            SizedBox(
              width: 10.0,
            ),
            Text('Back',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold))
          ],
        ),
      ),
      onPressed: () {
        onTab();
      },
    );
  }
}
