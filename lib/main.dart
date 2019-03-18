import 'package:flutter/material.dart';
import 'package:flutter_graphql/flutter_graphql.dart';
import 'package:scoped_model/scoped_model.dart';

import "./models/auth.dart";
import './screens/simulation.dart';
import './screens/dashboard.dart';
import './screens/login.dart';
import './screens/form.dart';

void main() {
  final auth = AuthModel();
  runApp(
    ScopedModel<AuthModel>(
      model: auth,
      child: MyApp(),
    ),
  );
}

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
          fontFamily: 'Montserrat',
          primarySwatch: Colors.deepPurple,
        ),
      initialRoute: '/',
      routes: {
        '/': (context) => Login(),
        '/simulation': (context) => SimulationPage(),
        '/dashboard': (context) => AnimatedPieChartExample(),
        '/form': (context) => FormPage()
      },
      ),
    );
  }
}

