import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './widgets/potty_training_bottom_nav.dart';

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
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Potties'),
    Text('Locate Potty'),
    Text('Tips'),
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
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
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
