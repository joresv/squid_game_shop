// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:squid_game_shop/config.dart';
import 'package:squid_game_shop/models/order.dart';

class OrderComponent extends StatelessWidget {
  const OrderComponent({Key? key, required this.order, this.onPressed})
      : super(key: key);
  final Order order;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: Container(
            height: 85,
            width: 150,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(.2),
                      blurRadius: 10,
                      offset: Offset(-.5, 2))
                ]),
          ),
          bottom: 0,
          left: 0,
          right: 0,
        ),
        Container(
          padding: EdgeInsets.all(5).copyWith(bottom: 0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Image.asset(
                order.asset!,
                height: 115,
                width: 80,
                fit: BoxFit.fitHeight,
              ),
              Padding(
                padding: EdgeInsets.all(5).copyWith(bottom: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      order.title!,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Config.colors.menuColor,
                      ),
                    ),
                    Text(
                      "${order.qte} items ordered",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Config.colors.menuColor,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          "View details",
                          style: TextStyle(color: Config.colors.greyColor2),
                        ),
                        Icon(FeatherIcons.arrowRight,
                            size: 20, color: Config.colors.greyColor2)
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
