import 'dart:async';

import 'package:flutter/services.dart';

import 'dart:convert';
import 'package:flutter/material.dart';
import 'flutter_native_web.dart';

//Echarts
class EchartView extends StatelessWidget {
  EchartView(
      {Key key, this.height, this.data, this.child, this.backgroundColor})
      : super(key: key);
  final Map data;
  final double height;
  final Widget child;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: backgroundColor,
      child: Echarts(data: data, child: child),
    );
  }
}

class Echarts extends StatefulWidget {
  Echarts({this.data, this.child});

  final Widget child;

  final Map data;

  @override
  _EchartsState createState() => _EchartsState();
}

class _EchartsState extends State<Echarts> {
  WebController webController;

  bool finished = false;

  Future<String> getFileData(String path) async {
    return await rootBundle.loadString(path);
  }

  Future onWebCreated(webController) async {
    print("webCreated");
    this.webController = webController;
    String data = await getFileData("assets/echart.html");
    this.webController.loadData(data);
    this.webController.onPageFinished.listen((url) {
      print("Finished loading $url");
      var data = json.encode(widget.data).toString();
      this.webController.evalJs(data);
      setState(() {
        finished = true;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    finished = false;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(overflow: Overflow.clip, children: <Widget>[
      widget.child ?? const Center(child: const CircularProgressIndicator()),
      AnimatedOpacity(
          duration: Duration(milliseconds: 3000),
          opacity: finished ? 1.0 : 0.0,
          child: Container(child: FlutterNativeWeb(onWebCreated: onWebCreated)))
    ]);
  }
}
