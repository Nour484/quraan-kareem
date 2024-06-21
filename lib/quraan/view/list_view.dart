import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quraan_kareem/quraan/bloc/Surah%20list%20Bloc/surah_bloc.dart';
import 'package:quraan_kareem/quraan/bloc/Surah%20list%20Bloc/surahs_state.dart';
import 'package:quraan_kareem/quraan/view/details_view.dart';

class SurahListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quran Surahs'),
      ),
      body: BlocBuilder<SurahListBloc, SurahListState>(
        builder: (context, state) {
          if (state is SurahListLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SurahListLoaded) {
            return ListView.builder(
              itemCount: state.surahs.length,
              itemBuilder: (context, index) {
                final surah = state.surahs[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ListTile(
                      // trailing: IconButton(
                      //     onPressed: () {}, icon: Icon(Icons.translate)),
                      leading: IconButton(
                          onPressed: () {}, icon: const Icon(Icons.translate)),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(surah.name),
                        ],
                      ),
                      subtitle: Text(surah.englishName),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                SurahDetailsScreen(surahId: surah.number),
                          ),
                        );
                      },
                    ),
                    const Divider()
                  ],
                );
              },
            );
          } else if (state is SurahListError) {
            return Center(child: Text(state.message));
          } else {
            return Center(child: Text('No data'));
          }
        },
      ),
    );
  }
}
