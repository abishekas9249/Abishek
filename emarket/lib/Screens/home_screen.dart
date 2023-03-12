import 'package:emarket/Widgets/banner_ad.dart';
import 'package:emarket/Widgets/categories_horizontal_list_view.dart';
import 'package:emarket/Widgets/search_bar_widget.dart';
import 'package:emarket/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBarWidget(
        isReadOnly: true,
        hasBackButton: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [CategoriesHorizontalListView(), BannerAdWidget()],
        ),
      ),
    );
  }
}
