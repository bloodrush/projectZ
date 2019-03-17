import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:scoped_model/scoped_model.dart';
import '../models/auth.dart';


class LoggedDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  ScopedModelDescendant<AuthModel>(
      builder: (context, child, auth) =>  
      Drawer(
          child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                    child: Column(children: <Widget>[
                        Image.asset('lib/assets/images/user.png',height: 90.0,),
                        Center(child:   
                          Row(children: <Widget>[
                            Text(auth.fistName,style: TextStyle(color: Colors.white),),
                            Text(' '),
                            Text(auth.lastName,style: TextStyle(color: Colors.white),)
                        ],),),
                        Text(auth.email,style: TextStyle(color: Colors.white),)
                    ],),
                  
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      // Add one stop for each color. Stops should increase from 0 to 1
                      stops: [0.1, 0.8],
                      colors: [
                        // Colors are easy thanks to Flutter's Colors class.
                          Color.fromRGBO(101, 121, 155, 1),
                          Color.fromRGBO(94, 37, 99, 1)
                      ],
                    ),
                  ),
                ),
                ListTile(
                  title: Row(      
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(FontAwesomeIcons.signOutAlt),
                      Text('Log out',style:  TextStyle(fontSize: 20),)
                  ],),
                  onTap: () {
                      auth.logout();
                      Navigator.pushReplacementNamed(context, '/');
                  },
                ),
              ],
            ),
        ),
      
      ); 
  }
  
}




