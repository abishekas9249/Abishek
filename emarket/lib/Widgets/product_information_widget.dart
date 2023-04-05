import 'package:emarket/Widgets/cost_widget.dart';
import 'package:emarket/utils/color_themes.dart';
import 'package:emarket/utils/utils.dart';
import 'package:flutter/material.dart';

class ProductInformationWidget extends StatelessWidget {
  final String productName;
  final double cost;
  final String sellerName;
  const ProductInformationWidget(
      {super.key,
      required this.cost,
      required this.productName,
      required this.sellerName});
  @override
  Widget build(BuildContext context) {
    SizedBox spacething = SizedBox(height: 7);
    Size screenSize = Utils().getScreenSize();
    return SizedBox(
      width: screenSize.width / 2,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            productName,
            maxLines: 2,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15,
                letterSpacing: 0.8,
                overflow: TextOverflow.ellipsis),
          ),
          spacething,
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 7),
            child: Align(
              alignment: Alignment.centerLeft,
              child: CostWidget(color: Colors.black, cost: cost),
            ),
          ),
          spacething,
          Align(
            alignment: Alignment.centerLeft,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Sold By ",
                    style: TextStyle(color: Colors.grey[700], fontSize: 14),
                  ),
                  TextSpan(
                    text: sellerName,
                    style: TextStyle(color: activeCyanColor, fontSize: 14),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
