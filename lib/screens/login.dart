import 'package:flutter/material.dart';
import 'package:flutter_graphql/flutter_graphql.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'simulation.dart';

const LOGIN_MUTATION = '''
mutation Login(\$email:String!, \$pass:String!) {
  login(data:{email: \$email,password: \$pass}) {
    user {
      firstName
      secondName
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
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.menu),
                onPressed: (() => null),
                color: Colors.white,
                alignment: Alignment.centerLeft,
                iconSize: 32.0,
              ),
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
                end: Alignment.centerRight,
                // Add one stop for each color. Stops should increase from 0 to 1
                stops: [0.1, 0.8],
                colors: [
                  // Colors are easy thanks to Flutter's Colors class.
                  Colors.red[300],
                  Colors.red[500],
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
                onCompleted:  (QueryResult data) {

                 
                  if (data.errors != null) {
                    setState(() {
                      this._errorText = data.errors[0].message;
                    });
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SimulationPage()),
                    );
                  }           

                },    
                options: MutationOptions(
                  document: LOGIN_MUTATION,
                ),
                builder: (
                  RunMutation runMutation,
                  QueryResult result,
                ) {
                  return Form(
                      key: _formKey,
                      child: Container(
                        padding: EdgeInsets.all(20.0),
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
                                        color: Colors.white,
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
                                      child: Icon(Icons.lock,
                                          color: Colors.white,size: 32.0,))),
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
                                  child: OutlineButton(
                                    color: Colors.white,
                                    borderSide:BorderSide(color: Colors.white, width: 2.0),
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
                      ));
                },
              )),
              Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.home),
                    onPressed: (() => null),
                    color: Colors.white,
                    iconSize: 28.0,
                  ),
                  IconButton(
                    icon: Icon(Icons.mail),
                    onPressed: (() => null),
                    color: Colors.white,
                    iconSize: 28.0,
                  ),
                  IconButton(
                    icon: new Icon(FontAwesomeIcons.twitter),
                    onPressed: (() => null),
                    color: Colors.white,
                    iconSize: 28.0,
                  ),
                  IconButton(
                    icon: new Icon(FontAwesomeIcons.viber),
                    onPressed: (() => null),
                    color: Colors.white,
                    iconSize: 28.0,
                  ),IconButton(
                    icon: new Icon(FontAwesomeIcons.whatsapp),
                    onPressed: (() => null),
                    color: Colors.white,
                    iconSize: 28.0,
                  ),IconButton(
                    icon: new Icon(FontAwesomeIcons.facebook),
                    onPressed: (() => null),
                    color: Colors.white,
                    iconSize: 28.0,
                  ),
                  IconButton(
                    padding: EdgeInsets.only(right: 10.0),
                    icon: new Icon(FontAwesomeIcons.youtube),
                    onPressed: (() => null),
                    color: Colors.white,
                    iconSize: 28.0,
                  ),
                ],
              )
            ])));
  }
}
