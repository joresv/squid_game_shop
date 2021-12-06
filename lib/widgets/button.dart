// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:squid_game_shop/config.dart';

class SGButton extends StatelessWidget {
  const SGButton(
      {Key? key,
      this.onPressed,
      required this.title,
      this.elevation = 0,
      this.color,
      this.titleColor,
      this.fontSize,
      this.radius,
      this.h,
      this.v,
      this.icon})
      : super(key: key);
  final Function()? onPressed;
  final String title;
  final int elevation;
  final Color? color, titleColor;
  final double? radius;
  final double? fontSize;
  final double? h, v;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Config.colors.pink.withOpacity(.3),
          blurRadius: 10,
          offset: Offset(0, 5),
        ),
      ]),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: TextStyle(
                  color: titleColor ?? Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: fontSize ?? 18),
            ),
            //if icon is not null
            if (icon != null)
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Icon(
                  icon,
                  color: Config.colors.menuColor,
                ),
              )
          ],
        ),
        style: ElevatedButton.styleFrom(
            primary: color ??
                Config.colors
                    .pink, //if color is null Config.colors.pink is default color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? 10),
            ),
            padding:
                EdgeInsets.symmetric(vertical: v ?? 15, horizontal: h ?? 15)),
      ),
    );
  }
}
