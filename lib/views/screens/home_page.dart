import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:provider/provider.dart';
import 'package:web_view_app/controllers/web_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  Connectivity connectivityResult = Connectivity();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          bool willPS = await Provider.of<WebController>(context, listen: false).webViewController!.canGoBack();

          if(willPS) {
            Provider.of<WebController>(context, listen: false).webViewController!.goBack();
          }
          return !willPS;
        },
        child: Consumer<WebController>(builder: (context, provider, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Netflix"),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.bookmarks),
                ),
                Visibility(
                  visible: provider.canBack,
                  child: IconButton(
                    onPressed: () {
                      provider.backBtn();
                    },
                    icon: const Icon(Icons.arrow_back_ios_new_rounded),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    provider.webViewController!.reload();
                  },
                  icon: const Icon(Icons.refresh_rounded),
                ),
                Visibility(
                  visible: provider.canForward,
                  child: IconButton(
                    onPressed: () {
                      provider.forwardBtn();
                    },
                    icon: const Icon(Icons.arrow_forward_ios_rounded),
                  ),
                ),
              ],
            ),
            body: StreamBuilder(
              stream: connectivityResult.onConnectivityChanged,
              builder: (context, snapShot) {
                if (snapShot.hasData) {
                  ConnectivityResult result = snapShot.data!;

                  if (result == ConnectivityResult.none) {
                    return const Center(
                      child: Text('No internet connection'),
                    );
                  }

                  // switch (result) {
                  //   case ConnectivityResult.mobile:
                  //     return const Center(
                  //       child: Text("Connected with Mobile Network...!!"),
                  //     );
                  //   case ConnectivityResult.wifi:
                  //     return Container(
                  //       padding: EdgeInsets.all(12),
                  //       child: InAppWebView(
                  //         initialUrlRequest: URLRequest(url: Uri.parse(provider.initialUrl)),
                  //         onWebViewCreated: (controller) {
                  //           provider.initializeURL(controller: controller);
                  //         },
                  //       ),
                  //     );
                  //   case ConnectivityResult.none:
                  //     return const Center(
                  //       child: Text("Not Connected with any Network...!!"),
                  //     );
                  //   default:
                  //     return const Center(
                  //       child: CircularProgressIndicator(),
                  //     );
                  // }
                } else if (snapShot.hasError) {
                  return const Center(
                    child: Text("Not Connected with any Network...!!"),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return InAppWebView(
                  pullToRefreshController: provider.pullToRefreshController,
                  initialUrlRequest:
                      URLRequest(url: Uri.parse(provider.initialUrl)),
                  onWebViewCreated: (controller) {
                    provider.initializeURL(controller: controller);
                  },
                  onLoadStart: (controller, url) {
                    provider.checkBackForward();
                  },
                  onLoadStop: (controller, url) {
                    provider.checkBackForward();
                  },
                );
              },
            ),
          );
        }),
      ),
    );
  }
}
