// ignore_for_file: prefer_const_constructors, unused_import, depend_on_referenced_packages

import 'dart:convert';
import 'package:collection/collection.dart';

import 'package:flutter/material.dart';
import 'package:music_app/helper/HorizontalScroll.dart';
import 'package:music_app/model/data.dart';
import 'package:music_app/screen/homepage.dart';
import 'package:music_app/screen/test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: MyCustomeScrollBehavior(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
      routes: {
        'homepage': (context) => Home(),
        'testpage': (context) => Telur(),
      },
      initialRoute: 'homepage',
    );
  }
}
