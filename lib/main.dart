import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_view_app/controllers/web_controller.dart';
import 'package:web_view_app/views/screens/home_page.dart';
import 'package:web_view_app/views/screens/splash_screen.dart';

import 'views/screens/web_page.dart';

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
        'web_page': (context) => WebPage(),
      },
    );
  }
}