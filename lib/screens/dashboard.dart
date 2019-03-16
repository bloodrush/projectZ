import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Image.asset(
            'images/logo-locam.png',
            height: 30.0,
          )),
      body: Container(
        child: RaisedButton(child: Text('Go back'), onPressed: null),
      ),
    );
  }
}
