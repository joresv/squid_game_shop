// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:squid_game_shop/config.dart';

class SGBottomNavigationBar extends StatefulWidget {
  const SGBottomNavigationBar({Key? key, required this.items, this.onSelected})
      : super(key: key);
  final List<SGBottomNavigationBarItem> items;
  final Function(int value)? onSelected;

  @override
  _SGBottomNavigationBarState createState() => _SGBottomNavigationBarState();
}

class _SGBottomNavigationBarState extends State<SGBottomNavigationBar> {
  late List<bool> visibles;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    visibles = List.generate(widget.items.length, (index) => false);
    visibles.first = true;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: widget.items.map((e) {
        int index = widget.items.indexOf(e);
        return Expanded(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {
                visibles = List.generate(widget.items.length, (index) => false);
                visibles[index] = true;
                setState(() {});
                if (widget.onSelected != null) widget.onSelected!(index);
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: !visibles[index]
                    ? null
                    : BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            colors: [
                              Config.colors.pinkAccent,
                              Config.colors.pink
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter),
                      ),
                child: e.copyWith(activate: visibles[index]),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 12,
              width: 22,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(50),
                  ),
                  color: visibles[index]
                      ? Config.colors.pink
                      : Colors.transparent),
            )
          ],
        ));
      }).toList(),
    );
  }
}

class SGBottomNavigationBarItem extends StatelessWidget {
  const SGBottomNavigationBarItem({Key? key, required this.icon})
      : super(key: key);
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(shape: BoxShape.circle),
      child: Icon(
        icon,
        size: 30,
        color: Config.colors.greyColor2,
      ),
    );
  }

  Widget copyWith({bool activate = false}) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        size: 30,
        color: activate ? Colors.white : Config.colors.greyColor2,
      ),
    );
  }
}
