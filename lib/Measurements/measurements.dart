import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Measurements extends StatelessWidget {
  const Measurements({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dpc = SimpleSeriesLegend.withSampleData();
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Image.asset('asset/icons/Rectangle.png'),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Patient Name:',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Gender:',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Age:',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(9.0),
                margin: const EdgeInsets.all(9.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius:
                        const BorderRadius.all(Radius.circular(20.0))),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    const CircleAvatar(
                      radius: 30.0,
                      backgroundColor: Color(0xff041e3e),
                      child: Text(
                        "Time",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Image.asset("asset/icons/heart.png"),
                                    const SizedBox(
                                      height: 5.0,
                                    ),
                                    // SizedBox(height:20 ,),
                                    const Text(
                                      "Heart Beats",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    const SizedBox(
                                      height: 5.0,
                                    ),
                                    const Text("0.0",
                                        style: TextStyle(color: Colors.black)),
                                    const Divider(
                                      color: Colors.grey,
                                      endIndent: 30.0,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                alignment: AlignmentDirectional.topCenter,
                                height: 90.0,
                                width: 1.0,
                                color: Colors.black26,
                                // margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                              ),
                              const SizedBox(
                                width: 0.0,
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Image.asset("asset/icons/oxygen.png"),
                                    const SizedBox(
                                      height: 5.0,
                                    ),
                                    const Text(
                                      "Oxygen Rate",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    const SizedBox(
                                      height: 5.0,
                                    ),
                                    const Text("0.0",
                                        style: TextStyle(color: Colors.black)),
                                    const Divider(
                                      color: Colors.grey,
                                      indent: 30.0,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Image.asset("asset/images/blood.png"),
                                    const SizedBox(
                                      height: 5.0,
                                    ),
                                    const Text(
                                      "Blood Pressure",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    const SizedBox(
                                      height: 5.0,
                                    ),
                                    const Text("0.0",
                                        style: TextStyle(color: Colors.black)),
                                  ],
                                ),
                              ),
                              Container(
                                alignment: AlignmentDirectional.bottomCenter,
                                height: 90.0,
                                width: 1.0,
                                color: Colors.black26,
                                // margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Image.asset("asset/icons/temperature.png"),
                                    const SizedBox(
                                      height: 5.0,
                                    ),
                                    const Text(
                                      "Temperature",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    const SizedBox(
                                      height: 5.0,
                                    ),
                                    const Text("0.0",
                                        style: TextStyle(color: Colors.black)),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ]),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                //color: Colors.blue,
                height: 300.0,
                width: double.infinity,
                child: dpc,
              ),
            ],
          ),
        ],
      ),
    ));
  }
}

class SimpleSeriesLegend extends StatelessWidget {
  final List<charts.Series<dynamic, String>> seriesList;
  final bool animate;

  SimpleSeriesLegend(this.seriesList, {required this.animate});

  factory SimpleSeriesLegend.withSampleData() {
    return SimpleSeriesLegend(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      seriesList,
      animate: animate,
      barGroupingType: charts.BarGroupingType.grouped,
      // Add the series legend behavior to the chart to turn on series legends.
      // By default the legend will display above the chart.
      behaviors: [charts.SeriesLegend()],
    );
  }

  /// Create series list with multiple series
  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final heartBeats = [
      OrdinalSales('2:00', 5),
      OrdinalSales('5:00', 25),
      OrdinalSales('8:00', 10),
      OrdinalSales('12:00', 75),
    ];

    final oxygenRate = [
      OrdinalSales('2:00', 25),
      OrdinalSales('5:00', 50),
      OrdinalSales('8:00', 10),
      OrdinalSales('12:00', 20),
    ];

    final bloodPressure = [
      OrdinalSales('2:00', 10),
      OrdinalSales('5:00', 15),
      OrdinalSales('8:00', 50),
      OrdinalSales('12:00', 45),
    ];

    final Temperature = [
      OrdinalSales('2:00', 20),
      OrdinalSales('5:00', 35),
      OrdinalSales('8:00', 15),
      OrdinalSales('12:00', 10),
    ];

    return [
      charts.Series<OrdinalSales, String>(
        id: 'Heart',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: heartBeats,
      ),
      charts.Series<OrdinalSales, String>(
        id: 'Oxygen',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: oxygenRate,
      ),
      charts.Series<OrdinalSales, String>(
        id: 'Pressure',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: bloodPressure,
      ),
      charts.Series<OrdinalSales, String>(
        id: 'Temperature',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: Temperature,
      ),
    ];
  }
}

class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}
