import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hi_erbil_mobile/Theme/style.dart';
import 'package:hi_erbil_mobile/features/home/presentation/bloc/bloc.dart';
import '../../../../core/globals.dart';
import '../../../../core/widgets/dynamic_height_image_carousel.dart';
import '../../../../core/widgets/waiting_widget.dart';
import '../../../../core/widgets/app_bar_type3.dart';
import '../../../../core/widgets/cached_net_work_image.dart';
import '../../../../core/widgets/description_widget.dart';
import '../../../../core/widgets/fav_widget.dart';
import '../../../../core/widgets/share_widget.dart';
import '../../../../core/widgets/taq_widget.dart';
import '../../../wishlist/domain/usecase/add_to_wishlist_usecase.dart';
import '../../../../injection_container.dart';
import '../../../../core/widgets/location_on_map_widget.dart';

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
          if (kDebugMode) { print("State IS $state"); }
          if (state is Empty) { BlocProvider.of<HomeBloc>(context).add(GetProductsByIdEvent( id: widget.id)); }
          else if (state is Loading) { return const WaitingWidget(); }
          else if(state is SuccessGetProductsByIdEntity){
            List<String> tagsList=[];
            // for(var item in state.productEntity.tagPlaces){ tagsList.add(item.tag.title); }
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
                  child:SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:   [
                        DynamicHeightImageCarousel(attachments: state.productEntity.attachments, size: size,),
                        Padding(
                          padding: const EdgeInsets.only(left: 17,right: 17,top: 12),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: size.width-141,
                                      child: Text(state.productEntity.titleEn,style: poppinsSemiBoldTextStyle(fontSize: 20, context: context),)),
                                  Row(
                                    children: [
                                      ShareWidget(bgColor:Theme.of(context).scaffoldBackgroundColor),
                                      const SizedBox(width: 30,),
                                      FavWidget(bgColor:Theme.of(context).scaffoldBackgroundColor,
                                        addProductToFavParams:
                                        AddProductToFavParams(
                                            apiId: state.productEntity.id,
                                            title: state.productEntity.titleEn,
                                            image:  (state.productEntity.attachments.isNotEmpty)? s3Amazonaws+ state.productEntity.attachments[0].path:""
                                        ),),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.location_on_outlined,color: iconsColor,size: 20,),
                                  const SizedBox(width: 5,),
                                  // Text(state.productEntity.address,style: poppinsMediumTextStyle(fontSize: 12, context: context),),
                                ],
                              ),
                              TagWidget(tags: tagsList),
                              Row(
                                children: [
                                  DescriptionWidget(
                                    title: "Description",
                                    description: state.productEntity.descriptionEn,
                                  ),
                                ],
                              ),
                              // LocationOnMapWidget(
                              //   target: LatLng(state.productEntity.lat, state.placeEntity.long),
                              //   title: state.placeEntity.title,
                              //  ),
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
