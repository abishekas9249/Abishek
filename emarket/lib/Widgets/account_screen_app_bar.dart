import 'package:emarket/utils/color_themes.dart';
import 'package:emarket/utils/constants.dart';
import 'package:emarket/utils/utils.dart';
import 'package:flutter/material.dart';

class AccountScreenAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;
  const AccountScreenAppBar({super.key})
      : preferredSize = const Size.fromHeight(kAppBarHeight);

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return Container(
      height: kAppBarHeight,
      width: screenSize.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: backgroundGradient,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Image.network(
              amazonLogoUrl,
              height: kAppBarHeight * 0.7,
            ),
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications_outlined,
                    color: Colors.black,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search_outlined,
                    color: Colors.black,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
