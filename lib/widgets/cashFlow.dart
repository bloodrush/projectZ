import 'package:flutter/material.dart';

import "dart:async" show Future;
import "package:flutter/services.dart" show rootBundle;
import "dart:convert";
import 'package:table_calendar/table_calendar.dart';
import "../models/cashFlows.dart";

import '../context/localization.dart';

import '../widgets/Flow.dart';

class CashFlow extends StatefulWidget {
  final String test;

  const CashFlow({Key key, this.test}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CashFlowState();
}

class _CashFlowState extends State<CashFlow> with TickerProviderStateMixin {
  DateTime _selectedDay;
  Map<DateTime, List> _events = Map();
  Map<DateTime, List> _visibleEvents;
  List _selectedEvents;
  AnimationController _controller;
  List _flows;

  @override
  void initState() {
    super.initState();
    _setData();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _controller.forward();
  }

  void _setData() async {
    _selectedDay = DateTime.now();
    await _loadCashFlow();
    _flows.forEach((f) {
      _events[_selectedDay.add(Duration(days: f.offset))] = f.flows;
    });
    _selectedEvents = _events[_selectedDay] ?? [];
    _visibleEvents = _events;
  }

  void _onDaySelected(DateTime day, List events) {
    setState(() {
      _selectedDay = day;
      _selectedEvents = events;
    });

    print('Selected day: $day');
  }

  void _onVisibleDaysChanged(
      DateTime first, DateTime last, CalendarFormat format) {
    setState(() {
      _visibleEvents = Map.fromEntries(
        _events.entries.where(
          (entry) =>
              entry.key.isAfter(first.subtract(const Duration(days: 1))) &&
              entry.key.isBefore(last.add(const Duration(days: 1))),
        ),
      );
    });

    print('First visible day: $first');
    print('Last visible day: $last');
    print('Current format: $format');
  }

  Future<String> _loadCashFlowAsset() async {
    return await rootBundle.loadString('lib/assets/cashFlows.json');
  }

  Future _loadCashFlow() async {
    String jsonPhotos = await _loadCashFlowAsset();
    final jsonResponse = json.decode(jsonPhotos);
    CashFlowsList cashFlowsList = CashFlowsList.fromJson(jsonResponse);

    _flows = cashFlowsList.cashFlows;

    return true;
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _loadCashFlow(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data) {
            return Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                // Switch out 2 lines below to play with TableCalendar's settings
                //-----------------------
                _buildTableCalendar(),
                const SizedBox(height: 3.0),
                Expanded(child: Event(selectedEvents: _selectedEvents)),
              ],
            );
          }
        } else {
          return Container(child: Text("Loading"));
        }
      },
    );

    // TableCalendar(
    //   locale: DemoLocalizations.of(context).locale.countryCode,
    // );
  }

  dynamic _todayDecorator(isToday, isSel) {
    const today = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: [0.1, 0.8],
      colors: [Color.fromRGBO(101, 121, 155, 1), Color.fromRGBO(94, 37, 99, 1)],
    );

    const notToday = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: [0.1, 0.8],
      colors: [
        Color.fromRGBO(235, 235, 235, 0.3),
        Color.fromRGBO(235, 235, 235, 0.3)
      ],
    );

    if (isToday || isSel) {
      return today;
    } else {
      return notToday;
    }
  }

  bool checkIsToday(widgetDate) {
    final todayDate = DateTime.now();
    final bool isToday = todayDate.day == widgetDate.day &&
        todayDate.month == widgetDate.month &&
        todayDate.year == widgetDate.year;

    return isToday;
  }

  bool checkIsSelected(widgetDate) {
    final bool isSelected = _selectedDay.day == widgetDate.day &&
        _selectedDay.month == widgetDate.month &&
        _selectedDay.year == widgetDate.year;

    return isSelected;
  }

  Widget _buildTableCalendar() {
    return TableCalendar(
      locale: DemoLocalizations.of(context).locale.countryCode,
      events: _visibleEvents,
      initialCalendarFormat: CalendarFormat.twoWeeks,
      formatAnimation: FormatAnimation.scale,
      startingDayOfWeek: StartingDayOfWeek.monday,
      availableGestures: AvailableGestures.all,
      availableCalendarFormats: const {
        CalendarFormat.month: 'Month',
        CalendarFormat.twoWeeks: 'Week'
      },
      builders: CalendarBuilders(
        dayBuilder: (context, date, test) {
          var isToday = checkIsToday(date);
          var isSelected = checkIsSelected(date);

          return Opacity(
            opacity: isSelected ? 1 : 0.6,
            child: AnimatedContainer(
              margin: EdgeInsets.all(1.0),
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.elliptical(10, 10)),
                gradient: _todayDecorator(isToday, isSelected),
              ),
              child: Center(
                  child: Text(
                date.day.toString(),
                style: TextStyle(
                    fontSize: 20,
                    color:
                        isToday || isSelected ? Colors.white : Colors.black54),
              )),
              duration: Duration(milliseconds: 400),
            ),
          );
        },
        markersBuilder: (context, date, events, holidays) {
          var isToday = checkIsToday(date);
          var isSelected = checkIsSelected(date);
          final children = <Widget>[];
          double sum = 0.00;

          events.forEach((el) {
            sum = sum + el.price;
          });

          children.add(Positioned(
            bottom:-1,
            child: Center(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  // color: Colors.blueGrey[600],
//                color: Utils.isSameDay(date, _selectedDay)
//                    ? Colors.brown[400]
//                    : Utils.isSameDay(date, DateTime.now()) ? Colors.brown[300] : Colors.deepPurple[400],
                ),
                width: 56.0,
                height: 20.0,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.euro_symbol,
                        color: isToday || isSelected
                            ? Colors.white
                            : Colors.blueGrey[600],
                        size: 12.0,
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(
                        '${sum.toStringAsFixed(2)}',
                        textAlign: TextAlign.left,
                        style: TextStyle().copyWith(
                          color: isToday || isSelected
                              ? Colors.white
                              : Colors.blueGrey[600],
                           fontWeight: FontWeight.w200,   
                          fontSize: 10.0,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ));

          return children;
        },
      ),
      calendarStyle: CalendarStyle(
        selectedColor: Colors.deepPurple[600],
        todayColor: Colors.deepPurple[200],
      ),
      headerStyle: HeaderStyle(
        formatButtonTextStyle:
            TextStyle().copyWith(color: Colors.white, fontSize: 15.0),
        formatButtonDecoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: new Offset(1.0, 1.0),
              blurRadius: 1.0,
            )
          ],
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      onDaySelected: _onDaySelected,
      onVisibleDaysChanged: _onVisibleDaysChanged,
    );
  }
}
