import 'package:flutter/material.dart';

import 'Theme/style.dart';
import 'core/widgets/cached_net_work_image.dart';

class SightsWidget extends StatelessWidget {
   SightsWidget({Key? key}) : super(key: key);


  List<Widget> widgetList = [];
  List<Widget> rowList = [];

  @override
  Widget build(BuildContext context) {
    rowList.add(SightsItemList());
    rowList.add(SightsItemList());
    rowList.add(SightsItemList());


    widgetList.add(Text("Sights",style: poppinsSemiBoldTextStyle(fontSize: 15,context: context),));
    widgetList.add(
        Padding(
          padding: const EdgeInsets.only(top:16),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:rowList,
            ),
          ),
        )
    );

    return Padding(
      padding: const EdgeInsets.only(left: 17),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: widgetList,
      ),
    );
  }
}

class SightsItemList extends StatelessWidget {
  const SightsItemList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 17),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 187,
            width: 182,
            child: CachedNetWorkImage(borderRadius: BorderRadius.circular(10),
              boxFit: BoxFit.fill,url: null,),
          ),

          Padding(
            padding: const EdgeInsets.only(top:9,bottom: 3),
            child: Text("Bexal",style: poppinsMediumTextStyle(fontSize: 16, context: context),),
          ),
          Text("Erbil, Rwandz",style: poppinsMediumTextStyle(fontSize: 14, context: context),),
        ],
      ),
    );
  }
}

