import 'package:flutter/material.dart';
import 'package:flutter_graphql/flutter_graphql.dart';
import 'dashboard.dart';

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
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
          Container(
              child: Mutation(
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
                              labelText: 'Username',
                              icon: Padding(
                                  padding: EdgeInsets.only(top: 15.0),
                                  child: Icon(
                                    Icons.person,
                                    color: Colors.purple[600],
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
                                      color: Colors.purple[600]))),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter your password';
                            }
                          },
                        ),
                        Center(
                          child: Container(
                            margin: EdgeInsets.only(top:15.0),
                          child: RaisedButton(
                            color: Colors.purple[600],
                            elevation: 5.0,
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                runMutation({'email': user.text, 'pass': pass.text});

                                print(result.errors);
                                print(result.data);
                                print(user.text);
                                print(pass.text);
                              }
                            },
                            child: Text(
                              'LOGIN',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          )),
                        ),
                        RaisedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Dashboard()),
                              );
                            },
                          child: Text('Go forward'),
                        )
                      ],
                    ),
                  ));
            },
          )),
        ]));
  }
}
