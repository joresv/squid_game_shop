// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:squid_game_shop/config.dart';
import 'package:squid_game_shop/models/actor.dart';
import 'package:squid_game_shop/widgets/button.dart';
import 'package:squid_game_shop/widgets/qte_widget.dart';

class DetailActor extends StatelessWidget {
  const DetailActor({Key? key, required this.actor}) : super(key: key);
  final Actor actor;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Config.colors.pinkAccent,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(30),
                          ),
                        ),
                        child: SafeArea(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            IconButton(
                                onPressed: Navigator.of(context).pop,
                                icon: Icon(FeatherIcons.arrowLeft))
                          ],
                        )),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(30),
                          ),
                        ),
                        child: SafeArea(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Hero(
                                tag: "${actor.asset}&${actor.title}",
                                child: Material(
                                  color: Colors.transparent,
                                  child: StatefulBuilder(
                                    builder: (context, setState) {
                                      return IconButton(
                                        onPressed: () {
                                          actor.fav = !actor.fav;
                                          setState(() {});
                                        },
                                        icon: Icon(
                                          actor.fav
                                              ? MdiIcons.heart
                                              : FeatherIcons.heart,
                                          color: actor.fav
                                              ? Config.colors.pink
                                              : Config.colors.menuColor,
                                        ),
                                      );
                                    },
                                  ),
                                )),
                          ],
                        )),
                      ),
                    )
                  ],
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Hero(
                    tag: actor.asset!,
                    child: Material(
                      color: Colors.transparent,
                      child: Image.asset(
                        actor.asset!,
                        height: 370,
                        width: 200,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                )
              ],
            ),
            flex: 3,
          ),
          Expanded(
              flex: 2,
              child: Container(
                width: width,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              actor.title!,
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Config.colors.menuColor,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "\$" + actor.price!.toString(),
                              style: TextStyle(
                                fontSize: 27,
                                fontWeight: FontWeight.bold,
                                color: Config.colors.greyColor2,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            QteWidget(
                              onChanged: (value) => print(value),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                RatingBar.builder(
                                  initialRating: actor.rating!.toDouble(),
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  // itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                  itemSize: 20,
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 15,
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  actor.rating.toString(),
                                  style: TextStyle(
                                      color: Config.colors.greyColor2,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    )),
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: SGButton(
                            title: 'Add to cart',
                            onPressed: () {},
                            color: Config.colors.pinkAccent,
                            titleColor: Config.colors.menuColor,
                            icon: Icons.shopping_cart_outlined,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          flex: 2,
                          child: SGButton(
                            title: 'Buy now',
                            onPressed: () {},
                            color: Config.colors.pink,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
