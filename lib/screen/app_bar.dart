import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppBarDefault extends AppBar {
  
  AppBarDefault() : super(
    title: Center(
      child: Text('Ta Barato?!')
    ),
    leading: Image.asset('images/resources_icon.png'),
    backgroundColor: Colors.black
  );
}