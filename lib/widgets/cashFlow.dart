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
                const SizedBox(height: 20.0),
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
        markersBuilder: (context, date, events, holidays) {
          final children = <Widget>[];
          double sum = 0.00;

          events.forEach((el) {
            sum = sum + el.price;
          });

          children.add(Positioned(
            right: 0,
            bottom: 0,
            child: AnimatedContainer(
              padding: EdgeInsets.symmetric(horizontal: 2.0, vertical: 0.0),
              duration: const Duration(milliseconds: 400),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.blueGrey[600],
                borderRadius: BorderRadius.circular(20),
//                color: Utils.isSameDay(date, _selectedDay)
//                    ? Colors.brown[400]
//                    : Utils.isSameDay(date, DateTime.now()) ? Colors.brown[300] : Colors.deepPurple[400],
              ),
              width: 52.0,
              height: 20.0,
              child: Center(
                child: Text(
                  '${sum.toStringAsFixed(2)}',
                  textAlign: TextAlign.center,
                  style: TextStyle().copyWith(
                      color: Colors.white,
                      fontSize: 11.0,
                      fontWeight: FontWeight.w600),
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
      ),
      onDaySelected: _onDaySelected,
      onVisibleDaysChanged: _onVisibleDaysChanged,
    );
  }
}
