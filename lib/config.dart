// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:squid_game_shop/widgets/textField.dart';

class Config {
  static final assets = _Asset();
  static final colors = _Color();

  static void navigate(context, page, {bool animate = false}) {
    if (!animate) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => page,
        ),
      );
    } else {
      Navigator.of(context).push(
        PageRouteBuilder(
          pageBuilder: (c, a1, a2) => page,
          transitionsBuilder: (c, anim, a2, child) => ScaleTransition(
            scale: anim,
            child: child,
            alignment: Alignment.bottomLeft,
          ),
          transitionDuration: Duration(milliseconds: 200),
          reverseTransitionDuration: Duration(milliseconds: 200),
        ),
      );
    }
  }

  static appBar(double width) => PreferredSize(
        child: SafeArea(
            child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10)
              .copyWith(right: 10),
          child: Row(
            children: [
              Image.asset(Config.assets.lg),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: SGTextfield(
                suffix: FeatherIcons.search,
                hintText: 'search',
              )),
              SizedBox(
                width: 5,
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.menu,
                    size: 30,
                    color: Config.colors.menuColor,
                  ))
            ],
          ),
        )),
        preferredSize: Size(width, 100),
      );
}

class _Asset {
  final bg = "assets/images/Background.png";
  final lg = "assets/images/logo.png";
  final lgw = "assets/images/logo_white.png";
  final u1 = "assets/images/u1.png";
  final master = "assets/images/u2.png";
  final u2 = "assets/images/u3.png";
  final doll = "assets/images/u4.png";
  final bgSG = "assets/images/bg_sg.png";
  final search = "assets/images/search.png";
}

class _Color {
  final pink = Color(0xFFE84381);
  final pinkAccent = Color(0xFFFFCEE0);
  final greyColor = Color.fromRGBO(217, 217, 232, 0.33);
  // final c = Color(0xFFC4C4C4)
  final greyColor2 = Color(0xFF8B8BA1);
  final menuColor = Color(0xFF222020);
  final starColor = Color(0xFFF59C4C);
}
