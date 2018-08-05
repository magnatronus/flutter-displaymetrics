import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class TestApp extends StatefulWidget {
  _TestAppState createState() => _TestAppState();
}


class _TestAppState extends State<TestApp> {

  String _p1 = "density: unknown";
  String _p2 = "densityDpi: unknown";
  String _p3 = "pixelWidth: unknown";
  String _p4 = "pixelHeight: unknown";
  String _p5 = "scaledDensity: unknown";
  String _p6 = "xDpi: unknown";
  String _p7 = "yDpi: unknown";

  static const platform = MethodChannel('uk.spiralarm.display/metrics');


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Android Display Metrics")),
      body: Padding(
        padding: EdgeInsets.all(10.0) ,
        child: Column(
          children: <Widget>[

            Text(_p1),
            Text(_p2),
            Text(_p3),
            Text(_p4),
            Text(_p5),
            Text(_p6),
            Text(_p7),

            SizedBox(height: 20.0),

            RaisedButton(
              child: Text("Get Display Metrics"),
              onPressed: _getMetrics,
            )

          ],
        )
      )
    );
  }

  // Invoke the Metric Method
  _getMetrics() async {
      try{
        var result = await platform.invokeMethod('getDisplayMetrics');
        if(result != null){
          setState(() {
            _p1 = "density: ${result['density']}";
            _p2 = "densityDpi: ${result['densityDpi']}";
            _p3 = "pixelWidth: ${result['width']}";
            _p4 = "pixelHeight: ${result['height']}";
            _p5 = "scaledDensity: ${result['scaledDensity']}";
            _p6 = "xDpi: ${result['xdpi']}";
            _p7 = "yDpi: ${result['ydpi']}";          
          });
        }
      } on PlatformException {
        print("error");
      }
  }
}

