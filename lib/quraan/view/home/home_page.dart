import 'package:flutter/material.dart';
import 'package:quraan_kareem/quraan/view/home/layout/large_page.dart';
import 'package:quraan_kareem/quraan/view/home/layout/small_page.dart';
import 'package:quraan_kareem/quraan/view/home/widget.dart/reading_widget.dart';
import 'package:quraan_kareem/quraan/view/list_page.dart';

// String getNextPrayer(Map<String, DateTime> prayerTimes, DateTime now) {
//   for (var prayer in prayerTimes.entries) {
//     if (prayer.value.isAfter(now)) {
//       return prayer.key;
//     }
//   }
//   return 'Next day Fajr'; // Example fallback if all times are past 'now'
// }

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double hightLarge;
    double hightSmall;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          " القرآن الكريم",
          style: TextStyle(
            fontSize: 30,
            fontFamily: 'Amiri Quran',
            color: Colors.black,
          ),
        ),
        //  actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.sizeOf(context).width * 0.95,
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
                child: readingTimeWidget(
                    hight: MediaQuery.sizeOf(context).height * 0.25,
                    image: "assets/images/quraan_kareem.png",
                    type: "quran"),
              ),
              const SizedBox(
                height: 20,
              ),
              LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  if (constraints.maxWidth < 600) {
                    hightLarge = MediaQuery.sizeOf(context).height * 0.5;
                    hightSmall = MediaQuery.sizeOf(context).height * 0.4;
                    // Small screen layout
                    return SmallPage(
                        hightLarge: hightLarge, hightSmall: hightSmall);
                  } else {
                    hightLarge = MediaQuery.sizeOf(context).height * 0.3;
                    hightSmall = MediaQuery.sizeOf(context).height * 0.2;
                    // Large screen layout
                    return LargePage(
                        hightLarge: hightLarge, hightSmall: hightSmall);
                  }
                },
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
