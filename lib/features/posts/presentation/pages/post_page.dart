import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hi_erbil_mobile/Theme/style.dart';
import 'package:hi_erbil_mobile/features/posts/presentation/bloc/bloc.dart';

import '../../../../core/globals.dart';
import '../../../../core/widgets/app_bar_type3.dart';
import '../../../../core/widgets/cached_net_work_image.dart';
import '../../../../core/widgets/description_widget.dart';
import '../../../../core/widgets/fav_widget.dart';
import '../../../../core/widgets/share_widget.dart';
import '../../../../core/widgets/waiting_widget.dart';
import '../../../../injection_container.dart';
import '../../../wishlist/domain/usecase/add_to_wishlist_usecase.dart';
import '../bloc/posts_bloc.dart';
import '../bloc/posts_state.dart';




class PostPage extends StatefulWidget {
  const PostPage({Key? key,required this.title,required this.id}) : super(key: key);
  final String title;

  final int id;

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;


    return BlocProvider(
        create: (BuildContext context) => sl<PostsBloc>(),
        child: BlocBuilder<PostsBloc, PostState>(builder: (context, state) {
          if (kDebugMode) {
            print("State IS $state");
          }

          if (state is Empty) {
            BlocProvider.of<PostsBloc>(context).add(GetPostEvent(id: widget.id));
          }
          if (state is Loading) {
            return const WaitingWidget();
          }
          if(state is SuccessGetPost){



            return Scaffold(
              appBar: appBarWidgetType3(widget.title,context,true,[],null),
              body: Padding(
                padding: const EdgeInsets.only(top:10),
                child: Container(
                  height: size.height,
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
                                items: state.params.attachments.map(
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
                                              boxFit: BoxFit.cover,
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
                                      selectedIndex = state.params.attachments[index].id;
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
                                children: state.params.attachments
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
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(state.params.title,style: poppinsSemiBoldTextStyle(fontSize: 20, context: context),),


                                  Row(
                                    children: [

                                      ShareWidget(bgColor:Theme.of(context).scaffoldBackgroundColor),
                                      const SizedBox(width: 30,),
                                      FavWidget(bgColor:Theme.of(context).scaffoldBackgroundColor,
                                        addProductToFavParams:
                                        AddProductToFavParams(
                                            apiId: state.params.id,
                                            title: state.params.title,
                                            image:(state.params.attachments.isNotEmpty)? s3Amazonaws+state.params.attachments[0].path:""),
                                      ),
                                    ],
                                  ),


                                ],
                              ),

                              // Row(
                              //   children: [
                              //
                              //     Icon(Icons.location_on_outlined,color: iconsColor,size: 20,),
                              //
                              //     // const SizedBox(width: 5,),
                              //     // Text(state.params.address,style: poppinsMediumTextStyle(fontSize: 12, context: context),),
                              //   ],
                              // ),
                              //
                              // Row(
                              //   children: [
                              //     TagWidget(tags: tagsList),
                              //   ],
                              // ),


                              Padding(
                                padding: const EdgeInsets.only(top:20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("10 min ago",style: poppinsRegularTextStyle(fontSize: 12, context: context),),
                                    Text(state.params.createdByUser.username,style: poppinsRegularTextStyle(fontSize: 12, context: context),),

                                  ],
                                ),
                              ),

                              Row(
                                children: [
                                  DescriptionWidget(
                                    title: "Description",
                                    description: state.params.description,
                                  ),
                                ],
                              ),

                              // LocationOnMapWidget(
                              //   latitude: 37.4220,
                              //   longitude: -122.0841,
                              // ),


                              SizedBox(height: 30,),
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
