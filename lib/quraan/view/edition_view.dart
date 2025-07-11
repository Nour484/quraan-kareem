import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quraan_kareem/quraan/bloc/Edition%20Bloc/edition_bloc.dart';
import 'package:quraan_kareem/quraan/bloc/Edition%20Bloc/edition_state.dart';
import 'package:quraan_kareem/quraan/view/list_page.dart';

class EditionView extends StatelessWidget {
  final String title;
  final int surhNumber;
  const EditionView({required this.title, required this.surhNumber, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 30,
            fontFamily: 'Amiri Quran',
            color: Colors.black,
          ),
        ),
      ),
      body: BlocBuilder<EditionBloc, EditionState>(
        builder: (context, state) {
          if (state is EditionLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is EditionLoaded) {
            return ListView.builder(
              itemCount: state.edition.length,
              itemBuilder: (context, index) {
                final edition = state.edition[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.brown.shade100,
                    radius: 30,
                    child: Text(edition.language),
                  ),
                  title: Text(
                    textAlign: TextAlign.justify,
                    textDirection: TextDirection.rtl,
                    overflow: TextOverflow.ellipsis,
                    edition.name,
                    style: const TextStyle(
                      // fontSize: 17,
                      fontFamily: 'Amiri Quran',
                      color: Colors.black,
                    ),
                  ),
                  subtitle: Text(
                    textAlign: TextAlign.justify,
                    textDirection: TextDirection.rtl,
                    overflow: TextOverflow.ellipsis,
                    //overflow: TextOverflow.clip,
                    edition.englishName,
                    style: const TextStyle(
                      overflow: TextOverflow.clip,
                      //  fontSize: 30,
                      fontFamily: 'Amiri Quran',
                      color: Colors.black,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ListPage(
                              editionType: edition.identifier,
                              typeInArabic: "typeInArabic")

                          // SurahDetailsScreen(
                          //   surahId: surhNumber,
                          //   identifier: edition.identifier,
                          // ),
                          ),
                    );
                  },
                );
              },
            );
          } else if (state is EditionError) {
            return Center(child: Text(state.message));
          } else {
            return Center(child: Text('No data'));
          }
        },
      ),
    );
  }
}
