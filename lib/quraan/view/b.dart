import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quraan_kareem/quraan/model/adahn_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<PrayerTimesResponse> fetchAlbum(String url) async {
  DateTime now = DateTime.now();
  // DateTime date = new DateTime(now.year, now.month, now.day);
  var formatter = DateFormat('dd-MM-yyyy');
  String formattedDate = formatter.format(now);

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return PrayerTimesResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load  prayer time ');
  }
}

class AddnScreen extends StatefulWidget {
  const AddnScreen({super.key});

  @override
  State<AddnScreen> createState() => _MyAppState();
}

class _MyAppState extends State<AddnScreen> {
  String formattedDate = "";
  late Future<PrayerTimesResponse> futureAlbum;

  @override
  void initState() {
    super.initState();
    DateTime now = DateTime.now();
    var formatter = DateFormat('dd-MM-yyyy');
    formattedDate = formatter.format(now);
    print(formattedDate);
    futureAlbum = fetchAlbum(
        'https://api.aladhan.com/v1/timingsByCity/$formattedDate?city=Alexandria&country=Egypt&method=8');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adhan ',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      home: FutureBuilder<PrayerTimesResponse>(
        future: futureAlbum,
        builder: (context, snapshot) {
          //

          // DateFormat()

          if (snapshot.hasData) {
            const textStyle = TextStyle(fontFamily: "Gulzar", fontSize: 25);
            return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(snapshot.data!.data.date.hijri.day, style: textStyle),
                    Text(snapshot.data!.data.date.hijri.month.ar ?? "",
                        style: textStyle),
                    Text(" ${snapshot.data!.data.date.hijri.year}",
                        style: textStyle),
                    Text("  , ${snapshot.data!.data.date.hijri.weekday.ar}",
                        style: textStyle),
                  ],
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  // height: MediaQuery.sizeOf(context).height * 0.5,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const Text('موعد  الآذان',
                            style:
                                TextStyle(fontFamily: "Gulzar", fontSize: 25)),
                        Card(
                            child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      snapshot.data!.data.timings.fajr,
                                      style: textStyle,
                                    ),
                                    const Text(
                                      "الفجر",
                                      style: textStyle,
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      snapshot.data!.data.timings.sunrise,
                                      style: textStyle,
                                    ),
                                    const Text(
                                      "الشروق",
                                      style: textStyle,
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      snapshot.data!.data.timings.dhuhr,
                                      style: textStyle,
                                    ),
                                    const Text(
                                      "الظهر ",
                                      style: textStyle,
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      snapshot.data!.data.timings.asr,
                                      style: textStyle,
                                    ),
                                    const Text(
                                      "العصر",
                                      style: textStyle,
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      snapshot.data!.data.timings.maghrib,
                                      style: textStyle,
                                    ),
                                    const Text(
                                      "المغرب",
                                      style: textStyle,
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          snapshot.data!.data.timings.isha,
                                          style: textStyle,
                                        ),
                                        const Text(
                                          "العشاء",
                                          style: textStyle,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "قيام اليل",
                            style: textStyle,
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    snapshot.data!.data.timings.firstthird,
                                    style: textStyle,
                                  ),
                                  const Text(
                                    "الثلث الأول من الليل ",
                                    style: textStyle,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    snapshot.data!.data.timings.midnight,
                                    style: textStyle,
                                  ),
                                  const Text(
                                    "منتصف اليل",
                                    style: textStyle,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    snapshot.data!.data.timings.lastthird,
                                    style: textStyle,
                                  ),
                                  const Text(
                                    "الثلث الأخير من اليل ",
                                    style: textStyle,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 80,
                        ),
                        const Center(
                          child: Padding(
                            padding: EdgeInsets.all(.0),
                            child: Text(
                              "إنَّ الصَّلاَةَ تَنْهَى عَنِ الْفَحْشَاءِ وَالْمُنْكَرِ",
                              style: TextStyle(
                                  fontFamily: "Gulzar",
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          // By default, show a loading spinner.
          return const Scaffold(
              body: Center(child: CircularProgressIndicator()));
        },
      ),
    );
  }
}
