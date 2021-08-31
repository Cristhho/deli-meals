import 'package:flutter/material.dart';

import '../screens/settings_screen.dart';

class MainDrawer extends StatelessWidget {

  Widget drawerItem(String text, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(icon, size: 26.0),
      title: Text(
        text,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24.0,
          fontWeight: FontWeight.bold
        ),
      ),
      onTap: () => tapHandler()
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120.0,
            width: double.infinity,
            padding: EdgeInsets.all(20.0),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking up!',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30.0,
                color: Theme.of(context).primaryColor
              ),
            ),
          ),
          SizedBox(height: 20.0),
          drawerItem('Meals', Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          drawerItem('Settings', Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(SettingsScreen.routeName);
          }),
        ],
      ),
    );
  }
}
