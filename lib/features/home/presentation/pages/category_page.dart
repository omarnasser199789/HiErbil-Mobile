
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hi_erbil_mobile/Theme/style.dart';
import 'package:hi_erbil_mobile/core/globals.dart';
import 'package:hi_erbil_mobile/core/widgets/app_bar_type3.dart';
import 'package:hi_erbil_mobile/features/home/presentation/bloc/bloc.dart';

import '../../../../core/widgets/cached_net_work_image.dart';
import '../../../../core/widgets/waiting_widget.dart';
import '../widgets/global_style.dart';
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
            BlocProvider.of<HomeBloc>(context).add(GetSubCategoryEvent(id: widget.id));/// => SuccessGetBlogCategories
          }
          if(state is Loading){
            return const WaitingWidget();
          }

          if(state is SuccessGetSubCategoryEntity){
            tabs = [];
            for (var item in state.list) {
              tabs.add(
                Tab(
                  height: 80,
                  child: Align(
                    alignment: Alignment.center,
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              width: 60,
                              height: 60,
                              child: CachedNetWorkImage(
                                borderRadius: BorderRadius.circular(10),
                                boxFit: BoxFit.fill,
                                url:(item.iconUrl.isNotEmpty)? s3Amazonaws + item.iconUrl:null,
                              ),
                            ),
                            Text(item.title, maxLines: 1),
                          ],
                        ),
                        if(!kReleaseMode)
                          Text("${item.id}")
                      ],
                    ),
                  ),
                ),
              );

              tabBarViewList.add(GlobalStyle(subCatId:item.id));

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
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10, bottom: 10),
                              child: TabBar(
                                isScrollable: true,
                                labelColor: Theme.of(context).canvasColor,
                                unselectedLabelColor: iconsColor,
                                indicatorSize: TabBarIndicatorSize.tab,
                                labelStyle: poppinsRegularTextStyle(fontSize: 12, context: context),
                                indicatorColor: Theme.of(context).primaryColor,
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
                        ),
                      )),
                ),
              ),
            );
          }


          return Container();






        }));




  }
}






