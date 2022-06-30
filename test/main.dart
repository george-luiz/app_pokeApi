import 'package:api_pokemon/view/home.dart';
import 'package:flutter/material.dart';

final tema = ThemeData();

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Home(),
    ),
  );
}
