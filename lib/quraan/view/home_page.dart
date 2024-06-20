import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quraan_kareem/quraan/bloc/Surah%20list%20Bloc/surah_bloc.dart';
import 'package:quraan_kareem/quraan/view/list_page.dart';
import 'package:quraan_kareem/quraan/view/list_view.dart';

import '../bloc/Surah list Bloc/surah_event.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var boxDecoration = BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          stops: [
            0.1,
            0.4,
            1
          ],
          colors: [
            Colors.teal.shade900,
            Colors.teal.shade800,
            Colors.teal.shade700
          ]),
      //    color: Colors.green,
      borderRadius: BorderRadius.circular(20),
    );
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width * 0.9,
              height: MediaQuery.sizeOf(context).height * 0.22,
              decoration: boxDecoration,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 0.4,
                        height: MediaQuery.sizeOf(context).height * 0.22,
                        decoration: boxDecoration,
                        child: Image.asset("assets/images/quraan.png"),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ListPage()),
                        );
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width * 0.4,
                      height: MediaQuery.sizeOf(context).height * 0.26,
                      decoration: boxDecoration,
                      child: Image.asset("assets/images/salah.png"),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width * 0.4,
                      height: MediaQuery.sizeOf(context).height * 0.26,
                      decoration: boxDecoration,
                      child: Image.asset("assets/images/masbaha.png"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width * 0.4,
                      height: MediaQuery.sizeOf(context).height * 0.22,
                      decoration: boxDecoration,
                      child: Image.asset("assets/images/hosnElmuslim.png"),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
