import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quraan_kareem/quraan/bloc/Adahn%20Bloc/adahn_bloc.dart';
import 'package:quraan_kareem/quraan/bloc/Adahn%20Bloc/adahn_state.dart';
import '../bloc/Adahn Bloc/adahn_event.dart';

class PrayerTimesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prayer Times'),
      ),
      body: BlocBuilder<PrayerTimesBloc, PrayerTimesState>(
        builder: (context, state) {
          if (state is PrayerTimesLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is PrayerTimesLoaded) {
            final timings = state.prayerTimesResponse.data.timings;
            return ListView(
              children: [
                ListTile(title: Text('Fajr: ${timings.fajr}')),
                ListTile(title: Text('Sunrise: ${timings.sunrise}')),
                ListTile(title: Text('Dhuhr: ${timings.dhuhr}')),
                ListTile(title: Text('Asr: ${timings.asr}')),
                ListTile(title: Text('Sunset: ${timings.sunset}')),
                ListTile(title: Text('Maghrib: ${timings.maghrib}')),
                ListTile(title: Text('Isha: ${timings.isha}')),
                ListTile(title: Text('Imsak: ${timings.imsak}')),
                ListTile(title: Text('Midnight: ${timings.midnight}')),
                ListTile(title: Text('First Third: ${timings.firstthird}')),
                ListTile(title: Text('Last Third: ${timings.lastthird}')),
              ],
            );
          } else if (state is PrayerTimesError) {
            return Center(child: Text(state.message));
          } else {
            return Center(
                child: Text('Press the button to fetch prayer times'));
          }
        },
      ),
    );
  }
}
