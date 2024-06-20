import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quraan_kareem/quraan/bloc/Surah%20details%20bloc/surah_details_bloc.dart';
import '../bloc/Surah details bloc/surah_details_event.dart';
import '../bloc/Surah details bloc/surah_details_state.dart';

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
              return Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Name: ${surahDetails.name}',
                        style: TextStyle(fontSize: 20)),
                    Text('English Name: ${surahDetails.englishName}',
                        style: TextStyle(fontSize: 20)),
                    Text('Revelation Type: ${surahDetails.revelationType}',
                        style: TextStyle(fontSize: 20)),
                    Text('Number of Ayahs: ${surahDetails.ayahs}',
                        style: TextStyle(fontSize: 20)),
                  ],
                ),
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
