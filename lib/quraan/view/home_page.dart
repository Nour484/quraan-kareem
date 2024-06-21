import 'package:flutter/material.dart';
import 'package:quraan_kareem/quraan/view/edition_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                        Colors.teal.shade100,
                        Colors.teal.shade200,
                        Colors.teal.shade100
                      ]),
                  //    color: Colors.green,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Categories(
                          hight: hightSmall,
                          image: "assets/images/quraan.png",
                          type: "tafsir"),
                      const SizedBox(
                        height: 20,
                      ),
                      Categories(
                          hight: hightLarge,
                          image: "assets/images/salah.png",
                          type: "translation"),
                      const SizedBox(
                        height: 20,
                      ),
                      Categories(
                          hight: hightSmall,
                          image: "assets/images/quraan.png",
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
                          image: "assets/images/hosnElmuslim.png",
                          type: "quran"),
                    ],
                  )
                ],
              )
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
                0.4,
                1
              ],
              colors: [
                Colors.green.shade100,
                Colors.greenAccent.shade200,
                Colors.teal.shade100
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
              builder: (context) => EditionPage(editionType: type)),
        );
      },
    );
  }
}
