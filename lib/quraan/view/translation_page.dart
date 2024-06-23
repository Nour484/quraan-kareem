import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quraan_kareem/quraan/bloc/tranlation%20Bloc/translation_bloc.dart';
import 'package:quraan_kareem/quraan/bloc/tranlation%20Bloc/translation_event.dart';

import 'translaiton_view.dart';

class TransitonPage extends StatelessWidget {
  int surahId;
  TransitonPage({required this.surahId});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => TranslationBloc()
          ..add(FetchSurahTranslation(surahId, "quran-uthmani")),
        child: TranslationView(),
      ),
    );
  }
}
