import 'package:flutter/material.dart';
import 'package:quraan_kareem/quraan/bloc/Next%20Prayer%20Time/time_bloc.dart';
import 'package:quraan_kareem/quraan/view/adhan_page.dart';
import 'package:quraan_kareem/quraan/view/b.dart';
import 'package:quraan_kareem/quraan/view/edition_page.dart';
import 'package:quraan_kareem/quraan/view/list_page.dart';

String getNextPrayer(Map<String, DateTime> prayerTimes, DateTime now) {
  for (var prayer in prayerTimes.entries) {
    if (prayer.value.isAfter(now)) {
      return prayer.key;
    }
  }
  return 'Next day Fajr'; // Example fallback if all times are past 'now'
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<PrayerTimes> _prayerTimes;

  @override
  void initState() {
    super.initState();
    _prayerTimes = fetchPrayerTimes();
  }

  @override
  Widget build(BuildContext context) {
    double hightLarge = MediaQuery.sizeOf(context).height * 0.26;
    double hightSmall = MediaQuery.sizeOf(context).height * 0.22;
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width * 0.9,
                height: MediaQuery.sizeOf(context).height * 0.22,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      stops: const [
                        0.1,
                        0.4,
                        1
                      ],
                      colors: [
                        Colors.blueGrey.shade100,
                        Colors.blueGrey.shade200,
                        Colors.blueGrey.shade100
                      ]),
                  //    color: Colors.green,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: FutureBuilder<PrayerTimes>(
                  future: _prayerTimes,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (snapshot.hasData) {
                      PrayerTimes prayerTimes = snapshot.data!;
                      String nextPrayer =
                          getNextPrayer(prayerTimes.times, DateTime.now());
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Next Prayer: $nextPrayer',
                              style: const TextStyle(fontSize: 24)),
                          const SizedBox(height: 20),

                          // Example of displaying all prayer times
                          // for (var entry in prayerTimes.times.entries)
                          //   ListTile(
                          //     title: Text(
                          //         '${entry.key}: ${DateFormat.Hm().format(entry.value)}'),
                          //   ),
                        ],
                      );
                    } else {
                      return Text('Press the button to fetch prayer times');
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Categories(
                          hight: hightSmall,
                          image: "assets/images/tafseer.png",
                          type: "tafsir"),
                      const SizedBox(
                        height: 20,
                      ),
                      Categories(
                          hight: hightLarge + 30,
                          image: "assets/images/translate.png",
                          type: "translation"),
                      const SizedBox(
                        height: 20,
                      ),
                      Categories(
                          hight: hightSmall,
                          image: "assets/images/1.png",
                          type: "versebyverse"),
                    ],
                  ),
                  Column(
                    children: [
                      Categories(
                          hight: hightLarge,
                          image: "assets/images/masbaha.png",
                          type: "transliteration"),
                      const SizedBox(
                        height: 20,
                      ),
                      Categories(
                          hight: hightSmall,
                          image: "assets/images/quraan_audio.png",
                          type: "quran"),
                      const SizedBox(
                        height: 20,
                      ),
                      PrayTimeWidget(
                          hight: hightLarge,
                          image: "assets/images/salah.png",
                          type: "quran"),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Categories extends StatelessWidget {
  const Categories({
    required this.image,
    required this.type,
    required this.hight,
    super.key,
  });
  final double hight;
  final String image;
  final String type;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.4,
        height: hight,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              stops: const [
                0.1,
                0.5,
                1
              ],
              colors: [
                Colors.brown.shade100,
                Colors.brown.shade50,
                Colors.brown.shade100
              ]),
          //    color: Colors.green,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Image.asset(image),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ListPage(editionType: type)),
        );
      },
    );
  }
}

class PrayTimeWidget extends StatelessWidget {
  const PrayTimeWidget({
    required this.image,
    required this.type,
    required this.hight,
    super.key,
  });
  final double hight;
  final String image;
  final String type;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.4,
        height: hight,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              stops: const [
                0.1,
                0.5,
                1
              ],
              colors: [
                Colors.brown.shade100,
                Colors.brown.shade50,
                Colors.brown.shade100
              ]),
          //    color: Colors.green,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Image.asset(image),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddnScreen()),
        );
      },
    );
  }
}
