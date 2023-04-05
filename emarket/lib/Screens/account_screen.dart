import 'package:emarket/Widgets/account_screen_app_bar.dart';
import 'package:emarket/Widgets/custom_main_button.dart';
import 'package:emarket/Widgets/product_showcase_list_view.dart';
import 'package:emarket/utils/constants.dart';
import 'package:emarket/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../utils/color_themes.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return Scaffold(
      appBar: AccountScreenAppBar(),
      body: SingleChildScrollView(
        child: SizedBox(
          height: screenSize.height,
          width: screenSize.width,
          child: Column(
            children: [
              IntroductionWidgetAccountScreen(),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: CustomMainButton(
                    child: Text("Sign Out"),
                    color: Colors.orange,
                    isLoading: false,
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                    }),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: CustomMainButton(
                    child: Text("Sell"),
                    color: yellowColor,
                    isLoading: false,
                    onPressed: () {}),
              ),
              ProductShowcaseListView(
                  title: "Your Orders", children: productChildren),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Order Requests",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            "Order: Black Shoe",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          subtitle: Text("Address : Somewhere on Earth"),
                          trailing: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.check),
                          ),
                        );
                      }))
            ],
          ),
        ),
      ),
    );
  }
}

class IntroductionWidgetAccountScreen extends StatelessWidget {
  const IntroductionWidgetAccountScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kAppBarHeight / 2,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: backgroundGradient,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Container(
        height: kAppBarHeight / 2,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.white.withOpacity(0.0000001)],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Hello, ",
                      style: TextStyle(color: Colors.grey[800], fontSize: 27),
                    ),
                    TextSpan(
                      text: "Aadhi",
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 27,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://m.media-amazon.com/images/I/116KbsvwCRL._SX90_SY90_.png'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
