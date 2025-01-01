import 'package:flutter/material.dart';
import 'package:quraan_kareem/buit_value_test/fetch_data.dart';

import '../model/quraan.dart';

class AyahListScreen extends StatelessWidget {
  final int surahNumber;
  final String surahName;

  AyahListScreen({required this.surahNumber, required this.surahName});

  @override
  Widget build(BuildContext context) {
    final QuranApiService apiService = QuranApiService();

    return Scaffold(
      appBar: AppBar(
        title: Text("Ayahs of $surahName"),
      ),
      body: FutureBuilder<List<Ayahs>>(
        future: apiService
            .fetchAyahs(surahNumber), // Implement this in your service
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No Ayahs available"));
          }

          final ayahs = snapshot.data!;
          return ListView.builder(
            itemCount: ayahs.length,
            itemBuilder: (context, index) {
              final ayah = ayahs[index];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: ListTile(
                  title: Text(ayah.text),
                  subtitle: Text("Page: ${ayah.page}"),
                  trailing: ayah.sajda
                      ? const Icon(Icons.check, color: Colors.green)
                      : null,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
