import 'package:flutter/material.dart';
import 'package:hi_erbil_mobile/features/wishlist/domain/usecase/add_to_wishlist_usecase.dart';
import '../../Theme/style.dart';
import 'cached_net_work_image.dart';
import 'fav_widget.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({Key? key, required this.enableFav,
    required this.addProductToFavParams,
    required this.image,required this.onTap,required this.title}) : super(key: key);
  final bool enableFav;
  final Function () onTap;
  final String title;
  final String ? image;
  final AddProductToFavParams addProductToFavParams;

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
            height: 158,
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                CachedNetWorkImage(borderRadius: BorderRadius.circular(10),
                  boxFit: BoxFit.fill,url: image,),
                if(enableFav)
                 Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FavWidget(addProductToFavParams: addProductToFavParams,)
                )
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top:4),
            child: Text(title,style: poppinsMediumTextStyle(fontSize: 14, context: context,),maxLines: 1,),
          ),


        ],
      ),
    );
  }
}
