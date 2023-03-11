import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';

import '../../Theme/style.dart';
import 'cached_net_work_image.dart';
import 'fav_widget.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({Key? key, required this.enableFav,required this.onTap,required this.title}) : super(key: key);
  final bool enableFav;
  final Function () onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 167,
            height: 171,
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                CachedNetWorkImage(borderRadius: BorderRadius.circular(10),
                  boxFit: BoxFit.fill,url: null,),
                if(enableFav)
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: FavWidget()
                )
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top:4),
            child: Text(title,style: poppinsMediumTextStyle(fontSize: 14, context: context),),
          ),


        ],
      ),
    );
  }
}
