
import 'package:flutter/material.dart';
import 'package:hi_erbil_mobile/Theme/style.dart';
import 'package:hi_erbil_mobile/core/widgets/app_bar_type3.dart';
import 'package:hi_erbil_mobile/core/widgets/cached_net_work_image.dart';
import 'package:hi_erbil_mobile/posts_style.dart';

import 'global_style.dart';



class CategoryPage extends StatelessWidget {
  CategoryPage({Key? key, required this.title,required this.from}) : super(key: key);
  final String title;
  bool selected = true;
  int from;

  List<String> tabsTitle=["Fine Dining","Pastry","Donut","Middle Eastern","Pastry","Donut"];

  List<Widget> tabs = [];
  List<Widget> tabBarViewList = [];

  @override
  Widget build(BuildContext context) {

    if(from==0){
      tabsTitle=[];
      tabsTitle=["Latest","Sports","Weather","Arts","Music","Tech"];
    }




    tabs = [];
    for (var item in tabsTitle) {
      tabs.add(
        Tab(
          height: 80,
          child: Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                SizedBox(
                  width: 50,
                  height: 50,
                  child: CachedNetWorkImage(
                    borderRadius: BorderRadius.circular(10),
                    boxFit: BoxFit.fill,
                    url: null,
                  ),
                ),
                Text(item, maxLines: 1),
              ],
            ),
          ),
        ),
      );

      if(from==0){
        tabBarViewList.add( PostsStyle());
      }else{
        tabBarViewList.add(const GlobalStyle());
      }


    }

      Size size = MediaQuery.of(context).size;


      return Scaffold(
        appBar: appBarWidgetType3(title, context,(from==0)? false:true, [], null),
        body: Padding(
          padding: const EdgeInsets.only(top:10),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            child: DefaultTabController(
                length: tabs.length,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: TabBar(
                        isScrollable: true,
                        labelColor: Theme.of(context).canvasColor,
                        unselectedLabelColor: iconsColor,
                        indicatorSize: TabBarIndicatorSize.tab,
                        labelStyle:
                            poppinsRegularTextStyle(fontSize: 12, context: context),
                        tabs: tabs,
                      ),
                    ),
                    SizedBox(
                      height: size.height - 188,
                      child: TabBarView(
                        children: tabBarViewList,
                      ),
                    ),
                  ],
                )),
          ),
        ),
      );
  }

}






