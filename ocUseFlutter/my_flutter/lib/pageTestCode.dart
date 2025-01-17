import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:async';

class PageTestCode extends StatefulWidget {
  const PageTestCode({super.key});

  @override
  State<StatefulWidget> createState() => _PageTestCodeState();
}

class _PageTestCodeState extends State<PageTestCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: const Text("测试代码"),
      ),
      body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
        onPressed: _goToTestCode1,
        child: const Text("代码测试1-展示toast"),
      ),
        ElevatedButton(
          onPressed: _goToTestCodeTimer1,
          child: const Text("代码测试2-timer1"),
        ),
        ElevatedButton(
          onPressed: _goToTestCode3,
          child: const Text("代码测试3"),
        ),
      ],
      ),
      ),
    );
  }

  void _goToTestCodeTimer1() {

    const timeout = const Duration(seconds: 5);
    print('currentTime = ' + DateTime.now().toString() );
    Timer(timeout, (){
      //倒计时结束
      print('afterTimer = ' + DateTime.now().toString() );
      Fluttertoast.showToast(
          msg: "倒计时结束",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.amber,
          textColor: Colors.white,
          fontSize: 16.0
      );
    });

  }

  Iterable<int> naturalsTo(int n) sync* {
    int k = 0;
    while (k < n) yield k++;
  }

  Stream<int> asynchronousNaturalsTo(int n) async* {
    int k = 0;
    while (k < n) yield k++;
  }

  Stream<int> testYield() async* {
    for (int i = 0; i < 15;++i) {
      yield i;
    }
  }

// 要使用 `await for` 必须要在异步函数中
  test() async {
    Stream<int> st = testYield();
    // 使用 await for 遍历stream的内容
    print(st);
    await for (int item in st) {
      print(item);
    }
  }

  Iterable<int> naturalsDownFrom(int n) sync* {
    if (n > 0) {
      yield n;
      yield* naturalsDownFrom(n - 1);
    }
  }

  Future<void> _goToTestCode3() async {
      // await test();
      //print(na)
    /*
    for (var element in naturalsTo(10)) {
      print(element);
    }
     */
    for (var element in naturalsDownFrom(10)) {
      print(element);
    }

  }

  void _goToTestCode1() {

    Fluttertoast.showToast(
        msg: "This is Center Short Toast",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.amber,
        textColor: Colors.white,
        fontSize: 16.0
    );


    //future1();
    //stream2();
  }

  static future1() {
    Future future = Future(() {
      print('我是第一个future');
    });
    future.then((value) => print('我是future的then'));
    print('future1方法体');

    /* 输出：
     flutter: future1方法体
     flutter: 我是第一个future
     flutter: 我是future的then
     */
  }

  static future11() {

    Future future = Future(() {
      print('我是第一个future');
    });
    future.then((value) => print('我是future的then'));
    print('future1方法体');

    /* 输出：
     flutter: future1方法体
     flutter: 我是第一个future
     flutter: 我是future的then
     */
  }

  static stream1() {
    Stream stream = Stream.fromFuture(
        Future.delayed(const Duration(milliseconds: 500)).then((value) {
          return '我是Stream的future执行结果';
        }));

    stream.listen((event) {
      print(event);
    });


  }

  static stream2() {
    Stream stream = Stream.fromFutures([
      getFuture(1, 1500, '我是第1个Future'),
      getFuture(2, 500, '我是第2个Future'),
      getFuture(3, 500, '我是第3个Future')
    ]);
    stream.listen((event) {
      print('event:$event');
    },onDone: (){
      print('执行完成');
    });
  }

  static getFuture(int type, int ms, String resultStr) {
    return Future.delayed(Duration(milliseconds: ms)).then((value) {
      print('第$type个future执行完毕');
      return resultStr;
    });
  }

}