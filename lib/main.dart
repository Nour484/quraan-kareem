import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quraan_kareem/quraan/bloc/Surah%20list%20Bloc/surah_event.dart';
import 'quraan/bloc/Surah list Bloc/surah_bloc.dart';
import 'quraan/view/list_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quran App',
      home: BlocProvider(
        create: (context) => SurahListBloc()..add(FetchSurahList()),
        child: SurahListScreen(),
      ),
    );
  }
}
