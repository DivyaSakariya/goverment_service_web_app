import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_view_app/controllers/web_controller.dart';
import 'package:web_view_app/views/screens/spalsh_screen.dart';

import 'views/screens/home_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => WebController(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: 'splash_screen',
      routes: {
        'splash_screen': (context) => const SplashScreen(),
        '/': (context) => HomePage(),
      },
    );
  }
}
//
//
//
// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';
// import 'package:pull_to_refresh/pull_to_refresh.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Government Service App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(title: 'Government Service App'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key, required this.title}) : super(key: key);
//
//   final String title;
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   late Connectivity _connectivity;
//   late StreamSubscription<ConnectivityResult> _connectivitySubscription;
//   late InAppWebViewController _webViewController;
//   late RefreshController _refreshController;
//   String _currentUrl = 'https://chat.openai.com/c/970899a1-4872-4462-b4ef-011298ce9b28';
//
//   @override
//   void initState() {
//     super.initState();
//     _connectivity = Connectivity();
//     _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
//     _refreshController = RefreshController(initialRefresh: false);
//   }
//
//   @override
//   void dispose() {
//     _connectivitySubscription.cancel();
//     super.dispose();
//   }
//
//   void _updateConnectionStatus(ConnectivityResult result) {
//     setState(() {
//       // Handle connectivity changes here
//     });
//   }
//
//   Future<void> _loadUrl(String url) async {
//     if (await _webViewController.canGoBack()) {
//       await _webViewController.goBack();
//     } else {
//       // await _webViewController.loadUrl(urlRequest: Uri.parse(url));
//     }
//   }
//
//   void _onRefresh() async {
//     await _loadUrl(_currentUrl);
//     _refreshController.refreshCompleted();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: StreamBuilder<ConnectivityResult>(
//               stream: _connectivity.onConnectivityChanged,
//               builder: (BuildContext context, AsyncSnapshot<ConnectivityResult> snapshot) {
//                 if (snapshot.hasData) {
//                   final result = snapshot.data;
//                   if (result == ConnectivityResult.none) {
//                     return Center(
//                       child: Text('No internet connection'),
//                     );
//                   }
//                 }
//                 return InAppWebView(
//                   initialUrlRequest: URLRequest(url: Uri.parse(_currentUrl)),
//                   onWebViewCreated: (controller) {
//                     _webViewController = controller;
//                   },
//                 );
//               },
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               IconButton(
//                 icon: Icon(Icons.arrow_back),
//                 onPressed: () async {
//                   if (await _webViewController.canGoBack()) {
//                     await _webViewController.goBack();
//                   }
//                 },
//               ),
//               IconButton(
//                 icon: Icon(Icons.refresh),
//                 onPressed: () {
//                   _onRefresh();
//                 },
//               ),
//               IconButton(
//                 icon: Icon(Icons.arrow_forward),
//                 onPressed: () async {
//                   if (await _webViewController.canGoForward()) {
//                     await _webViewController.goForward();
//                   }
//                 },
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
