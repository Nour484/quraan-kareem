import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quraan_kareem/quraan/bloc/Adahn%20Bloc/adahn_bloc.dart';
import 'package:quraan_kareem/quraan/bloc/Adahn%20Bloc/adahn_event.dart';

import 'adahn_view.dart';

class AdhanPage extends StatelessWidget {
  const AdhanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => PrayerTimesBloc()
          ..add(FetchPrayerTimes(latitude: 31.201965, longitude: 29.94805)),
        child: PrayerTimesScreen());
  }
}
