import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class SettingsScreen extends StatefulWidget {
  static const routeName = '/settings';

  final Function(Map<String, bool>) saveSettings;
  final Map<String, bool> currentSettings;

  SettingsScreen(this.saveSettings, this.currentSettings);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _glutenFree = false;
  bool _vegan = false;
  bool _vegetarian = false;
  bool _lactoseFree = false;

  Widget settingOption(String title, String subTitle, bool initialValue, Function(bool) updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: initialValue,
      subtitle: Text(subTitle),
      onChanged: updateValue
    );
  }

  @override
  void initState() {
    _glutenFree = widget.currentSettings['gluten'] as bool;
    _lactoseFree = widget.currentSettings['lactose'] as bool;
    _vegetarian = widget.currentSettings['vegetarian'] as bool;
    _vegan = widget.currentSettings['vegan'] as bool;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.save), onPressed: () {
            final selectedFilters = {
              'gluten': _glutenFree,
              'lactose': _lactoseFree,
              'vegetarian': _vegetarian,
              'vegan': _vegan
            };
            widget.saveSettings(selectedFilters);
          })
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Adjust your meal section',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(child: ListView(
            children: <Widget>[
              settingOption(
                'Gluten free',
                'Only include gluten free meals',
                _glutenFree,
                (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                }
              ),
              settingOption(
                'Lactose free',
                'Only include lactose free meals',
                _lactoseFree,
                (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                }
              ),
              settingOption(
                'Vegetarian',
                'Only include vegetarian meals',
                _vegetarian,
                (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                }
              ),
              settingOption(
                'Vegan',
                'Only include vegan free meals',
                _vegan,
                (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                }
              ),
            ],
          ))
        ],
      )
    );
  }
}
