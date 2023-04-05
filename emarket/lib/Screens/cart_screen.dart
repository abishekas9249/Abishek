import 'package:emarket/Models/user_details_model.dart';
import 'package:emarket/Widgets/cart_item_widget.dart';
import 'package:emarket/Widgets/custom_main_button.dart';
import 'package:emarket/Widgets/search_bar_widget.dart';
import 'package:emarket/Widgets/user_details_bar.dart';
import 'package:emarket/utils/color_themes.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBarWidget(hasBackButton: false, isReadOnly: true),
      body: Center(
        child: Column(
          children: [
            UserDetailsBar(
              offset: 0,
              userDetails: UserDetailsModel(
                  name: "Aadhi", address: "Somewhere on Earth"),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: CustomMainButton(
                child: Text(
                  "Proceed to by (n) times",
                  style: TextStyle(color: Colors.black),
                ),
                color: yellowColor,
                isLoading: false,
                onPressed: () {},
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: ((context, index) {
                    return CartItemWidget();
                  })),
            )
          ],
        ),
      ),
    );
  }
}
