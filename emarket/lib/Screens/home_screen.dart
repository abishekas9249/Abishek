import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emarket/Models/user_details_model.dart';
import 'package:emarket/Widgets/banner_ad.dart';
import 'package:emarket/Widgets/categories_horizontal_list_view.dart';
import 'package:emarket/Widgets/product_showcase_list_view.dart';
import 'package:emarket/Widgets/search_bar_widget.dart';
import 'package:emarket/Widgets/simple_product_widget.dart';
import 'package:emarket/Widgets/user_details_bar.dart';
import 'package:emarket/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController controller = ScrollController();
  double offset = 0;
  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        offset = controller.position.pixels;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBarWidget(
        isReadOnly: true,
        hasBackButton: false,
      ),
      body: Stack(children: [
        SingleChildScrollView(
          controller: controller,
          child: Column(
            children: [
              SizedBox(
                height: kAppBarHeight / 2,
              ),
              CategoriesHorizontalListView(),
              BannerAdWidget(),
              ProductShowcaseListView(
                  title: "Upto 70% Off", children: productChildren),
              ProductShowcaseListView(
                  title: "Upto 60% Off", children: productChildren),
              ProductShowcaseListView(
                  title: "Upto 50% Off", children: productChildren),
              ProductShowcaseListView(title: "More", children: productChildren)
            ],
          ),
        ),
        UserDetailsBar(
            offset: offset,
            userDetails: UserDetailsModel(
                name: "Abishek A S",
                address:
                    'somewhere on earth please find me as soon as possible '))
      ]),
    );
  }
}
