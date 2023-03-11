import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hi_erbil_mobile/Theme/style.dart';

import 'banner_widget.dart';
import 'core/widgets/app_bar_type3.dart';
import 'core/widgets/cached_net_work_image.dart';
import 'core/widgets/description_widget.dart';
import 'core/widgets/fav_widget.dart';
import 'core/widgets/share_widget.dart';
import 'core/widgets/taq_widget.dart';
import 'location_on_map_widget.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key,required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidgetType3(title,context,true,[],null),
      body: Padding(
        padding: const EdgeInsets.only(top:10),
        child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: const BorderRadius.only(topLeft:Radius.circular(20),topRight: Radius.circular(20), )
          ),
          child:        SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:   [
                const BannerWidget(padding: EdgeInsets.only(left: 0,right: 0),height: 300,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft:  Radius.circular(20)),),

                Padding(
                  padding: const EdgeInsets.only(left: 17,right: 17,top: 12),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Abu Shahab",style: poppinsSemiBoldTextStyle(fontSize: 20, context: context),),


                           Row(
                             children: [

                               ShareWidget(bgColor:Theme.of(context).scaffoldBackgroundColor),
                               const SizedBox(width: 30,),
                               FavWidget(bgColor:Theme.of(context).scaffoldBackgroundColor),
                             ],
                           ),


                        ],
                      ),

                      Row(
                        children: [

                          Icon(Icons.location_on_outlined,color: iconsColor,size: 20,),

                         const SizedBox(width: 5,),
                          Text("Erbil, 40M opposite Gulan Tower",style: poppinsMediumTextStyle(fontSize: 12, context: context),),
                        ],
                      ),


                       // final List<String> taqList=["Fine Dining","Grills","Middle Eastern","Fish","Drinks"];
                      TagWidget(tags:const ["Fine Dining","Grills","Middle Eastern","Fish","Drinks"]),



                      DescriptionWidget(
                        title: "Description",
                        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris id libero id nulla volutpat bibendum vel eu purus. Nulla commodo quam in felis vestibulum, vel consequat magna faucibus. Sed gravida orci vel metus rhoncus, ac congue velit commodo. Sed id risus mauris.",
                      ),

                      LocationOnMapWidget(
                        latitude: 37.4220,
                        longitude: -122.0841,
                      ),


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
}
