import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quraan_kareem/quraan/bloc/Surah%20details%20bloc/surah_details_bloc.dart';
import 'package:quraan_kareem/quraan/bloc/Surah%20details%20bloc/surah_details_event.dart';
import 'package:quraan_kareem/quraan/bloc/Surah%20details%20bloc/surah_details_state.dart';
import 'package:quraan_kareem/quraan/model/ayahs.model.dart';

// List<List<Ayah>> paginateAyahs(List<Ayah> ayahs, int ayahsPerPage) {
//   List<List<Ayah>> pages = [];
//   for (var i = 0; i < ayahs.length; i += ayahsPerPage) {
//     pages.add(ayahs.sublist(
//         i, i + ayahsPerPage > ayahs.length ? ayahs.length : i + ayahsPerPage));
//   }
//   return pages;
// }

// Map<int, List<Ayah>> groupAyahsByPage(List<Ayah> ayahs) {
//   Map<int, List<Ayah>> pages = {};
//   for (var ayah in ayahs) {
//     if (!pages.containsKey(ayah.page)) {
//       pages[ayah.page] = [];
//     }
//     pages[ayah.page]!.add(ayah);
//   }
//   return pages;
// }
Map<int, List<Ayah>> groupAyahsByPage(List<Ayah> ayahs) {
  Map<int, List<Ayah>> pages = {};
  for (var ayah in ayahs) {
    if (!pages.containsKey(ayah.page)) {
      pages[ayah.page] = [];
    }
    pages[ayah.page]!.add(ayah);
  }
  return pages;
}

class SurahDetailsScreen extends StatelessWidget {
  final int surahId;

  SurahDetailsScreen({required this.surahId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SurahDetailsBloc()..add(FetchSurahDetails(surahId)),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Surah Details'),
        ),
        body: BlocBuilder<SurahDetailsBloc, SurahDetailsState>(
          builder: (context, state) {
            if (state is SurahDetailsLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is SurahDetailsLoaded) {
              final surahDetails = state.surahDetails;
              final pages = groupAyahsByPage(surahDetails.ayahs);
              final pageNumbers = pages.keys.toList()..sort();

              return PageView.builder(
                itemCount: pageNumbers.length,
                itemBuilder: (context, index) {
                  final pageNumber = pageNumbers[index];
                  final ayahs = pages[pageNumber]!;
                  // String page = ayah.numberInSurah

                  return Padding(
                    padding: EdgeInsets.all(16.0),
                    child:
                        // Column(
                        //   crossAxisAlignment: CrossAxisAlignment.stretch,
                        //   children: [
                        //     Expanded(
                        //       child:
                        SingleChildScrollView(
                      child: RichText(
                        textAlign: TextAlign.right,
                        text: TextSpan(
                          children: ayahs.map((ayah) {
                            return TextSpan(
                              text: '(${ayah.numberInSurah}) ${ayah.text}',
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Amiri Quran',
                                color: Colors.black,
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    //),
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 8.0),
                    //   child: Center(
                    //     child: Text(
                    //       'Page $pageNumber',
                    //       style: TextStyle(
                    //           fontSize: 20, fontWeight: FontWeight.bold),
                    //     ),
                    //   ),
                    // ),
                    // ],
                    //  ),
                  );
                },
              );
            } else if (state is SurahDetailsError) {
              return Center(child: Text(state.message));
            } else {
              return Center(child: Text('No data'));
            }
          },
        ),
      ),
    );
  }
}
