import 'package:flutter/material.dart';

class BPage extends StatelessWidget {
  final _title;
  const BPage(this._title,{Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(title: Text('${this._title}'),),
          body: Center(
            child: Text('B'),
          ),
      ),
    );
  }
}