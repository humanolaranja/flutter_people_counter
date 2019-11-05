import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: "People Counter", home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _people = 0;
  String _infoText = "Pode entrar =D";

  void _changePeople(int delta) {
    setState(() {
      _people += delta;

      if (_people < 0) {
        _infoText = "Faliu!";
      } else if (_people <= 10) {
        _infoText = "Pode entrar =D";
      } else {
        _infoText = "Lotou";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.transparency,
        child: Stack(
          children: <Widget>[
            Image.asset(
              "assets/images/restaurant.jpg",
              fit: BoxFit.cover,
              height: 1000,
            ),
            SafeArea(
                minimum: const EdgeInsets.all(16),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Humanos: $_people",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 50)),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              FlatButton(
                                child: Text(
                                  "-",
                                  style: TextStyle(
                                      fontSize: 40, color: Colors.white),
                                ),
                                onPressed: () => _changePeople(-1),
                              ),
                              FlatButton(
                                child: Text(
                                  "+",
                                  style: TextStyle(
                                      fontSize: 40, color: Colors.white),
                                ),
                                onPressed: () => _changePeople(1),
                              ),
                            ]),
                      ),
                      Text(_infoText,
                          style: TextStyle(
                              color: Colors.white,
                              fontStyle: FontStyle.italic,
                              fontSize: 30))
                    ])),
          ],
        ));
  }
}
