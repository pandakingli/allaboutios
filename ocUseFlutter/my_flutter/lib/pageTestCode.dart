import 'dart:convert';
import 'dart:io';

import 'package:dio/io.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:crypto/crypto.dart';

import 'download_overlay.dart';


class testLogInterceptor extends Interceptor {

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // TODO: implement onResponse
    final timenow = DateTime.now().millisecondsSinceEpoch.toInt().toString();
    print("interceptors-$timenow");

    super.onResponse(response, handler);
  }
}

class PageTestCode extends StatefulWidget {
  const PageTestCode({super.key});

  @override
  State<StatefulWidget> createState() => _PageTestCodeState();
}

class _PageTestCodeState extends State<PageTestCode> {
  final DownloadOverlay _downloadOverlay = DownloadOverlay();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
          ElevatedButton(
            onPressed: (){
              _dioDownloadFile(context);
            },

            child: const Text("dio下载文件"),
          ),
        ],
      ),
      ),
    );
  }

  void _goToTestCodeTimer1() {
    const timeout = const Duration(seconds: 5);
    print('currentTime = ' + DateTime.now().toString());
    Timer(timeout, () {
      //倒计时结束
      print('afterTimer = ' + DateTime.now().toString());
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
    for (int i = 0; i < 15; ++i) {
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
    }, onDone: () {
      print('执行完成');
    });
  }

  static getFuture(int type, int ms, String resultStr) {
    return Future.delayed(Duration(milliseconds: ms)).then((value) {
      print('第$type个future执行完毕');
      return resultStr;
    });
  }

  Future<void> _dioDownloadFile(BuildContext context) async {

    _downloadOverlay.show(context);

    final dio = createDioWithInterceptors();
    String url = "https://newsfile.futunn.com/public/NN-PersistNoticeAttachment/7781/20250115/11510761-0.XLSX";

    // 获取应用缓存目录
    final Directory cacheDir = await getTemporaryDirectory();
    // 生成 URL 的 MD5 哈希值
    final md5Hash = md5.convert(utf8.encode(url)).toString();

    // 提取文件扩展名
    final parsedUrl = Uri.parse(url);
    String extension = path.extension(parsedUrl.path);

    // 构建保存路径
    final String fileName = '$md5Hash$extension';
    final String savePath = path.join(cacheDir.path, fileName);
    // 创建父目录（如果不存在）
    await Directory(path.dirname(savePath)).create(recursive: true);
/*
    options: Options(
      responseType: ResponseType.bytes,
      followRedirects: true,
    ),
    */

    try {
    // 执行下载
    await dio.download(
      url,
      savePath,
      onReceiveProgress: (int receivev, int total){
        if(total != -1) {
          print('文件下载成功进度: $receivev of $total');
          _downloadOverlay.progressNotifier.value = receivev / total;
        }

      }
    );

    print('文件下载成功: $savePath');

    File downloadfile = File(savePath);
    int filesize = await downloadfile.length();
    if (filesize == 0) {

    }
    print('文件size: $filesize');
    } catch (e) {
      print('下载失败: $e');
      rethrow;
    }

_downloadOverlay.hide();
    _downloadOverlay.progressNotifier.value = 0;
}

// 创建带有拦截器的 Dio 实例
  Dio createDioWithInterceptors() {
    final dio = Dio();

    // 配置HTTP代理及证书验证
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
      client.findProxy = (uri) {
        // 替换为你的电脑IP，端口通常为8888
        return 'PROXY 192.168.50.159:8888';
      };

      // 处理HTTPS证书校验（仅测试环境使用！）
      client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      return client;
    };

    for (int k = 0; k < 1000; k++) {
      dio.interceptors.add(testLogInterceptor());
    }

    // 添加日志拦截器
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,  // 根据需求开启
      responseHeader: true,
      responseBody: true, // 根据需求开启
      error: true,
    ));

// 自定义请求拦截器
    for (int j = 0; j < 1000; j++) {
      dio.interceptors.add(InterceptorsWrapper(
          onResponse: (e, handler) {
            final timenow = DateTime.now().millisecondsSinceEpoch.toInt().toString();
            print("interceptors-$e-$timenow");
            final datastr = e.data.toString();
            print("interceptors-$datastr");
            if(e.data is Map<String, dynamic>) {
              print('xxx');
            }
            for (int i = 0; i < 1000; i++) {
              // print('当前值: $i');
              e.extra["ep-$i"] = DateTime.now().millisecondsSinceEpoch.toString();
              e.requestOptions.extra["epe-$i"] = DateTime.now().millisecondsSinceEpoch.toInt().toString();
            }
            handler.next(e);
          }),

      );
    }



    // 自定义请求拦截器
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        // 可在此处添加统一请求头
        options.headers.addAll({
          'User-Agent': 'MyDownloader/1.0',
          'Accept': '*/*',
        });
        return handler.next(options);
      },
      onError: (DioError error, handler) async {
        // 统一错误处理
        if (error.response?.statusCode != null) {
          print('HTTP错误: ${error.response!.statusCode}');
        }
        // 可在此处添加重试逻辑
        return handler.next(error);
      },
    ));

    return dio;
  }

}