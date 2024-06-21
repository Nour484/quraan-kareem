import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quraan_kareem/quraan/bloc/Edition%20Bloc/edition_bloc.dart';
import 'package:quraan_kareem/quraan/bloc/Edition%20Bloc/edition_event.dart';
import 'package:quraan_kareem/quraan/view/edition_view.dart';

class EditionPage extends StatelessWidget {
  final String editionType;

  const EditionPage({super.key, required this.editionType});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditionBloc()..add(FetchEdition(editionType)),
      child: EditionView(title: editionType),
    );
  }
}
