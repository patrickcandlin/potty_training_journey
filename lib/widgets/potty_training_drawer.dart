import 'package:flutter/material.dart';

class PottyTrainingDrawer extends StatelessWidget {
  const PottyTrainingDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(child: Text('User Account')),
            ListTile(
              title: Text('Account'),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('LogOut/In'),
              onTap: (){
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
  }
}