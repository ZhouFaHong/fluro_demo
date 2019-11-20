import 'package:fluro/fluro.dart';
import 'package:fluro_demo/route/application.dart';
import 'package:fluro_demo/route/routes.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                    onPressed: () => changePageIndex(context, 0),
                    child: Text("A页面"),
                    color: Colors.red),
                SizedBox(
                  width: 20,
                ),
                FlatButton(
                    onPressed: () => changePageIndex(context, 1),
                    child: Text("B页面"),
                    color: Colors.yellow),
                SizedBox(
                  width: 20,
                ),
                FlatButton(
                    onPressed: () => changePageIndex(context, 2),
                    child: Text("C页面"),
                    color: Colors.green),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

changePageIndex(BuildContext context, int i) {
  switch (i) {
    case 0:
      // transition设置跳转的动画
      Application.router.navigateTo(context, Routes.a_page,
          transition: TransitionType.material);
      break;
    case 1:

      // 注意:参数的值需要使用Uri.encodeComponent()方法调用一下,要不会报错.
      String route = '${Routes.b_page}?title=${Uri.encodeComponent('B跳转页面')}';
      Application.router
          .navigateTo(context, route, transition: TransitionType.fadeIn);
      break;
    case 2:

    // 在跳转后边加then操作，then未跳转的页面销毁之后，回调执行的方法。
      String route =
          '${Routes.c_page}?title=${Uri.encodeComponent('C跳转页面')}&name=${Uri.encodeComponent('周发洪')}';
      Application.router
          .navigateTo(context, route, transition: TransitionType.nativeModal)
          .then((result) {
            print('result = $result');
        if (result == 'key') {
          //执行func路由,func路由为弹出弹窗
          Application.router.navigateTo(context, "${Routes.func}?message=$result");
        }
      });
      break;
    default:
      break;
  }
}
