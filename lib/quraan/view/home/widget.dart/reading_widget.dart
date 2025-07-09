import 'package:flutter/material.dart';

import '../../list_page.dart';

class readingTimeWidget extends StatelessWidget {
  const readingTimeWidget({
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
        // width: MediaQuery.sizeOf(context).width * 0.99,
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
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Image.asset(image),
          Text("أقرأ و تدبر ",
              style: const TextStyle(
                fontSize: 40,
                fontFamily: 'Amiri Quran',
                color: Colors.black,
              ))
        ]),
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
