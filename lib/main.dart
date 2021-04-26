import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'xylophone',
      home: Scaffold(
        backgroundColor: Colors.black,
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  void sound(int s) {
    AssetsAudioPlayer.newPlayer().open(
      Audio("assets/audios/note$s.wav"),
      showNotification: true,
    );
  }

  Expanded ui(Color color, int n, String alpha) {
    return Expanded(
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: color,
        onPressed: () {
          sound(n);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
            ),
            Text(
              '$alpha',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ui(Colors.red, 1, 'A'),
          ui(Colors.orange, 2, 'B'),
          ui(Colors.yellow, 3, 'C'),
          ui(Colors.green, 4, 'D'),
          ui(Colors.blue, 5, 'E'),
          ui(Colors.indigo, 6, 'F'),
          ui(Colors.purple, 7, 'G'),
        ],
      ),
    );
  }
}
