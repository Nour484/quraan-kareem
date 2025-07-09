import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quraan_kareem/quraan/bloc/tranlation%20Bloc/translation_bloc.dart';
import 'package:quraan_kareem/quraan/bloc/tranlation%20Bloc/translation_event.dart';

import 'translaiton_view.dart';

class TransitonPage extends StatelessWidget {
  int surahId;
  String name;
  TransitonPage({super.key, required this.name, required this.surahId});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TranslationBloc()
        ..add(FetchSurahTranslation(surahId, "quran-uthmani")),
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.amber.shade100,
            title: Text(name,
                style: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'Amiri Quran',
                  color: Colors.black,
                )),
            centerTitle: true,
          ),
          body: TranslationView()),
    );
  }
}
