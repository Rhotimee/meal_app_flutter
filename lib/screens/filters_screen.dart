import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = "/filters";

  final Function saveFilters;
  final Map<String, bool> currentFilter;

  FilterScreen(this.saveFilters, this.currentFilter);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactosefree = false;

  @override
  initState() {
    _glutenFree = widget.currentFilter['gluten'];
    _vegetarian = widget.currentFilter['vegetarian'];
    _vegan = widget.currentFilter['vegan'];
    _lactosefree = widget.currentFilter['lactose'];
  }

  Widget _buildSwitchListTile(String title, String description,
      bool curentValue, Function updateValue) {
    return SwitchListTile(
        title: Text(title),
        value: curentValue,
        subtitle: Text(description),
        onChanged: updateValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Your Filter"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedFilter = {
                  'gluten': _glutenFree,
                  'lactose': _lactosefree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                };
                widget.saveFilters(selectedFilter);
              },
            )
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Adjust your meal selection.',
                  style: Theme.of(context).textTheme.title,
                )),
            Expanded(
                child: ListView(
              children: <Widget>[
                _buildSwitchListTile("Lactose-free",
                    "Only include gluten-free meals", _glutenFree, (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                }),
                _buildSwitchListTile("Gluten-free",
                    "Only include lactoe-free meals", _lactosefree, (newValue) {
                  setState(() {
                    _lactosefree = newValue;
                  });
                }),
                _buildSwitchListTile(
                    "Vegetarian", "Only include vegetarian meals", _vegetarian,
                    (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                }),
                _buildSwitchListTile(
                    "Vegan", "Only include vegan meals", _vegan, (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                }),
              ],
            ))
          ],
        ));
  }
}
