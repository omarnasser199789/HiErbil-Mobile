import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hi_erbil_mobile/Theme/style.dart';
import 'package:hi_erbil_mobile/features/home/presentation/bloc/bloc.dart';

import '../globals.dart';
import '../widgets/waiting_widget.dart';
import '../../features/home/presentation/bloc/home_bloc.dart';
import '../../features/home/presentation/bloc/home_state.dart';
import '../../features/home/presentation/widgets/banner_widget.dart';
import '../widgets/app_bar_type3.dart';
import '../widgets/cached_net_work_image.dart';
import '../widgets/description_widget.dart';
import '../widgets/fav_widget.dart';
import '../widgets/share_widget.dart';
import '../widgets/taq_widget.dart';
import '../../features/wishlist/domain/usecase/add_to_wishlist_usecase.dart';
import '../../injection_container.dart';
import '../widgets/location_on_map_widget.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key,required this.title,required this.id}) : super(key: key);
  final String title;

  final int id;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;


    return BlocProvider(
        create: (BuildContext context) => sl<HomeBloc>(),
        child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
          if (kDebugMode) {
            print("State IS $state");
          }

          if (state is Empty) {
            BlocProvider.of<HomeBloc>(context).add(GetPlaceEvent(id: widget.id));
          }
          if (state is Loading) {
            return const WaitingWidget();
          }
          if(state is SuccessGetPlace){

            List<String> tagsList=[];
            for(var item in state.placeEntity.tagPlaces){
              tagsList.add(item.tag.title);
            }

            return Scaffold(
              appBar: appBarWidgetType3(widget.title,context,true,[],null),
              body: Padding(
                padding: const EdgeInsets.only(top:10),
                child: Container(
                  height:size.height,
                  decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: const BorderRadius.only(topLeft:Radius.circular(20),topRight: Radius.circular(20), )
                  ),
                  child:        SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:   [
                       

                        Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            SizedBox(
                              height: size.height*0.3,
                              width: double.infinity,
                              child: CarouselSlider(
                                items: state.placeEntity.attachments.map(
                                      (e) => Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 0,right: 0),
                                        child: GestureDetector(
                                          onTap: () async {
                                            // if (await canLaunch(e.linkUrl)) {
                                            //   await launch(e.linkUrl);
                                            // } else {
                                            //   showMessage(message: "حدث خطا اثناء تنفيذ العملية", context: context);
                                            // }
                                            // setState(() {
                                            //
                                            // });
                                          },
                                          child: SizedBox(
                                            height: size.height*0.3,
                                            child: CachedNetWorkImage(
                                              borderRadius: const BorderRadius.only(topRight: Radius.circular(20),topLeft:  Radius.circular(20)),
                                              boxFit: BoxFit.contain,
                                              url:  (e.path.isNotEmpty)? s3Amazonaws+e.path:null,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                                    .toList(),
                                options: CarouselOptions(
                                  autoPlay: true,
                                  height: size.height*0.3,
                                  enableInfiniteScroll: false,
                                  viewportFraction: 1,
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      selectedIndex = state.placeEntity.attachments[index].id;
                                    });
                                  },
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 20,
                              left: 0,
                              right: 0,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: state.placeEntity.attachments
                                    .map(
                                      (e) => AnimatedContainer(
                                    margin: const EdgeInsets.symmetric(horizontal: 2),
                                    duration: const Duration(milliseconds: 200),
                                    width: 8,
                                    height: 8,
                                    decoration: BoxDecoration(
                                        color: selectedIndex == e.id
                                            ? Theme.of(context).primaryColor
                                            : Theme.of(context)
                                            .primaryColor
                                            .withOpacity(0.5),
                                        borderRadius: BorderRadius.circular(10)),
                                  ),
                                )
                                    .toList(),
                              ),
                            ),
                          ],
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 17,right: 17,top: 12),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(state.placeEntity.title,style: poppinsSemiBoldTextStyle(fontSize: 20, context: context),),


                                  Row(
                                    children: [

                                      ShareWidget(bgColor:Theme.of(context).scaffoldBackgroundColor),
                                      const SizedBox(width: 30,),
                                      FavWidget(bgColor:Theme.of(context).scaffoldBackgroundColor,
                                        addProductToFavParams:
                                        AddProductToFavParams(
                                            apiId: state.placeEntity.id,
                                            title: state.placeEntity.title,
                                            image:  (state.placeEntity.attachments.isNotEmpty)? s3Amazonaws+ state.placeEntity.attachments[0].path:""
                                        ),),
                                    ],
                                  ),


                                ],
                              ),

                              Row(
                                children: [

                                  Icon(Icons.location_on_outlined,color: iconsColor,size: 20,),

                                  const SizedBox(width: 5,),
                                  Text(state.placeEntity.address,style: poppinsMediumTextStyle(fontSize: 12, context: context),),
                                ],
                              ),

                      TagWidget(tags: tagsList),



                              Row(
                                children: [
                                  DescriptionWidget(
                                    title: "Description",
                                    description: state.placeEntity.description,
                                  ),
                                ],
                              ),

                              LocationOnMapWidget(
                                target: LatLng(
                                    state.placeEntity.lat,
                                  state.placeEntity.long
                                ), title: state.placeEntity.title,

                              ),


                              const SizedBox(height: 30,),
                            ],
                          ),
                        )





                      ],
                    ),
                  ),
                ),
              ),
            );
          }

          return Container();
        }));





  }
}
