import 'package:flutter/material.dart';
import 'package:quraan_kareem/quraan/ex.dart';
import 'buit_value_test/view/surah_view.dart';
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
        home: SurahListScreen());
  }
}
