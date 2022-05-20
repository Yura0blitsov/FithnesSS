import 'package:flutter/material.dart';
import 'package:untitled/pages/trening/MassGain.dart';
import 'package:untitled/pages/trening/GeneralStrengthening.dart';
import 'package:untitled/pages/trening/WeightLoss.dart';
import 'package:untitled/pages/TreningElements.dart';
import 'package:untitled/pages/trening/DrowTrening.dart';
import 'package:untitled/pages/trening/NewTrening.dart';

class Trening extends StatefulWidget {
  const Trening({Key? key}) : super(key: key);

  @override
  _TreningState createState() => _TreningState();
}

class _TreningState extends State<Trening> {
  String appbar = 'Тренировки';
  final TreningList = <TreningElements>[
    TreningElements(image_path: "assets/mass_gain.jpeg",appbar: "НАБОР МАССЫ", trening: MassGain()),
    TreningElements(image_path: 'assets/weight_loss.jpeg', appbar: 'КАРДИО', trening: WeightLoss()),
    TreningElements(image_path: 'assets/general_strengthening.jpeg', appbar: "ОФП и ЛФК", trening: GeneralStrengthening()),
    ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(appbar),
          backgroundColor: Colors.black54,
          centerTitle: true,
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.delete),
                tooltip: 'Show Snackbar',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Удаление тренировки')));
                },)]
        ),
        body: Scaffold(
                        floatingActionButton: FloatingActionButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return NewTrening();
                              }));
                            },
                            backgroundColor: Colors.grey[800],
                            child: const Icon(Icons.add),),
                        backgroundColor: Colors.black12,
                        body: ListView.builder(
                            padding: const EdgeInsets.all(0),
                            itemCount: TreningList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.fitWidth,
                                          image: AssetImage(TreningList[index].image_path))),
                                  margin: EdgeInsets.all(10),
                                  child: SizedBox(
                                        height: 160,
                                        width: 420,
                                        child: ElevatedButton(
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all<Color>(Colors.black54),
                                            ),
                                            onPressed: () {
                                                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                                                      return DrowTrening(TreningList[index]);
                                                    }));
                                            },

                                          child:Text(TreningList[index].appbar, style: TextStyle(fontSize: 28, fontWeight: FontWeight.w300), ),
                                          )
                                        ),
                              );
                            })
                        ),);
  }
}
