import 'package:emarket/utils/color_themes.dart';
import 'package:emarket/utils/utils.dart';
import 'package:flutter/material.dart';

class ProductShowcaseListView extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const ProductShowcaseListView(
      {super.key, required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    double height = screenSize.height / 4;
    double titleHeight = 25;
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(8),
      height: height,
      width: screenSize.width,
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            child: Row(
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 14),
                  child: Text(
                    "Show More",
                    style: TextStyle(color: activeCyanColor),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: height - (titleHeight + 26),
            width: screenSize.width,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: children,
            ),
          )
        ],
      ),
    );
  }
}
