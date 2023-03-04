import 'package:flutter/material.dart';
import 'package:hi_erbil_mobile/sights_widget.dart';

import 'banner_widget.dart';
import 'categories_widget.dart';
import 'header_widget.dart';
import 'history_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children:  [
            HeaderWidget(),

            BannerWidget(),

            CategoriesWidget(),

            SightsWidget(),
            HistoryWidget(),

            // PlacesToGoWidget(),


          ],
        ),
      ),
    );
  }
}
