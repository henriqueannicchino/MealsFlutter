import 'package:flutter/material.dart';
import '../components/main_drawer.dart';
import '../models/settings.dart';

class SettingsScreen extends StatefulWidget {

  final Settings settings;
  final Function(Settings) onSettingsChanged;

  const SettingsScreen(this.settings, this.onSettingsChanged, {Key? key})
      : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  Settings? settings;

  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwitch(
    String title, 
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChanged(settings!);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Settings',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _createSwitch(
                  'No gluten',
                  'Only show meals without gluten!',
                  settings!.isGlutenFree,
                  (value) => setState(() => settings!.isGlutenFree = value),
                ),
                _createSwitch(
                  'Lactose free',
                  'Only show meals without lactose!',
                  settings!.isLactoseFree,
                  (value) => setState(() => settings!.isLactoseFree = value),
                ),
                _createSwitch(
                  'Vegan',
                  'Only show vegan meals!',
                  settings!.isVegan,
                  (value) => setState(() => settings!.isVegan = value),
                ),
                _createSwitch(
                  'Vegetarian',
                  'Only show vegetarian meals!',
                  settings!.isVegetarian,
                  (value) => setState(() => settings!.isVegetarian = value),
                ),
              ],
            )
          )
        ],
      )
    );
  }
}