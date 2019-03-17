import 'package:flutter/material.dart';

import '../widgets/DrawerLogged.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: LoggedDrawer(),
      appBar: AppBar(
          centerTitle: true,
        backgroundColor: Color.fromRGBO(94, 37, 99, 1),),
      body: Container(
        child: RaisedButton(child: Text('Go back'), onPressed: () {
          Navigator.pushReplacementNamed(context, '/simulation');
        }),
      ),
    );
  }
}
