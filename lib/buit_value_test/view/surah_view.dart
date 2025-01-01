import 'package:flutter/material.dart';
import 'package:quraan_kareem/buit_value_test/fetch_data.dart';
import 'package:quraan_kareem/buit_value_test/model/quraan.dart';
import 'package:quraan_kareem/buit_value_test/view/ayahs_view.dart';

class SurahListScreen extends StatelessWidget {
  final QuranApiService apiService = QuranApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quran Surahs"),
      ),
      body: FutureBuilder<List<Surahs>>(
        future: apiService.fetchSurahs(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No data available"));
          }

          final surahs = snapshot.data!;
          return ListView.builder(
            itemCount: surahs.length,
            itemBuilder: (context, index) {
              final surah = surahs[index];
              return InkWell(
                child: Card(
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text(surah.number.toString()),
                    ),
                    title: Text(surah.name),
                    subtitle: Text(surah.englishNameTranslation),
                    trailing: Text(surah.revelationType),
                    onTap: () {
                      // Navigate to a detailed Ayah view (optional)
                    },
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AyahListScreen(
                        surahNumber: surah.number,
                        surahName: surah.name,
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
