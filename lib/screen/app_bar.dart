import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppBarDefault extends AppBar {
  
  AppBarDefault({GlobalKey<ScaffoldState> scaffoldKey}) : super(
    title: Center(
      child: Text('Ta Barato?!')
    ),
    leading: new IconButton(icon: new Icon(Icons.dehaze),
            onPressed: () => scaffoldKey.currentState.openDrawer()),
    backgroundColor: Colors.black,
  );
}