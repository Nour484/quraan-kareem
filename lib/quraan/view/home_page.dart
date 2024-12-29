import 'package:flutter/material.dart';
import 'package:quraan_kareem/quraan/view/edition_page.dart';
import 'package:quraan_kareem/quraan/view/list_page.dart';
import 'package:quraan_kareem/quraan/view/translation_page.dart';

String getNextPrayer(Map<String, DateTime> prayerTimes, DateTime now) {
  for (var prayer in prayerTimes.entries) {
    if (prayer.value.isAfter(now)) {
      return prayer.key;
    }
  }
  return 'Next day Fajr'; // Example fallback if all times are past 'now'
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double hightLarge = MediaQuery.sizeOf(context).height * 0.26;
    double hightSmall = MediaQuery.sizeOf(context).height * 0.22;
    return Scaffold(
      drawer: Drawer(),
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
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                height: 20,
              ),
              // Container(
              //     width: MediaQuery.sizeOf(context).width * 0.9,
              //     height: MediaQuery.sizeOf(context).height * 0.22,
              //     decoration: BoxDecoration(
              //       gradient: LinearGradient(
              //           begin: Alignment.bottomLeft,
              //           end: Alignment.topRight,
              //           stops: const [
              //             0.1,
              //             0.4,
              //             1
              //           ],
              //           colors: [
              //             Colors.blueGrey.shade100,
              //             Colors.blueGrey.shade200,
              //             Colors.blueGrey.shade100
              //           ]),
              //       //    color: Colors.green,
              //       borderRadius: BorderRadius.circular(20),
              //     ),
              //     child: Image.asset(
              //       "assets/images/top_bg.jpg",
              //       fit: BoxFit.fill,
              //     )),
              // const SizedBox(
              //   height: 20,
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Column(
                  //   children: [
                  //     // Categories(
                  //     //     hight: hightSmall,
                  //     //     image: "assets/images/tafseer.png",
                  //     //     type: "tafsir",
                  //     //     typeInArabic: "التفسير"),
                  //     // const SizedBox(
                  //     //   height: 20,
                  //     // ),
                  //     // Categories(
                  //     //     hight: hightLarge + 30,
                  //     //     image: "assets/images/translate.png",
                  //     //     type: "translation",
                  //     //     typeInArabic: "الترجمة"),
                  //     // const SizedBox(
                  //     //   height: 20,
                  //     // ),
                  //     // Categories(
                  //     //     hight: hightSmall,
                  //     //     image: "assets/images/quraan_audio.png",
                  //     //     type: "versebyverse",
                  //     //     typeInArabic: "القراء"),
                  //   ],
                  // ),
                  Column(
                    children: [
                      // Categories(
                      //   hight: hightLarge,
                      //   image: "assets/images/masbaha.png",
                      //   type: "transliteration",
                      //   typeInArabic: " الترجمة الصوتية",
                      // ),
                      // const SizedBox(
                      //   height: 20,
                      // ),
                      // Categories(
                      //   hight: hightSmall,
                      //   image: "assets/images/1.png",
                      //   type: "quran",
                      //   typeInArabic: " القرآن الكريم",
                      // ),
                      // const SizedBox(
                      //   height: 20,
                      // ),
                      PrayTimeWidget(
                          hight: hightLarge,
                          image: "assets/images/translate.png",
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
    required this.typeInArabic,
    required this.hight,
    super.key,
  });
  final double hight;
  final String image;
  final String type;
  final String typeInArabic;

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
          MaterialPageRoute(
              builder: (context) => EditionPage(
                    editionType: type,
                    surahNumber: 1,
                  )),
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
          MaterialPageRoute(
              builder: (context) => ListPage(
                    editionType: 'No',
                    typeInArabic: '',
                  )),
        );
      },
    );
  }
}
