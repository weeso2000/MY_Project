import 'package:flutter/material.dart';
import 'package:untitled/Pages/choose_location.dart';
import 'package:untitled/Pages/home.dart';
import 'package:untitled/Pages/loading.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => const loading(),
      '/location': (context) => const chooselocation(),
      '/home': (context) => Home(),

    },
  ));
}


