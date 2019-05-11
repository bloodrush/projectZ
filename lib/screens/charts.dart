import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';


final List<List<CircularStackEntry>> _quarterlyProfitPieData = [
  <CircularStackEntry>[
    new CircularStackEntry(
      <CircularSegmentEntry>[
        new CircularSegmentEntry(500.0, Colors.purpleAccent[700],
            rankKey: 'Q1'),
        new CircularSegmentEntry(1000.0, Colors.blueGrey, rankKey: 'Q2'),
        new CircularSegmentEntry(2000.0, Colors.deepPurple[800], rankKey: 'Q3'),
      ],
      rankKey: 'Quarterly Profits',
    ),
  ],
  <CircularStackEntry>[
    new CircularStackEntry(
      <CircularSegmentEntry>[
        new CircularSegmentEntry(1500.0, Colors.purpleAccent[100],
            rankKey: 'Q1'),
        new CircularSegmentEntry(750.0, Colors.blueGrey[900], rankKey: 'Q2'),
        new CircularSegmentEntry(2000.0, Colors.deepPurple[100], rankKey: 'Q3'),
      ],
      rankKey: 'Quarterly Profits',
    ),
  ],
  <CircularStackEntry>[
    new CircularStackEntry(
      <CircularSegmentEntry>[
        new CircularSegmentEntry(1800.0, Colors.blueGrey, rankKey: 'Q1'),
        new CircularSegmentEntry(1800.0, Colors.deepPurple[800], rankKey: 'Q2'),
        new CircularSegmentEntry(4000.0, Colors.purpleAccent[700],
            rankKey: 'Q3'),
      ],
      rankKey: 'Quarterly Profits',
    ),
  ],
  <CircularStackEntry>[
    new CircularStackEntry(
      <CircularSegmentEntry>[
        new CircularSegmentEntry(700.0, Colors.purpleAccent[100],
            rankKey: 'Q1'),
        new CircularSegmentEntry(2200.0, Colors.blueGrey[900], rankKey: 'Q2'),
        new CircularSegmentEntry(2000.0, Colors.deepPurple[100], rankKey: 'Q3'),
      ],
      rankKey: 'Quarterly Profits',
    ),
  ]
];

class AnimatedPieChartExample extends StatefulWidget {
  @override
  _AnimatedPieChartExampleState createState() =>
      new _AnimatedPieChartExampleState();
}

class _AnimatedPieChartExampleState extends State<AnimatedPieChartExample> {
  // final GlobalKey<AnimatedCircularChartState> _chartKey =
  //     new GlobalKey<AnimatedCircularChartState>();

  // final GlobalKey<AnimatedCircularChartState> _chart2Key =
  //     new GlobalKey<AnimatedCircularChartState>();

  final GlobalKey<AnimatedCircularChartState> _chart3Key =
      new GlobalKey<AnimatedCircularChartState>();

  final GlobalKey<AnimatedCircularChartState> _chart4Key =
      new GlobalKey<AnimatedCircularChartState>();

  final _chartSize = const Size(250.0, 250.0);
  int sampleIndex = 0;

  // void _cycleSamples() {
  //   setState(() {
  //     sampleIndex++;
  //     List<CircularStackEntry> data = _quarterlyProfitPieData[sampleIndex % 3];
  //     _chartKey.currentState.updateData(data);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        new Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                    child: Column(
                      children: <Widget>[
                        Center(
                            child: (Text(
                          'Quarterly amounts for Q1 2019',
                          style: TextStyle(fontSize: 20.0),
                        ))),
                        Center(
                          child: new AnimatedCircularChart(
                            edgeStyle: SegmentEdgeStyle.round,
                            key: _chart3Key,
                            size: _chartSize,
                            initialChartData: _quarterlyProfitPieData[0],
                            chartType: CircularChartType.Radial,
                            holeLabel: 'Q1 amounts',
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 10.0),
                              width: 40.0,
                              height: 20.0,
                              decoration: BoxDecoration(
                                  color: Colors.purpleAccent[700],
                                  border: Border.all(
                                      width: 1.0, color: Colors.black54)),
                            ),
                            Text('January'),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 10.0),
                              width: 40.0,
                              height: 20.0,
                              decoration: BoxDecoration(
                                  color: Colors.blueGrey,
                                  border: Border.all(
                                      width: 1.0, color: Colors.black54)),
                            ),
                            Text('February'),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 10.0),
                              width: 40.0,
                              height: 20.0,
                              decoration: BoxDecoration(
                                  color: Colors.deepPurple[800],
                                  border: Border.all(
                                      width: 1.0, color: Colors.black54)),
                            ),
                            Text('March'),
                          ],
                        ),
                      ],
                    )),
                Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                    child: Column(
                      children: <Widget>[
                        Center(
                            child: (Text(
                          'Quarterly amounts for Q1 2019',
                          style: TextStyle(fontSize: 20.0),
                        ))),
                        Center(
                          child: new AnimatedCircularChart(
                            edgeStyle: SegmentEdgeStyle.round,
                            key: _chart4Key,
                            size: _chartSize,
                            initialChartData: _quarterlyProfitPieData[2],
                            chartType: CircularChartType.Radial,
                            holeLabel: 'Q2 amounts',
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 10.0),
                              width: 40.0,
                              height: 20.0,
                              decoration: BoxDecoration(
                                  color: Colors.purpleAccent[700],
                                  border: Border.all(
                                      width: 1.0, color: Colors.black54)),
                            ),
                            Text('April'),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 10.0),
                              width: 40.0,
                              height: 20.0,
                              decoration: BoxDecoration(
                                  color: Colors.blueGrey,
                                  border: Border.all(
                                      width: 1.0, color: Colors.black54)),
                            ),
                            Text('May'),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 10.0),
                              width: 40.0,
                              height: 20.0,
                              decoration: BoxDecoration(
                                  color: Colors.deepPurple[800],
                                  border: Border.all(
                                      width: 1.0, color: Colors.black54)),
                            ),
                            Text('June'),
                          ],
                        ),
                      ],
                    )),
              ],
            ),
