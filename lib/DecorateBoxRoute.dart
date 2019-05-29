import 'package:flutter/material.dart';

class DecorateBoxRoute extends StatefulWidget {
  @override
  _DecorateBoxRouteState createState() {
    return new _DecorateBoxRouteState();
  }
}

class _DecorateBoxRouteState extends State<DecorateBoxRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("渐变BoxRoute"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 16.0),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                  gradient:
                      LinearGradient(colors: [Colors.red, Colors.orange[600]]),
                  borderRadius: BorderRadius.circular(5.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.red,
                        offset: Offset(0.0, 3.0),
                        blurRadius: 6.0,spreadRadius: -1.0)
                  ]),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 16.0),
                child: Text(
                  "Hello World.",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
