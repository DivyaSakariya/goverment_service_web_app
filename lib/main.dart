import 'package:flutter/material.dart';
import 'package:web_view_app/views/screens/spalsh_screen.dart';

import 'views/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
      ),
      initialRoute: 'splash_screen',
      routes: {
        'splash_screen': (context) => const SplashScreen(),
        '/': (context) => HomePage(),
      },
    );
  }
}
