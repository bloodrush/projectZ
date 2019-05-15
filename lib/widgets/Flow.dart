import 'package:flutter/material.dart';

class Event extends StatelessWidget {
  final List selectedEvents;

  const Event({Key key, this.selectedEvents}) : super(key: key);

  List<Widget> _listEvents(BuildContext context) {
    String getDueDate(offset) {
      var today = new DateTime.now();
      
      var relativeDate = today.add(new Duration(days: int.parse(offset)));
      String formatedYear =
          '${relativeDate.day}.0${relativeDate.month}.${relativeDate.year}';

      return formatedYear;
    }

    if (selectedEvents.length > 0) {
      return selectedEvents
          .map(
            (event) => Container(
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
                  margin: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 7.0),
                  child: Stack(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding:
                                      EdgeInsets.only(left: 12.0, top: 12.0),
                                  width: MediaQuery.of(context).size.width,
                                  child: Text(event.purchase,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20.0)),
                                ),
                                Container(
                                    padding: EdgeInsets.only(
                                        left: 12.0, bottom: 12.0),
                                    width: MediaQuery.of(context).size.width,
                                    child: Row(
                                      children: <Widget>[
                                        Text(
                                            '${event.loc} / Due: ${getDueDate(event.date)}',
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              fontStyle: FontStyle.italic,
                                              color: Colors.white,
                                              fontSize: 15.0,
                                            )),
                                      ],
                                    ))
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(12.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Icon(
                                    Icons.euro_symbol,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    '${event.price}0',
                                    style: TextStyle(color: Colors.white),
                                    textAlign: TextAlign.end,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Positioned.fill(
                          child: new Material(
                              color: Colors.transparent,
                              child: new InkWell(
                                onLongPress: () {
                                  Scaffold.of(context).showSnackBar(SnackBar(
                                    content: Text('Tap'),
                                  ));
                                },
                              ))),
                    ],
                  ),
                ),
          )
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
