import 'package:flutter/material.dart';

import "dart:async" show Future;
import "package:flutter/services.dart" show rootBundle;
import "dart:convert";

import "../models/cashFlows.dart";

import 'package:table_calendar/table_calendar.dart';
import '../context/localization.dart';

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
    _selectedDay = DateTime.now();
    _loadCashFlow();
    _flows.forEach((f) {
      _events[_selectedDay.add(Duration(days: f.offset))] = f.flows;
    });
    _selectedEvents = _events[_selectedDay] ?? [];
    _visibleEvents = _events;
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _controller.forward();
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
    _controller.dispose();
    super.dispose();
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
                const SizedBox(height: 8.0),
                Expanded(child: _buildEventList()),
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
      initialCalendarFormat: CalendarFormat.month,
      formatAnimation: FormatAnimation.scale,
      startingDayOfWeek: StartingDayOfWeek.monday,
      availableGestures: AvailableGestures.all,
      availableCalendarFormats: const {
        CalendarFormat.month: 'Month',
        CalendarFormat.twoWeeks: '2 weeks',
        CalendarFormat.week: 'Week',
      },
      calendarStyle: CalendarStyle(
        selectedColor: Colors.deepOrange[400],
        todayColor: Colors.deepOrange[200],
        markersColor: Colors.brown[700],
      ),
      headerStyle: HeaderStyle(
        formatButtonTextStyle:
            TextStyle().copyWith(color: Colors.white, fontSize: 15.0),
        formatButtonDecoration: BoxDecoration(
          color: Colors.deepOrange[400],
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      onDaySelected: _onDaySelected,
      onVisibleDaysChanged: _onVisibleDaysChanged,
    );
  }

  Widget _buildEventList() {
    return ListView(
      children: _selectedEvents
          .map((event) => Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 0.8),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                margin:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: ListTile(
                  title: Column(
                    children: <Widget>[
                      Container(
                        child: Text(event.purchase.toString()),
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Text(event.date.toString()),
                            Text(event.price.toString())
                          ],
                        ),
                      )
                    ],
                  ),
                  onTap: () => print('$event tapped!'),
                ),
              ))
          .toList(),
    );
  }
}
