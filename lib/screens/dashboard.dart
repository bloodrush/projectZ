import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Project Z'),
      ),
      body: Container(
        child: RaisedButton(
            child: Text('Go back'),
            onPressed: null),
      ),
    );
  }

}