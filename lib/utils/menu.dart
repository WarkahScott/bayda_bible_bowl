import 'package:flutter/material.dart';

class Menu extends Drawer {
  Menu() : super(
    child: ListView(

      children: <Widget>[
        MenuItem("Home", Icons.home, '/'),
        MenuItem("Add Question", Icons.add, '/new'),
        MenuItem("All Questions", Icons.apps, '/all'),
        MenuItem("Study", Icons.book, '/study'),
        MenuItem("Prepare", Icons.timer, '/prep'),
        MenuItem("About", Icons.help_outline, '/about'),
    ]
   )
  );
}

class MenuItem extends StatelessWidget {
  final String _title;
  final IconData _icon;
  final String _route;

  MenuItem(this._title, this._icon, this._route);

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 70.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 50.0,
            child: SizedBox.expand(
              child: FlatButton.icon(
                icon: Icon(_icon),
                label: Text(_title),
                onPressed: () => Navigator.of(context).pushReplacementNamed(_route),
              ),
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}

