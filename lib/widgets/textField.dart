// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:squid_game_shop/config.dart';

class SGTextfield extends StatelessWidget {
  SGTextfield({Key? key, this.suffix, this.hintText}) : super(key: key);
  final IconData? suffix;
  final String? hintText;

  final defaultBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(60), borderSide: BorderSide.none);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(top: 5, left: 10),
        constraints: BoxConstraints(maxHeight: 45),
        filled: true,
        fillColor: Config.colors.greyColor,
        hintText: hintText,
        hintStyle: TextStyle(color: Config.colors.greyColor2),
        border: defaultBorder,
        suffixIcon: Icon(
          suffix,
          color: Config.colors.greyColor2,
        ),
      ),
    );
  }
}
