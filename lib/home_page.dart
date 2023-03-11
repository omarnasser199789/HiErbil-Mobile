import 'package:flutter/material.dart';
import 'package:hi_erbil_mobile/places_to_go_widget.dart';
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
            const HeaderWidget(),

             Padding(
               padding: const EdgeInsets.only(top:26),
               child: BannerWidget(padding: const EdgeInsets.only(left: 17,right: 17),height: 210,borderRadius: BorderRadius.circular(10),),
             ),

            CategoriesWidget(),

            SightsWidget(),

            const HistoryWidget(),

            const PlacesToGoWidget(),

            const SizedBox(height: 100,),


          ],
        ),
      ),
    );
  }
}
