import 'dart:async';

import 'package:flutter/material.dart';
import 'package:latlong/latlong.dart';
import 'package:project_z/widgets/DrawerLogged.dart';
import 'package:flutter_map/flutter_map.dart';

class ContactsPage extends StatefulWidget {
  @override
  ContactsPageState createState() => ContactsPageState();
}

class ContactsPageState extends State<ContactsPage> {
  var top = FractionalOffset.centerLeft;
  var bottom = FractionalOffset.centerRight;

  var list = [Color.fromRGBO(94, 37, 99, 1), Color.fromRGBO(101, 121, 155, 1)];

  void animateContainer() {
    setState(() {
      top = FractionalOffset.topCenter;
      bottom = FractionalOffset.bottomCenter;
      list = [Color.fromRGBO(94, 37, 99, 1), Color.fromRGBO(101, 121, 155, 1)];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(new Duration(milliseconds: 150), () {
      animateContainer();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color.fromRGBO(94, 37, 99, 1),
          title: Text('Contacts'),
        ),
        drawer: LoggedDrawer(),
        body: Stack(children: <Widget>[
          FlutterMap(
            options: MapOptions(
              center: LatLng(43.625531, 7.0554199),
              zoom: 17.0,
            ),
            layers: [
              TileLayerOptions(
                urlTemplate: "https://api.tiles.mapbox.com/v4/"
                    "{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}",
                additionalOptions: {
                  'accessToken':
                      'pk.eyJ1IjoicmV0cm9zcGN0IiwiYSI6ImNqOG85dTFrbzAweWIzMHVtNWtuY2w3ZXIifQ.sVRc4IpzYH2Bl90FlxNzPQ ',
                  'id': 'mapbox.streets',
                },
              ),
              MarkerLayerOptions(
                markers: [
                  Marker(
                    width: 70.0,
                    height: 70.0,
                    point: LatLng(43.625531, 7.0554199),
                    builder: (ctx) => Container(
                          padding: new EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
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
                          child:
                              Image.asset('lib/assets/images/logo-locam.png'),
                        ),
                  ),
                ],
              ),
            ],
          ),
          Opacity(
            opacity: 0.9,
            child: AnimatedContainer(
              padding: new EdgeInsets.all(20),
              constraints: BoxConstraints(
                maxHeight: 150.0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0)),
                gradient: LinearGradient(
                    begin: top,
                    end: bottom,
                    // Add one stop for each color. Stops should increase from 0 to 1
                    stops: [0.1, 0.8],
                    colors: list),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '200 Rue du Vallon, 06560 Valbonne, France',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Divider(
                      color: Colors.white,
                    ),
                  ),
                  Text('+33 4 89 87 77 77',
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.white, fontSize: 18.0)),
                  Text('codix.eu',
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.white, fontSize: 18.0)),
                ],
              ),
              duration: Duration(milliseconds: 1000),
              curve: Curves.linear,
            ),
          ),
        ]));
  }
}
