import 'package:flutter/material.dart';
import '../widgets/DrawerLogged.dart';

class ContactsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
        body: ListView()
        );

  }

}