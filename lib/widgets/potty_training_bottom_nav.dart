import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PottyTrainingBottomNav extends StatelessWidget {
  final int selectedIndex;
  final Function handelTapped;

  PottyTrainingBottomNav({this.selectedIndex, this.handelTapped});


  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.list),
            title: Text('Potties'),
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.mapMarkerAlt),
            title: Text('Locate Potty'),
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.lightbulb),
            title: Text('Tips'),
          ),
        ],
        currentIndex: selectedIndex,
        onTap: handelTapped,
      );
  }
}