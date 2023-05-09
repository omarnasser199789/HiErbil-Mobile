
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hi_erbil_mobile/Theme/style.dart';
import 'package:hi_erbil_mobile/core/globals.dart';
import 'package:hi_erbil_mobile/core/widgets/app_bar_type3.dart';
import 'package:hi_erbil_mobile/features/home/presentation/bloc/bloc.dart';

import '../../../../core/widgets/cached_net_work_image.dart';
import '../../../../core/widgets/waiting_widget.dart';
import '../../../../global_style.dart';
import '../../../../injection_container.dart';
import 'mpa_page.dart';




class MapsPage extends StatefulWidget {
  MapsPage({Key? key}) : super(key: key);



  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  bool selected = true;

  List<Widget> tabs = [];

  List<Widget> tabBarViewList = [];
  Set<Marker> markers = Set<Marker>();

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
            BlocProvider.of<HomeBloc>(context).add(GetTagsEvent(catId: null));/// => SuccessGetBlogCategories
          }
          if(state is Loading){
            return const WaitingWidget();
          }


          if(state is SuccessGetTags){
            tabs = [];
            for (var item in state.tagsEntity.data) {
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
                            url:(item.attachments.isNotEmpty)? s3Amazonaws + item.attachments[0].path:null,
                          ),
                        ),
                        Text(item.title, maxLines: 1),
                      ],
                    ),
                  ),
                ),
              );
              markers = Set<Marker>();

              for(var i in item.tagPlaces){
                markers.add(Marker(
                  markerId:  MarkerId("${i.place.id}"),
                  infoWindow:  InfoWindow(
                    title:i.place.title,
                  ),
                  position: LatLng(i.place.long,i.place.lat),
                  // icon: BitmapDescriptor.fromBytes(markIcons),
                ));
              }


              tabBarViewList.add( MapPage(markers: markers,));





            }

            return Scaffold(
              appBar: appBarWidgetType3("Map", context, false, [], null),
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
                            height: size.height - 208,
                            child: TabBarView(
                              physics:NeverScrollableScrollPhysics(),
                              children: tabBarViewList,
                            ),
                          ),
                        ],
                      )),
                ),
              ),
            );
          }


          return Container();






        }));




  }
}






