import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:quiz_polyglottal/SetupPages/welcome.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AudioServiceWidget(
        child: Scaffold(
          backgroundColor: Colors.grey.shade900,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Welcome(),
            ),
          ),
        ),
      ),
    );
  }
}
