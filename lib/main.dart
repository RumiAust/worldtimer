import 'package:flutter/material.dart';
import 'package:worldtimer/pages/home.dart';
import 'package:worldtimer/pages/choose_location.dart';
import 'package:worldtimer/pages/loading.dart';
void main() {
  runApp( MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const Loading(),
        '/home': (context) => const Home(),
        '/location': (context) => const ChooseLocation(),
      }
  ));
}
