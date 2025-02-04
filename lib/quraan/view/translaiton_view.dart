// main.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/tranlation Bloc/translation_bloc.dart';
import '../bloc/tranlation Bloc/translation_state.dart';

class TranslationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
        // Scaffold(
        //   extendBody: true,
        //    appBar: AppBar(title: Text('Surah Al-Faatiha')),
        //   body:
        BlocBuilder<TranslationBloc, TranslationState>(
      builder: (context, state) {
        if (state is TranslationLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is TranslationLoaded) {
          return ListView.builder(
            itemCount: state.surahs[0].ayahs.length,
            itemBuilder: (context, index) => ExpansionTile(
              title: Column(
                children: [
                  // Text(
                  //   state.surahs[0].ayahs[0].text,
                  // ),
                  SelectableText(
                      style: const TextStyle(
                        fontSize: 20,
                        fontFamily: 'Amiri Quran',
                        color: Colors.black,
                      ),
                      """ ${state.surahs[0].ayahs[index].text}  (${state.surahs[0].ayahs[index].numberInSurah})"""),
                  SizedBox(
                    height: 20,
                  ),
                  SelectableText(
                    state.surahs[2].ayahs[index].text,
                    style: const TextStyle(
                      fontSize: 20,
                      fontFamily: 'Amiri Quran',
                      color: Colors.black,
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  SelectableText(
                    state.surahs[1].ayahs[index].text,
                    style: const TextStyle(
                      fontSize: 20,
                      fontFamily: 'Amiri Quran',
                      color: Colors.black,
                    ),
                  ),
                  Divider()
                ],
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: SelectableText(
                      textAlign: TextAlign.right,
                      state.surahs[3].ayahs[index].text,
                      style: const TextStyle(
                        fontSize: 20,
                        fontFamily: 'Amiri Quran',
                        color: Colors.black,
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        } else if (state is TranslationError) {
          return Center(child: Text(state.message));
        }
        return Container();
      },
    );
  }
}
