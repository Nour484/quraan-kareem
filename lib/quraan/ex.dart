import 'package:flutter/material.dart';

class Ex extends StatefulWidget {
  const Ex({super.key});

  @override
  State<Ex> createState() => _ExState();
}

class _ExState extends State<Ex> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ExpansionTile(
        title: Text('Expandable Tile'), // The title (header) of the tile
        leading: Icon(Icons.arrow_drop_down), // Optional leading icon
        children: <Widget>[
          ListTile(
            title: Text('This is the content of the expanded tile'),
          ),
          Row(
            children: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.launch))
            ],
          )
        ],
      ),
    );
  }
}
