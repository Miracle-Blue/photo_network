import 'package:flutter/material.dart';
import 'package:photo_network/pages/home_page.dart';
import 'package:photo_network/pages/photo_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: const HomePage(),
      routes: {
        HomePage.id: (context) => const HomePage(),
      },
    );
  }
}