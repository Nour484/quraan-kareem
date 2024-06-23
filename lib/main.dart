import 'package:flutter/material.dart';
import 'quraan/view/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          useMaterial3: true, // Enable Material 3
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        title: 'Quran App',
        home: HomePage());
  }
}
