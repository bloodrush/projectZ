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
                      Icon(FontAwesomeIcons.info, color: Color.fromRGBO(94, 37, 99, 1) ,),
                      Container( margin: EdgeInsets.only(left:20.0 ), child:Text('Information',style: TextStyle(fontSize: 20),))
                    ],),
                  onTap: () {
                    // Update the state of the app
                    // ...
                  },
                ),
                ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(FontAwesomeIcons.certificate, color: Color.fromRGBO(94, 37, 99, 1) ,),
                      Container( margin: EdgeInsets.only(left:20.0 ), child:Text('Solutions',style: TextStyle(fontSize: 20),))
                    ],),
                  onTap: () {
                    // Update the state of the app
                    // ...
                  },
                ),
                ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(FontAwesomeIcons.exchangeAlt, color: Color.fromRGBO(94, 37, 99, 1) ,),
                      Container( margin: EdgeInsets.only(left:20.0 ), child:Text('Transfer',style: TextStyle(fontSize: 20),))
                    ],),
                  onTap: () {
                    // Update the state of the app
                    // ...
                  },
                ),
                ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(FontAwesomeIcons.quoteRight, color: Color.fromRGBO(94, 37, 99, 1) ,),
                      Container( margin: EdgeInsets.only(left:20.0 ), child:Text('Offers',style: TextStyle(fontSize: 20),))
                    ],),
                  onTap: () {
                    // Update the state of the app
                    // ...
                  },
                ),
                ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(FontAwesomeIcons.calculator, color: Color.fromRGBO(94, 37, 99, 1) ,),
                      Container( margin: EdgeInsets.only(left:20.0 ), child:Text('Calculator',style: TextStyle(fontSize: 20),))

                    ],),
                  onTap: () {
                    // Update the state of the app
                    // ...
                  },
                ),
                ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(FontAwesomeIcons.building, color: Color.fromRGBO(94, 37, 99, 1) ,),
                      Container( margin: EdgeInsets.only(left:20.0 ), child:Text('Offices',style: TextStyle(fontSize: 20),))
                    ],),
                  onTap: () {
                    // Update the state of the app
                    // ...
                  },
                ),
                ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(FontAwesomeIcons.searchLocation, color: Color.fromRGBO(94, 37, 99, 1) ,),
                      Container( margin: EdgeInsets.only(left:20.0 ), child:Text('Contacts',style: TextStyle(fontSize: 20),))
                    ],),
                  onTap: () {
                    // Update the state of the app
                    // ...
                  },
                ),
                Container( padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Divider(),),
                ListTile(
                  title: Row(      
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(FontAwesomeIcons.signOutAlt, color: Color.fromRGBO(94, 37, 99, 1)),
                      Container( margin: EdgeInsets.only(left:20.0 ), child:Text('Log out',style: TextStyle(fontSize: 20),))
                  ],),
                  onTap: () {
                      auth.logout();
                      Navigator.pushReplacementNamed(context, '/');
                  },
                ),
                Container( padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Divider(),),
                Container (margin:EdgeInsets.only(left:10.0, top: 20.0, bottom: 20.0), child: Text('External links:'),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
                  children: <Widget>[
                    Icon(FontAwesomeIcons.home, color: Color.fromRGBO(101, 121, 155, 1) ,),
                    Icon(FontAwesomeIcons.envelope, color: Color.fromRGBO(101, 121, 155, 1) ,),
                    Icon(FontAwesomeIcons.facebook, color: Color.fromRGBO(101, 121, 155, 1) ,),
                    Icon(FontAwesomeIcons.twitter, color: Color.fromRGBO(101, 121, 155, 1) ,),
                    Icon(FontAwesomeIcons.youtube, color: Color.fromRGBO(101, 121, 155, 1) ,),
                  ],)
              ],
            ),
        ),
      
      ); 
  }
  
}




