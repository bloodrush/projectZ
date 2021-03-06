import 'package:flutter/material.dart';
import '../widgets/DrawerLogged.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

import '../widgets/cashFlow.dart';
import 'charts.dart';

class Dashboard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Dashboard();
}

class _Dashboard extends State<Dashboard> {
  int _selectedIndex = 0;
  final _widgetOptions = [
    CashFlow(),
    AnimatedPieChartExample(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        drawer: LoggedDrawer(),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color.fromRGBO(94, 37, 99, 1),
          title: Text('Dashboard'),
        ),
        body: new Center(child: _widgetOptions.elementAt(_selectedIndex)),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedIndex,
            type: BottomNavigationBarType.shifting,
            items: [
              BottomNavigationBarItem(
                activeIcon: Icon(Icons.calendar_today),
                icon: Icon(OMIcons.calendarToday),
                title: new Text('Funding Availability'),
                backgroundColor: Color.fromRGBO(64, 37, 99, 1),
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(Icons.pie_chart),
                icon: Icon(OMIcons.pieChart),
                title: new Text('Charts'),
                backgroundColor: Color.fromRGBO(34, 37, 99, 1),
              ),
            ],
            onTap: _onItemTapped));
  }
}
