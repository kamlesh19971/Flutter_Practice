import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/home_widgets/add_to_cart.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/catalog.dart';

class HomeDetailPage extends StatelessWidget {

  final Item catalog;
  const HomeDetailPage({ Key? key, required this.catalog }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl4.rose800.make(),
           AddToCart(catalog: catalog).wh(120, 50)
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image)
            ).h32(context),
            Expanded(
              child: VxArc(
                height: 30.0,
                edge: VxEdge.TOP,
                arcType: VxArcType.CONVEY,
                child: Container(
                  color: context.cardColor,
                  width: context.screenWidth ,
                  child: Column(
                    children: [
                      catalog.name.text.xl4.color(context.accentColor).bold.make(),
                      catalog.desc.text.xl.make(),
                      10.heightBox,
                      "Ut et sea sea est stet dolores magna, sea ipsum amet ea rebum accusam eirmod. Diam takimata ipsum aliquyam sea gubergren. At invidunt tempor dolore lorem amet, amet consetetur voluptua."
                      .text.make().p16()
                    ],
                  ).py64(),
                ),
              )
            )
          ]
        ),
      ),
    );
  }
}