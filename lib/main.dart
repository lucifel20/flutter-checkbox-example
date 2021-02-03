import 'package:flutter/material.dart';

void main() => runApp(CheckboxExample());

class CheckboxExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //
    const APP_TITLE = 'Flutter Checkbox Example';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: APP_TITLE,
      home: HomeRoute(),
    ); // MaterialApp()
  }
}

class HomeRoute extends StatefulWidget {
  @override
  _HomeRoute createState() => _HomeRoute();
}

class _HomeRoute extends State<HomeRoute> {
  //
  String _text1 = 'Checkbox A is not Checked';
  String _text2 = 'Checkbox B is not Checked';
  bool _isCheckboxAllChanged = false;
  bool _isCheckboxAChanged = false;
  bool _isCheckboxBChanged = false;

  void _checkBoxAllChanged(bool isChanged) {
    setState(() {
      _isCheckboxAllChanged = isChanged;
      _checkBoxAChanged(isChanged);
      _checkBoxBChanged(isChanged);
    });
  }

  void _checkBoxAChanged(bool isChanged) {
    setState(() {
      _isCheckboxAChanged = isChanged;
      _text1 = (isChanged) ? 'Checkbox A is Checked' : 'Checkbox A is not Checked';
    });
  }

  void _checkBoxBChanged(bool isChanged) {
    setState(() {
      _isCheckboxBChanged = isChanged;
      _text2 = (isChanged) ? 'Checkbox B is Checked' : 'Checkbox B is not Checked';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Text(_text1),
            Text(_text2),
            SizedBox(height: 20.0),
            Row(
              children: <Widget>[
                Checkbox(
                  value: _isCheckboxAllChanged,
                  onChanged: _checkBoxAllChanged,
                ), // Checkbox()
                Text('Check All (Checkbox)'),
              ], // List<Widget>[]
            ), // Row()
            SizedBox(
              width: 300.0,
              child: CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                title: Text('A'),
                subtitle: Text('(CheckboxListTile)'),
                value: _isCheckboxAChanged,
                onChanged: _checkBoxAChanged,
              ), // CheckboxListTile()
            ), // SizedBox()
            SizedBox(
              width: 300.0,
              child: CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                title: Text('B'),
                subtitle: Text('(CheckboxListTile)'),
                value: _isCheckboxBChanged,
                onChanged: _checkBoxBChanged,
              ), // CheckboxListTile()
            ), // SizedBox()
          ], // List<Widget>[]
        ), // Column()
      ), // SafeArea()
    ); // Scaffold
  }
}
