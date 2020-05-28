import 'package:audioplayers/audio_cache.dart';
import "package:flutter/material.dart";
import 'package:just_audio/just_audio.dart';
import '../QuizPages/quizepage.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: (){onPressed();},
          child: Text("Start Quiz Now"),
        )
      ),
    );
  }

  void onPressed() async{
    final player = AudioCache();
    player.play("2minutesJepeorady.mp4");
    Navigator.push(context, MaterialPageRoute(builder: (context) => QuizPage()));
  }
}
