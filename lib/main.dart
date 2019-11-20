import 'package:flutter/material.dart';
import 'home.dart';
import 'package:fluro/fluro.dart';
import 'package:fluro_demo/route/application.dart';
import 'package:fluro_demo/route/routes.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  MyApp(){
    //初始化路由
    final router = new Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Fluro Demo'),

      // 初始化路由
      onGenerateRoute: Application.router.generator,
    );
  }
}


