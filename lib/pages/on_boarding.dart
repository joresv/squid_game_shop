// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:squid_game_shop/config.dart';
import 'package:squid_game_shop/pages/home_page.dart';
import 'package:squid_game_shop/widgets/button.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              Config.assets.bg,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: SafeArea(
                  child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Image.asset(Config.assets.lgw),
                  )
                ],
              )),
              flex: 4,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(color: Colors.white.withOpacity(.2))
                          ]),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                          child: Container(),
                        ),
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            Config.assets.bgSG,
                            height: 100,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Shop your favourite toys and outfits\nof the Squid Game on the go!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SGButton(
                            title: 'Shop Now',
                            onPressed: () {
                              Config.navigate(context, HomePage(),
                                  animate: true);
                            },
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              flex: 3,
            )
          ],
        ),
      ),
    );
  }
}
