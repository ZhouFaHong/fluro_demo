import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'route_handlers.dart';

class Routes {
  static String root = "/";
  static String a_page = "/a_page";
  static String b_page = "/b_page";
  static String c_page = "/c_page";
  static String func = "/func";
  

  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("route is not find !");
    });

    router.define(a_page, handler: a_pageHandler);
    router.define(b_page, handler: b_pageHandler);
    router.define(c_page, handler: c_pageHandler);
    router.define(func, handler: demoFunctionHandler);
  }
}
