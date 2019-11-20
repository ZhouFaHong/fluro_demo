import 'package:flutter/material.dart';

class APage extends StatelessWidget {
  const APage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text('A页面'),),
        body: Center(
          child: Text('A'),
        ),
      ),
      
    );
  }
}