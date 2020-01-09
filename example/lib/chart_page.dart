import 'package:flutter/material.dart';
import 'package:flutter_echart/flutter_echart.dart';

class EchartPage extends StatefulWidget {
  EchartPage({Key key}) : super(key: key);

  @override
  _EchartPageState createState() => _EchartPageState();
}

class _EchartPageState extends State<EchartPage> {
  var option;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    option = {
      "backgroundColor": "#73b9bc",
      "dataZoom": [
        {
          'type': 'slider', 
          'start': 10, 
          'end': 30 
        }
      ],
      "xAxis": {
        "type": "category",
        "data": ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun","Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
      },
      "yAxis": {"type": "value"},
      "series": [
        {
          "data": [820, 932, 901, 934, 1290, 1330, 1320,820, 932, 901, 934, 1290, 1330, 1320],
          "type": "line"
        }
      ]
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Echart'),
      ),
      body: Container(
        child: EchartView(height: 300, data: option),
        height: 300.0,
        width: 500.0,
      ),
    );
  }
}
