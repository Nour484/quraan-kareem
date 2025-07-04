import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quraan_kareem/quraan/bloc/Surah%20list%20Bloc/surah_bloc.dart';
import 'package:quraan_kareem/quraan/bloc/Surah%20list%20Bloc/surah_event.dart';
import 'package:quraan_kareem/quraan/view/list_view.dart';

class ListPage extends StatelessWidget {
  final String editionType; 
  final String typeInArabic ; 

  ListPage({required this.editionType, required this.typeInArabic, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SurahListBloc()..add(FetchSurahList()),
      child: SurahListScreen(editionType: editionType ,  typeInArabic :typeInArabic),
    );
  }
}
