import 'package:flutter/material.dart';
import 'package:untitled/pages/TreningElements.dart';

class DrowTrening extends StatefulWidget {

  var elements = TreningElements();
  DrowTrening(TreningElements elements)
  {
    this.elements = elements;
  }
  @override
  _DrowTreningState createState() => _DrowTreningState(this.elements);
}

class _DrowTreningState extends State<DrowTrening> {
  var elements = TreningElements();

  _DrowTreningState(TreningElements elements)
  {
    this.elements = elements;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(elements.appbar),
        backgroundColor: Colors.black54,
        centerTitle: true,
      ),
      body: elements.trening,
    );
  }
}