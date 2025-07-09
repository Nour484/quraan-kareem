import 'package:flutter/material.dart';

import '../widget.dart/cate_widget.dart';

class SmallPage extends StatelessWidget {
  double hightSmall;
  double hightLarge;
  SmallPage({required this.hightLarge, required this.hightSmall, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Categories(
                hight: hightSmall,
                image: "assets/images/tafseer.png",
                type: "tafsir",
                typeInArabic: "التفسير"),
            const SizedBox(
              height: 20,
            ),
            Categories(
                hight: hightLarge + 30,
                image: "assets/images/translate.png",
                type: "translation",
                typeInArabic: "الترجمة"),
            const SizedBox(
              height: 20,
            ),
            // Categories(
            //     hight: hightSmall,
            //     image: "assets/images/quraan_audio.png",
            //     type: "versebyverse",
            //     typeInArabic: "القراء"),
          ],
        ),
        Column(
          children: [
            Categories(
              hight: hightLarge,
              image: "assets/images/quraan_audio.png",
              type: "transliteration",
              typeInArabic: " الترجمة الصوتية",
            ),
            const SizedBox(
              height: 20,
            ),
            Categories(
              hight: hightSmall,
              image: "assets/images/1.png",
              type: "quran",
              typeInArabic: " القرآن الكريم",
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        )
      ],
    );
  }
}
