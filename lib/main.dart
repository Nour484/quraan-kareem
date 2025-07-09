import 'package:flutter/material.dart';
import 'package:quraan_kareem/quraan/view/home/layout/large_page.dart';
import 'quraan/view/home/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true, // Enable Material 3
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown.shade300),
        ),
        title: 'Quran App',
        home: HomePage());
  }
}
