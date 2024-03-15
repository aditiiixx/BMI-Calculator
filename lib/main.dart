import 'package:bmi_calc/result_page.dart';
import 'package:flutter/material.dart';

import 'Home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFFc7e5c9),
        scaffoldBackgroundColor: Color(0xFFc7e5c9),
      ),
      initialRoute: '/HomePage',
      routes: {
        '/HomePage': (context) => const HomePage(),
        '/Results': (context) => const ResultPage(),
      },
    );
  }
}

