import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class DownloadOverlay {
  final ValueNotifier<double> progressNotifier = ValueNotifier(0.0);
  late OverlayEntry _overlayEntry;
  CancelToken cancelToken = CancelToken();

  void show(BuildContext context) {
    _overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          // 半透明背景
          ModalBarrier(
            color: Colors.black.withOpacity(0.5),
            dismissible: false,
          ),
          // 下载内容卡片
          Center(
            child: Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              child: Container(
                width: 250,
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("正在下载中..."),
                    const SizedBox(height: 16),
                    ValueListenableBuilder<double>(
                      valueListenable: progressNotifier,
                      builder: (context, value, _) {
                        return LinearProgressIndicator(
                          value: value,
                          backgroundColor: Colors.grey[200],
                          valueColor: const AlwaysStoppedAnimation(Colors.blue),
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        cancelToken.cancel();
                        hide();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: const Text("取消下载"),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );

    Overlay.of(context).insert(_overlayEntry);
  }

  void hide() {
    _overlayEntry.remove();
  }

  @override
  Element createElement() {
    // TODO: implement createElement
    throw UnimplementedError();
  }


}