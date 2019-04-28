import 'package:flutter/material.dart';

class Event extends StatelessWidget {
  final List selectedEvents;

  const Event({Key key, this.selectedEvents}) : super(key: key);

  List<Widget> _listEvents(BuildContext context) {
    if (selectedEvents.length > 0) {
      return selectedEvents
          .map((event) => Container(
                decoration: BoxDecoration(
                    color: Colors.purple,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: new Offset(1.0, 1.0),
                        blurRadius: 5.0,
                      )
                    ],
                    borderRadius: BorderRadius.all(new Radius.circular(10.0)),
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
                    shape: BoxShape.rectangle),
                margin:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 7.0),
                child: ListTile(
                  title: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: Text(event.purchase,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20.0)),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Icon(
                                  Icons.euro_symbol,
                                  color: Colors.white,
                                ),
                                Text(
                                  '${event.price.toString()}',
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.end,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          child: Text(event.loc,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Colors.white,
                                fontSize: 15.0,
                              )))
                    ],
                  ),
                  onTap: () => print('$event tapped!'),
                ),
              ))
          .toList();
    } else {
      return [
        Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Center(
              child: Text('There are no flows on this day'),
            ),
          ),
        )
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: _listEvents(context));
  }
}
