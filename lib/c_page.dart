import 'package:flutter/material.dart';

class CPage extends StatefulWidget {
  final _title;
  final _name;

  CPage(this._title, this._name, {Key key}) : super(key: key);

  @override
  _CPageState createState() => _CPageState();
}

class _CPageState extends State<CPage> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Scaffold(
          appBar: AppBar(
            title: Text('${widget._title}'),
          ),
          body: Center(
            child: Column(
              children: <Widget>[
                Text('C'),
                SizedBox(
                  height: 40,
                ),
                Text('名字：${widget._name}')
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: (){
              Navigator.pop(context, 'key');
            },
          ),
        ),

      ),
    );
  }
}
