import 'package:basic_flutter_interview/pages/home_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ONE OK ROCK Album App',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Kanit'),
      home: MyHomePage(title: 'ONE OK ROCK Album'),
    );
  }
}
