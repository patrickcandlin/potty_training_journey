import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:potty_training_journey/widgets/potty_training_drawer.dart';
import './widgets/potty_training_bottom_nav.dart';
import './models/potty.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Potty Training Journey',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PottyTrainingHomePage(title: 'Potty Training Journey'),
    );
  }
}

class PottyTrainingHomePage extends StatefulWidget {
  PottyTrainingHomePage({this.title});

  final String title;

  @override
  _PottyTrainingHomePageState createState() => _PottyTrainingHomePageState();
}

class _PottyTrainingHomePageState extends State<PottyTrainingHomePage> {
  int _selectedIndex = 0;
  // static const List<Widget> _widgetOptions = <Widget>[
  //   Text('Potties'),
  //   Center(
  //     child: Text('Locate Potty Feature Coming Soon!'),
  //   ),
  //   Text('Tips Feature Coming Soon!'),
  // ];
  // _widgetOptions.elementAt(_selectedIndex),

  final List<Potty> _potties = [
    Potty(
      id: '1',
      date: DateTime.now(),
      ownerId: '1',
      excretionType: '1',
      onPotty: true,
      notes: "we had to rush",
    ),
    Potty(
      id: '2',
      date: DateTime.now().add(new Duration(days: -1)),
      ownerId: '1',
      excretionType: '2',
      onPotty: true,
      notes: null,
    ),
    Potty(
      id: '1',
      date: DateTime.now(),
      ownerId: '1',
      excretionType: '1',
      onPotty: false,
      notes: "we had to rush",
    ),
    Potty(
      id: '1',
      date: DateTime.now(),
      ownerId: '1',
      excretionType: '2',
      onPotty: true,
      notes: null,
    ),
    Potty(
      id: '1',
      date: DateTime.now(),
      ownerId: '1',
      excretionType: '1',
      onPotty: true,
      notes: null,
    ),
    Potty(
      id: '1',
      date: DateTime.now(),
      ownerId: '1',
      excretionType: '1',
      onPotty: true,
      notes: "we had to rush",
    ),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Card(
              child: Container(
                width: double.infinity,
                child: Text('1hr 30min 23s Ago'),
              ),
            ),
            Column(
              children: <Widget>[
                Card(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Today'),
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 15,
                          ),
                          child: Column(
                            children: _potties.map((potty) {
                              return Container(
                                margin: EdgeInsets.symmetric(vertical: 1,),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Container(
                                      width: 90,
                                      child: Text(
                                        DateFormat.jm().format(potty.date),
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 30,
                                      child: Text(
                                        '#${potty.excretionType}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                    potty.onPotty
                                        ? FaIcon(
                                            FontAwesomeIcons.checkCircle,
                                            color: Colors.green,
                                            size: 30,
                                          )
                                        : FaIcon(
                                            FontAwesomeIcons.timesCircle,
                                            color: Colors.red,
                                            size: 30,
                                          ),
                                    potty.notes == null
                                        ? Container(
                                          width: 20,
                                        )
                                        : FaIcon(
                                            FontAwesomeIcons.infoCircle,
                                            color: Colors.blue,
                                            size: 20,
                                          ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      drawer: PottyTrainingDrawer(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => print('Record Potty'),
        label: FaIcon(FontAwesomeIcons.toilet),
        tooltip: 'Record',
      ),
      bottomNavigationBar: PottyTrainingBottomNav(
        handelTapped: _onItemTapped,
        selectedIndex: _selectedIndex,
      ),
    );
  }
}
