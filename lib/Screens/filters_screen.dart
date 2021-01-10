import 'package:flutter/material.dart';

import 'main_drawer.dart';

class FiltersScreen extends StatelessWidget {
  static const routeName='filters';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      drawer: MainDraweer(),
      body: Center(
        child:Text("Filter Screen")
      ),

    );
  }
}
