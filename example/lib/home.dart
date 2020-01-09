import 'package:flutter/material.dart';
import 'chart_page.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Native WebView as Widget'),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: 800,
            child: Center(
              child: FlatButton(
                child: Text("Show Echart"),
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: () {
                  //导航到新路由
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return EchartPage();
                  }));
                },
              ),
            ),
          ),
        ));
  }
}
