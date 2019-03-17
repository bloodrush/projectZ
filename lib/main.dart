import 'package:flutter/material.dart';
import 'package:flutter_graphql/flutter_graphql.dart';


import './screens/simulation.dart';
import './screens/dashboard.dart';
import './screens/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HttpLink link = HttpLink(
      uri: 'https://locamz-lvjupvjtsk.now.sh/graphql',
      // uri: 'http://10.0.2.2:8000/graphql'
    );

    ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        cache: InMemoryCache(),
        link: link,
      ),
    );
    return GraphQLProvider(
      client: client,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Project Z',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
      initialRoute: '/',
      routes: {
        '/': (context) => Login(),
        '/simulation': (context) => SimulationPage(),
        '/dashboard': (context) => Dashboard(),
      },
      ),
    );
  }
}

