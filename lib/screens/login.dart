import 'package:flutter/material.dart';
import 'package:flutter_graphql/flutter_graphql.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import 'package:scoped_model/scoped_model.dart';
import '../models/auth.dart';

const LOGIN_MUTATION = '''
mutation Login(\$email:String!, \$pass:String!) {
  login(data:{email: \$email,password: \$pass}) {
    user {
      firstName
      secondName
      email
    }
  }
}
''';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final user = TextEditingController();
  final pass = TextEditingController();
  var _errorText = '';

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    user.dispose();
    pass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AuthModel>(
      builder: (context, child, auth) =>
      Scaffold(
        drawer: Drawer(
          child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  child: Center(
                    child: Image.asset('lib/assets/images/logo-locam.png', height: 30.0),
                  ),
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
                      Icon(FontAwesomeIcons.signOutAlt, color: Color.fromRGBO(94, 37, 99, 1) ,),
                      Container( margin: EdgeInsets.only(left:20.0 ), child:Text('Exit application',style: TextStyle(fontSize: 20),))
                    ],),
                  onTap: () {
                    // Update the state of the app
                    // ...
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
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(94, 37, 99, 1),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(''),
              Image.asset(
                'lib/assets/images/logo-locam.png',
                height: 30.0,
              ),
              Text(
                'FR',
                style: TextStyle(fontSize: 18.0),
              )
            ],
          ),
        ),
        body: Container(
            decoration: BoxDecoration(
              // Box decoration takes a gradient
              gradient: LinearGradient(
                // Where the linear gradient begins and ends
                begin: Alignment.centerLeft,
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
              CarouselSlider(
                    viewportFraction: 1.0,
                    aspectRatio: 2.0,
                    autoPlayInterval: Duration(seconds: 5),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.easeInOutCubic,
                    pauseAutoPlayOnTouch: Duration(seconds: 3),
                    autoPlay: true,
                                    height: 220,
                                    items: ['one','two'].map((i) {
                                      return Builder(
                                        builder: (BuildContext context) {
                                          return Container(
                                            width: MediaQuery.of(context).size.width,
                                            decoration: BoxDecoration(
                                              color: Colors.transparent
                                            ),
                                            child: SizedBox.expand(
                                              child:  Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage('lib/assets/images/$i.jpg'), fit: BoxFit.cover),
                          ),
                        ),
                                            )
                                          );
                                        },
                                      );
                                    }).toList(),
                            ),
              Container(
                  child: Mutation(
                onCompleted:  (QueryResult res) {


                  if (res.errors != null) {
                    setState(() {
                      this._errorText = res.errors[0].message;
                    });
                  } else {
                    auth.login(res.data['login']);
                    Navigator.pushReplacementNamed(context, '/simulation');
                  }

                },
                options: MutationOptions(
                  document: LOGIN_MUTATION,
                ),
                builder: (
                  RunMutation runMutation,
                  QueryResult result,
                ) {
                  return
                    Card(
                      margin: EdgeInsets.symmetric(horizontal: 40.0),
                      child: Form(
                          key: _formKey,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                TextFormField(
                                  controller: user,
                                  decoration: InputDecoration(
                                      border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                                      labelText: 'Username',
                                      icon: Padding(
                                          padding: EdgeInsets.only(top: 15.0),
                                          child: Icon(
                                              Icons.person,
                                              size: 32.0
                                          ))),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter your username';
                                    }
                                  },
                                ),
                                TextFormField(
                                  controller: pass,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      labelText: 'Password',
                                      icon: Padding(
                                          padding: EdgeInsets.only(top: 15.0),
                                          child: Icon(Icons.lock, size: 32.0,))),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter your password';
                                    }
                                  },
                                ),
                                Center(child: Text(_errorText),),
                                Center(
                                  child: Container(
                                      margin: EdgeInsets.only(top: 15.0),
                                      child: RaisedButton(
                                        color: Color.fromRGBO(94, 37, 99, 1),
                                        onPressed: () {
                                          if (_formKey.currentState.validate()) {
                                            runMutation({
                                              'email': user.text,
                                              'pass': pass.text
                                            });


                                          }
                                        },
                                        child: Text(
                                          'LOGIN',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0
                                          ),
                                        ),
                                      )),
                                ),

                              ],
                            ),
                          )),
                    );
                },
              )),
              Center(
                  child: Text('Forgot password?', style: TextStyle(fontStyle: FontStyle.italic, decoration: TextDecoration.underline , color: Colors.white),),
                ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Divider(
                  color: Colors.white,
                ),
              ),
              Container (
                   margin: EdgeInsets.only(bottom: 30.0),
                  child: Row(

                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                      child: Icon(FontAwesomeIcons.facebookF,  color: Colors.deepPurpleAccent),
                      onPressed: () {},
                      shape: CircleBorder()
                  ),
                  RaisedButton(
                      child: Icon(FontAwesomeIcons.google,  color: Colors.deepPurpleAccent),
                      onPressed: () {},
                      shape: CircleBorder()
                  )
                ],


              )),

            ]))),);
  }
}






