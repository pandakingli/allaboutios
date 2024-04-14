import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_flutter/pageBottomNavBar.dart';
import 'package:my_flutter/pageTopNavBar.dart';
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo 页面'),
      //home: const HomeBottomNavBar(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final MethodChannel _channelHomePage = const MethodChannel("FlutterHomePage.channel");
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _goToTopNavigationPage() {

    Navigator.push(context, MaterialPageRoute(builder: (context) => const PageTopNavBar()));

  }
  void _goToBottomNavigationPage() {

    Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeBottomNavBar()));

  }

  void _dismissFlutterHomePage() {
    _channelHomePage.invokeMethod("dismiss");
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              '已经点击:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(
              onPressed: _goToTopNavigationPage,
              child: const Text("Flutter顶部导航栏"),
            ),
            ElevatedButton(
              onPressed: _goToBottomNavigationPage,
              child: const Text("Flutter底部导航栏"),
            ),
            ElevatedButton(
              onPressed: _dismissFlutterHomePage,
              child: const Text("返回Native页面"),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
