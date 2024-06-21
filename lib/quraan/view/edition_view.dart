import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quraan_kareem/quraan/bloc/Edition%20Bloc/edition_bloc.dart';
import 'package:quraan_kareem/quraan/bloc/Edition%20Bloc/edition_state.dart';
import 'package:quraan_kareem/quraan/view/details_view.dart';

class EditionView extends StatelessWidget {
  final String title;
  final int surhNumber;
  const EditionView({required this.title, required this.surhNumber, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
      ),
      body: BlocBuilder<EditionBloc, EditionState>(
        builder: (context, state) {
          if (state is EditionLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is EditionLoaded) {
            return ListView.builder(
              itemCount: state.edition.length,
              itemBuilder: (context, index) {
                final edition = state.edition[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(edition.name),
                        ],
                      ),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(edition.englishName),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SurahDetailsScreen(
                              surahId: surhNumber,
                              identifier: edition.identifier,
                            ),
                          ),
                        );
                      },
                    ),
                    const Divider()
                  ],
                );
              },
            );
          } else if (state is EditionError) {
            return Center(child: Text(state.message));
          } else {
            return Center(child: Text('No data'));
          }
        },
      ),
    );
  }
}
