import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quraan_kareem/quraan/bloc/Surah%20details%20bloc/surah_details_bloc.dart';
import 'package:quraan_kareem/quraan/bloc/Surah%20details%20bloc/surah_details_event.dart';
import 'package:quraan_kareem/quraan/bloc/Surah%20details%20bloc/surah_details_state.dart';
import 'package:quraan_kareem/quraan/model/ayahs.model.dart';

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
  const SurahDetailsScreen(
      {super.key, required this.surahId, required this.identifier});
  final int surahId;
  final String identifier;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SurahDetailsBloc()..add(FetchSurahDetails(surahId, identifier)),
      child: BlocBuilder<SurahDetailsBloc, SurahDetailsState>(
        builder: (context, state) {
          if (state is SurahDetailsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SurahDetailsLoaded) {
            final surahDetails = state.surahDetails;
            final pages = groupAyahsByPage(surahDetails.ayahs);
            final pageNumbers = pages.keys.toList()..sort();

            return Scaffold(
                extendBody: true,
                appBar: AppBar(
                  centerTitle: true,
                  title: Text(surahDetails.name,
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'Amiri Quran',
                        color: Colors.black,
                      )),
                ),
                body: ListView.builder(
                  scrollDirection: Axis.vertical,
                  // reverse: true,
                  itemCount: pageNumbers.length,
                  itemBuilder: (context, index) {
                    final pageNumber = pageNumbers[index];
                    final ayahs = pages[pageNumber]!;
                    // String page = ayah.numberInSurah

                    return Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: RichText(
                              textAlign: TextAlign.justify,
                              textDirection: TextDirection.rtl,
                              // textAlign: TextAlign.right,
                              text: TextSpan(
                                children: ayahs.map((ayah) {
                                  return TextSpan(
                                    text:
                                        '${ayah.text}(${ayah.numberInSurah}) ',
                                    style: TextStyle(
                                      fontSize: 16,
                                      // MediaQuery.sizeOf(context).width *
                                      //     0.0012,
                                      //  fontFamily: 'Amiri Quran',
                                      color: Colors.black,
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Center(
                              child: Text(
                                'Page $pageNumber',
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ));
          } else if (state is SurahDetailsError) {
            return Center(child: Text(state.message));
          } else {
            return Center(child: Text('No data'));
          }
        },
      ),
    );
  }
}
