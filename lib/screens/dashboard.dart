import 'package:flutter/material.dart';
import '../widgets/DrawerLogged.dart';

class Dashboard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Dashboard();
}

class _Dashboard extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: true,
      drawer: LoggedDrawer(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromRGBO(94, 37, 99, 1),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(''),
            Text('DASHBOARD', style: TextStyle(fontSize: 18.0)),
            Text(
              '',
              style: TextStyle(fontSize: 18.0),
            )
          ],
        ),
      ),
    );
  }
}
