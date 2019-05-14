import 'package:flutter/material.dart';
import 'package:project_z/widgets/DrawerLogged.dart';

class ContactsPage extends StatefulWidget {
  @override
  ContactsPageState createState() => ContactsPageState();
}

class ContactsPageState extends State<ContactsPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color.fromRGBO(94, 37, 99, 1),
          title: Text('Contacts'),
        ),
        drawer: LoggedDrawer(),
        body: Text('Contacts', style: TextStyle(fontSize: 18.0)));
  }
}