//            Column(
//              children: <Widget>[
//                Container(
//                    margin:
//                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
//                    child: Column(
//                      children: <Widget>[
//                        Center(
//                            child: (Text(
//                          '3-month deliverables for Q1 2019',
//                          style: TextStyle(fontSize: 20.0),
//                        ))),
//                        Center(
//                          child: new AnimatedCircularChart(
//                            edgeStyle: SegmentEdgeStyle.round,
//                            key: _chartKey,
//                            size: _chartSize,
//                            initialChartData: _quarterlyProfitPieData[1],
//                            chartType: CircularChartType.Pie,
//                          ),
//                        ),
//                        Row(
//                          children: <Widget>[
//                            Container(
//                              margin: EdgeInsets.symmetric(horizontal: 10.0),
//                              width: 40.0,
//                              height: 20.0,
//                              decoration: BoxDecoration(
//                                  color: Colors.purpleAccent[100],
//                                  border: Border.all(
//                                      width: 1.0, color: Colors.black54)),
//                            ),
//                            Text('January'),
//                            Container(
//                              margin: EdgeInsets.symmetric(horizontal: 10.0),
//                              width: 40.0,
//                              height: 20.0,
//                              decoration: BoxDecoration(
//                                  color: Colors.blueGrey[900],
//                                  border: Border.all(
//                                      width: 1.0, color: Colors.black54)),
//                            ),
//                            Text('February'),
//                            Container(
//                              margin: EdgeInsets.symmetric(horizontal: 10.0),
//                              width: 40.0,
//                              height: 20.0,
//                              decoration: BoxDecoration(
//                                  color: Colors.deepPurple[100],
//                                  border: Border.all(
//                                      width: 1.0, color: Colors.black54)),
//                            ),
//                            Text('March'),
//                          ],
//                        ),
//                      ],
//                    )),
//                Container(
//                    margin:
//                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
//                    child: Column(
//                      children: <Widget>[
//                        Center(
//                            child: (Text(
//                          '3-month deliverables for Q2 2019',
//                          style: TextStyle(fontSize: 20.0),
//                        ))),
//                        Center(
//                          child: new AnimatedCircularChart(
//                            edgeStyle: SegmentEdgeStyle.round,
//                            key: _chart2Key,
//                            size: _chartSize,
//                            initialChartData: _quarterlyProfitPieData[3],
//                            chartType: CircularChartType.Pie,
//                            holeLabel: 'Q2 amounts',
//                          ),
//                        ),
//                        Row(
//                          children: <Widget>[
//                            Container(
//                              margin: EdgeInsets.symmetric(horizontal: 10.0),
//                              width: 40.0,
//                              height: 20.0,
//                              decoration: BoxDecoration(
//                                  color: Colors.purpleAccent[100],
//                                  border: Border.all(
//                                      width: 1.0, color: Colors.black54)),
//                            ),
//                            Text('April'),
//                            Container(
//                              margin: EdgeInsets.symmetric(horizontal: 10.0),
//                              width: 40.0,
//                              height: 20.0,
//                              decoration: BoxDecoration(
//                                  color: Colors.blueGrey[900],
//                                  border: Border.all(
//                                      width: 1.0, color: Colors.black54)),
//                            ),
//                            Text('May'),
//                            Container(
//                              margin: EdgeInsets.symmetric(horizontal: 10.0),
//                              width: 40.0,
//                              height: 20.0,
//                              decoration: BoxDecoration(
//                                  color: Colors.deepPurple[100],
//                                  border: Border.all(
//                                      width: 1.0, color: Colors.black54)),
//                            ),
//                            Text('June'),
//                          ],
//                        ),
//                      ],
//                    )),
//              ],
//            ),
          ],
        ),
      ],
    );
  }
}
