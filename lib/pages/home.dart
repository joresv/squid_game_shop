// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:squid_game_shop/config.dart';
import 'package:squid_game_shop/models/actor.dart';
import 'package:squid_game_shop/models/order.dart';
import 'package:squid_game_shop/pages/detail_actor.dart';
import 'package:squid_game_shop/widgets/actor_component.dart';
import 'package:squid_game_shop/widgets/order_component.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final actors = [
      Actor(
          asset: Config.assets.u1,
          title: "Supervisor toy",
          price: 75.7,
          rating: 4),
      Actor(
          asset: Config.assets.master,
          title: "Front man toy",
          price: 60,
          rating: 3),
    ];
    final orders = [
      Order(asset: Config.assets.u2, title: "Collector outfit", qte: 5),
      Order(asset: Config.assets.doll, title: "Doll", qte: 2),
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20).copyWith(top: 10),
              child: Text(
                'Recommended for you',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 330,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, i) {
                  final actor = actors[i];
                  return Container(
                    margin: EdgeInsets.only(
                        left: i == 0 ? 20 : 0,
                        right: i == actors.length - 1 ? 20 : 8),
                    child: ActorComponent(
                      actor: actor,
                      onPressed: () {
                        Config.navigate(
                            context,
                            DetailActor(
                              actor: actor,
                            ));
                      },
                    ),
                  );
                },
                itemCount: actors.length,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20).copyWith(top: 10),
              child: Text(
                'Recent orders',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: 135,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(vertical: 10),
                itemBuilder: (context, i) {
                  final order = orders[i];
                  return Container(
                    margin: EdgeInsets.only(
                        left: i == 0 ? 20 : 0,
                        right: i == orders.length - 1 ? 20 : 15),
                    child: OrderComponent(
                      order: order,
                    ),
                  );
                },
                itemCount: actors.length,
              ),
            ),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
