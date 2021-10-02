import 'package:basic_flutter_interview/pages/home_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Kanit'),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
