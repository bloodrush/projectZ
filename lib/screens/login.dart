
import 'package:flutter/material.dart';
import 'package:flutter_graphql/flutter_graphql.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Project Z'),
        ),
        body: Container(
            child: Mutation(
  options: MutationOptions(
    document: LOGIN_MUTATION, 
  ),
  builder: (
    RunMutation runMutation,
    QueryResult result,
  ) {
    return  Form(
                key: _formKey,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Username',
                            icon: Padding(
                                padding: EdgeInsets.only(top: 15.0),
                                child: Icon(Icons.person))),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                        },
                      ),
                      TextFormField(
                        
                        decoration: InputDecoration(
                            labelText: 'Password',
                            icon: Padding(
                                padding: EdgeInsets.only(top: 15.0),
                                child: Icon(Icons.lock))),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                        },
                      ),
                      Center(
                        child: RaisedButton(
                          onPressed: () {
         
                            if (_formKey.currentState.validate()) {
  
                            runMutation({
                              'email': 'shano@mail.bg',
                              'pass':'test'
                            });
                        
                            print(result.errors);
                            print(result.data);
                            }
                          },
                          child: Text('Submit'),
                        ),
                      ),
                    ],
                  ),
                ));
  },
)
)
            
            );
  }
}
