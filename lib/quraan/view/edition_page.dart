import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quraan_kareem/quraan/bloc/Edition%20Bloc/edition_bloc.dart';
import 'package:quraan_kareem/quraan/bloc/Edition%20Bloc/edition_event.dart';
import 'package:quraan_kareem/quraan/view/edition_view.dart';
import 'package:quraan_kareem/quraan/view/list_view.dart';

class EditionPage extends StatelessWidget {
  final String editionType;
  final int surahNumber;

  EditionPage({required this.editionType, required this.surahNumber});
  // const EditionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditionBloc()..add(FetchEdition(editionType)),
      child: EditionView(
        title: editionType,
        surhNumber: surahNumber,
      ),
    );
  }
}
