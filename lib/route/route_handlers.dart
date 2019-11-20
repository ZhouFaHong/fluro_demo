import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:fluro_demo/a_page.dart';
import 'package:fluro_demo/b_page.dart';
import 'package:fluro_demo/c_page.dart';

/*
跳转到各个页面的handle
*/ 


var a_pageHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params){

    return APage();

  });

  var b_pageHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params){

    String title =  params['title']?.first;
    return BPage(title);

  });

  var c_pageHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params){

    // 获取参数值
    String title =  params['title']?.first;
    String name =  params['name']?.first;
    return CPage(title,name);

  });



  var demoFunctionHandler = new Handler(
    type: HandlerType.function,
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      String message = params["message"]?.first;
      showDialog(
        context: context,
        builder: (context) {
          return new AlertDialog(
            title: new Text(
              "Hey Hey!",
              style: new TextStyle(
                color: const Color(0xFF00D6F7),
                fontFamily: "Lazer84",
                fontSize: 22.0,
              ),
            ),
            content: new Text("$message"),
            actions: <Widget>[
              new Padding(
                padding: new EdgeInsets.only(bottom: 8.0, right: 8.0),
                child: new FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: new Text("OK"),
                ),
              ),
            ],
          );
        },
      );
    });
