// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:squid_game_shop/config.dart';

class Shop extends StatelessWidget {
  const Shop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Shop page",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
