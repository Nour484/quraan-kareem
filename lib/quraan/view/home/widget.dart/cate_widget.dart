import 'package:flutter/material.dart';
import 'package:quraan_kareem/quraan/view/edition_page.dart';

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
        width: MediaQuery.sizeOf(context).width * 0.45,
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
                Colors.brown.shade100,
              ]),
          //    color: Colors.green,
          borderRadius: BorderRadius.circular(20),
        ),
        child: MediaQuery.sizeOf(context).width < 600
            ? Column(children: [
                Image.asset(
                  image,
                  height: 200,
                  width: 200,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 10),
                Text(typeInArabic,
                    style: const TextStyle(
                        fontSize: 20,
                        fontFamily: 'Amiri Quran',
                        color: Colors.black)),
                Text(type,
                    style: const TextStyle(
                        fontSize: 20,
                        fontFamily: 'Amiri Quran',
                        color: Colors.black))
              ])
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    height: 200,
                    width: 200,
                    image,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(typeInArabic,
                          style: const TextStyle(
                              fontSize: 20,
                              fontFamily: 'Amiri Quran',
                              color: Colors.black)),
                      Text(type,
                          style: const TextStyle(
                              fontSize: 20,
                              fontFamily: 'Amiri Quran',
                              color: Colors.black))
                    ],
                  )
                ],
              ),
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
