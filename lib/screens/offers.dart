import 'package:flutter/material.dart';
import '../widgets/DrawerLogged.dart';

class OffersPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _OffersState();
}

class _OffersState extends State<OffersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Color.fromRGBO(94, 37, 99, 1),
            title: Center(
              child: Text('OFFERS'),
            )),
        drawer: LoggedDrawer(),
        body: Center(child: Text('hello from Offers page')));
  }
}
