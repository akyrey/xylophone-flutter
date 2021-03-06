import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() {
  runApp(XylophoneApp());
}

class XylophoneApp extends StatelessWidget {
  final player = AudioCache();
  final notes = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.teal,
    Colors.blue,
    Colors.purple
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xylophone',
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: notes
                .asMap()
                .map((index, color) {
                  return MapEntry(
                      index,
                      NoteButton(
                          player: player, count: index + 1, color: color));
                })
                .values
                .toList(),
          ),
        ),
      ),
    );
  }
}

class NoteButton extends StatelessWidget {
  final AudioCache player;
  final int count;
  final Color color;

  const NoteButton({this.player, this.count, this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FlatButton(
        color: color,
        onPressed: () {
          player.play('note$count.wav');
        },
        child: Text('Note $count'),
      ),
    );
  }
}
