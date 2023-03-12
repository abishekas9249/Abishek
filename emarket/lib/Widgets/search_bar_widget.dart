import 'package:emarket/Screens/search_screen.dart';
import 'package:emarket/utils/color_themes.dart';
import 'package:emarket/utils/constants.dart';
import 'package:emarket/utils/utils.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget with PreferredSizeWidget {
  final bool isReadOnly;
  final bool hasBackButton;
  SearchBarWidget(
      {super.key, required this.hasBackButton, required this.isReadOnly})
      : preferredSize = const Size.fromHeight(kAppBarHeight);

  @override
  final Size preferredSize;

  OutlineInputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(7),
      borderSide: BorderSide(color: Colors.grey, width: 1));

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return SafeArea(
      child: Container(
        height: kAppBarHeight,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: backgroundGradient,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            hasBackButton
                ? IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_outlined))
                : Container(),
            SizedBox(
              width: screenSize.width * 0.7,
              child: Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 8,
                      spreadRadius: 2,
                      offset: Offset(0, 5))
                ]),
                child: TextField(
                  readOnly: isReadOnly,
                  onTap: () {
                    if (isReadOnly) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchScreen()));
                    }
                  },
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: border,
                      focusedBorder: border,
                      hintText: "Search for Something in Amazon"),
                ),
              ),
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.mic_none_outlined))
          ],
        ),
      ),
    );
  }
}
