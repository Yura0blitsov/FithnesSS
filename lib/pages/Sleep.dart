import 'package:flutter/material.dart';

class Sleep extends StatefulWidget {
  const Sleep({Key? key}) : super(key: key);

  @override
  _SleepState createState() => _SleepState();
}

class _SleepState extends State<Sleep> {
  String appbar = 'Сон';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(appbar),
          backgroundColor: Colors.black54,
          centerTitle: true,
        ),
        body: Scaffold(
          backgroundColor: Colors.black12,
        )
    );
  }
}
