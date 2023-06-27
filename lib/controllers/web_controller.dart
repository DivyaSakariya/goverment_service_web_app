import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebController extends ChangeNotifier {
  InAppWebViewController? webViewController;
  String initialUrl = "https://www.netflix.com/in/";
  bool canBack = false;
  bool canForward = false;
  PullToRefreshController? pullToRefreshController;

  initializeURL({required InAppWebViewController controller}) {
    webViewController = controller;
    pullToRefreshController = PullToRefreshController(
      onRefresh: () {
        webViewController!.reload();
        notifyListeners();
      }
    );
    notifyListeners();
  }

  backBtn() {
    webViewController!.goBack();
    notifyListeners();
  }

  forwardBtn() {
    webViewController!.goForward();
    notifyListeners();
  }

  checkBackForward() async {
    canBack = await webViewController!.canGoBack();
    canForward = await webViewController!.canGoForward();
    notifyListeners();
  }
}
