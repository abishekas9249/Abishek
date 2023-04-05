import 'package:emarket/Widgets/custom_simple_rounded_button.dart';
import 'package:emarket/Widgets/custom_square_button.dart';
import 'package:emarket/Widgets/product_information_widget.dart';
import 'package:emarket/utils/color_themes.dart';
import 'package:emarket/utils/utils.dart';
import 'package:flutter/material.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return Container(
      padding: EdgeInsets.all(25),
      height: screenSize.height / 2,
      width: screenSize.width,
      decoration: BoxDecoration(
          color: backgroundColor,
          border: Border(
            bottom: BorderSide(color: Colors.grey, width: 1),
          )),
      child: Column(children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: screenSize.width / 3,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Image.network(
                      'https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png'),
                ),
              ),
              ProductInformationWidget(
                  cost: 500.35,
                  productName:
                      "The Soap is a Costly Product so buy it as soon as possible",
                  sellerName: "DreamKiller")
            ],
          ),
          flex: 3,
        ),
        Expanded(
          child: Row(
            children: [
              CustomSquareButton(
                  child: Icon(Icons.remove),
                  color: backgroundColor,
                  dimension: 40,
                  onPressed: () {}),
              CustomSquareButton(
                  child: Text(
                    "0",
                    style: TextStyle(color: activeCyanColor),
                  ),
                  color: Colors.white,
                  dimension: 40,
                  onPressed: () {}),
              CustomSquareButton(
                  child: Icon(Icons.add),
                  color: backgroundColor,
                  dimension: 40,
                  onPressed: () {})
            ],
          ),
          flex: 1,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    CustomSimpleRoundedButton(onPressed: () {}, text: "Delete"),
                    SizedBox(
                      width: 7,
                    ),
                    CustomSimpleRoundedButton(
                        onPressed: () {}, text: "Save for later"),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "See more Details",
                      style: TextStyle(color: activeCyanColor),
                    ),
                  ),
                )
              ],
            ),
          ),
          flex: 1,
        )
      ]),
    );
  }
}
