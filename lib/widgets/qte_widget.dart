// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:squid_game_shop/config.dart';

class QteWidget extends StatefulWidget {
  const QteWidget({Key? key, this.onChanged, this.initalValue = 1})
      : super(key: key);
  final Function(int value)? onChanged;
  final int initalValue;
  @override
  _QteWidgetState createState() => _QteWidgetState();
}

class _QteWidgetState extends State<QteWidget> {
  int index = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    index = widget.initalValue;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(40),
          onTap: () {
            if (index > 0) index--;
            setState(() {});
          },
          child: Container(
            height: 40,
            width: 40,
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Config.colors.pinkAccent,
              shape: BoxShape.circle,
            ),
            child: Icon(
              MdiIcons.minus,
              color: Config.colors.pink,
            ),
            alignment: Alignment.center,
          ),
        ),
        SizedBox(
          width: 50,
          child: Text(
            index.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Config.colors.menuColor,
            ),
          ),
        ),
        InkWell(
          borderRadius: BorderRadius.circular(40),
          onTap: () {
            index++;
            setState(() {});
          },
          child: Container(
            height: 40,
            width: 40,
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Config.colors.pink,
              shape: BoxShape.circle,
            ),
            child: Icon(
              MdiIcons.plus,
              color: Colors.white,
            ),
            alignment: Alignment.center,
          ),
        ),
      ],
    );
  }
}
