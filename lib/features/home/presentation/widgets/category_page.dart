
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hi_erbil_mobile/Theme/style.dart';
import 'package:hi_erbil_mobile/core/widgets/app_bar_type3.dart';

import '../../../../core/widgets/cached_net_work_image.dart';
import '../../../../global_style.dart';
import '../../../../injection_container.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_state.dart';



class CategoryPage extends StatefulWidget {
  CategoryPage({Key? key, required this.title,required this.id}) : super(key: key);
  final String title;
  final int id;


  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  bool selected = true;

  List<Widget> tabs = [];

  List<Widget> tabBarViewList = [];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocProvider(
        create: (BuildContext context) => sl<HomeBloc>(),
        child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
          if (kDebugMode) {
            print("Categories State IS $state");
          }

          if (state is Empty) {
            // BlocProvider.of<PostsBloc>(context).add(GetBlogCategoriesEvent());/// => SuccessGetBlogCategories
          }

          tabs = [];
          for (var item in ["","",""]) {
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
                          url:null,
                        ),
                      ),
                      Text("item.title", maxLines: 1),
                    ],
                  ),
                ),
              ),
            );



            tabBarViewList.add( GlobalStyle());





          }

          return Scaffold(
            appBar: appBarWidgetType3(widget.title, context,true, [], null),
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



        }));




  }
}






