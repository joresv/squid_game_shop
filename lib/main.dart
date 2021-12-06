import 'package:flutter/material.dart';
import 'package:squid_game_shop/pages/on_boarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Squid Game Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'popping',
        primarySwatch: Colors.blue,
      ),
      home: const OnBoarding(),
    );
  }
}
