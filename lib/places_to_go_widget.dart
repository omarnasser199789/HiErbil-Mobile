import 'package:flutter/material.dart';

import 'Theme/style.dart';
import 'core/widgets/cached_net_work_image.dart';
import 'core/widgets/product_widget.dart';

class PlacesToGoWidget extends StatelessWidget {
  const PlacesToGoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final orientation = MediaQuery.of(context).orientation;
    return Padding(
      padding: const EdgeInsets.only(left: 17,right: 17),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top:28,bottom: 15),
            child: Text("Places to go",style: poppinsSemiBoldTextStyle(fontSize: 15,context: context),),
          ),
          GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              gridDelegate:   SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 210,//210
                childAspectRatio:(orientation==Orientation.landscape)?0.83:0.9,
                crossAxisSpacing: 17,//
                mainAxisSpacing: 17,
              ),
              itemCount: 10,
              itemBuilder: (BuildContext ctx, index) {
                return  ProductWidget(enableFav: false,onTap: (){}, title: 'Family Mall',);


              }),
        ],
      ),
    );
  }
}
