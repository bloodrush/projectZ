import 'package:flutter/material.dart';
import '../widgets/DrawerLogged.dart';
import 'dart:math' as math;

class RequestPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RequestPageState();
}

class RequestPageState extends State<RequestPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

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
        builder: (context, child) => Column(
              children: <Widget>[
                new Summary(controller: _controller),
              ],
            ),
        animation: _controller,
      ),
    );
  }
}

class Summary extends StatelessWidget {
  final AnimationController controller;
  final Animation opacity;
  final Animation zoom;

  Summary({Key key, this.controller})
      : opacity = Tween<double>(begin: 0.5, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.000,
              0.500,
              curve: Curves.linear,
            ),
          ),
        ),
        zoom = Tween<double>(begin: 0.4, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.0,
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
          margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 405.0),
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
