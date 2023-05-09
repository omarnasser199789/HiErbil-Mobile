import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hi_erbil_mobile/features/wishlist/presentation/pages/bloc/bloc.dart';

import '../../../../core/globals.dart';
import '../../../../core/widgets/app_bar_type3.dart';
import '../../../../core/widgets/app_bar_widget.dart';
import '../../../../core/widgets/fav_widget.dart';
import '../../../../core/widgets/product_widget.dart';
import '../../../../global_style.dart';
import '../../../../injection_container.dart';
import '../../../../product_page.dart';
import '../../domain/entities/wishlist_entity.dart';
import '../../domain/usecase/add_to_wishlist_usecase.dart';
import 'bloc/wishlist_bloc.dart';
import 'bloc/wishlist_state.dart';

class WishlistPage extends StatelessWidget {
   WishlistPage({Key? key}) : super(key: key);
  List<WishlistEntity> wishlistEntity=[];
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    final orientation = MediaQuery.of(context).orientation;
    return BlocProvider(
        create: (BuildContext context) => sl<WishlistBloc>(),
        child: BlocBuilder<WishlistBloc, WishlistState>(builder: (context, state) {
          if (kDebugMode) {
            print("State IS $state");
          }
          if(state is Empty){
            BlocProvider.of<WishlistBloc>(context).add(GetWishlistEvent());
          }
          if(state is SuccessDeleteFromFav){
            BlocProvider.of<WishlistBloc>(context).add(GetWishlistEvent());
          }
          if(state is SuccessGetWishlist){

            wishlistEntity = state.wishlistEntity;
          }


          return Scaffold(
            appBar: appBarWidgetType3("Wishlist", context, false, [], null),
            body: Padding(
              padding: const EdgeInsets.only(top:10),
              child: Container(
                  width: double.infinity,
                  height:size.height ,
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                  ),
                  child: SingleChildScrollView(
                    child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.only(
                            left: 17, right: 17, top: 31),
                        shrinkWrap: true,
                        gridDelegate:
                        SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 210, //210
                          childAspectRatio:
                          (orientation == Orientation.landscape)
                              ? 0.83
                              : 0.9,
                          crossAxisSpacing: 17,
                          mainAxisSpacing: 17,
                        ),
                        itemCount:wishlistEntity.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return Stack(
                            alignment: Alignment.topRight,
                            children: [
                              ProductWidget(
                                enableFav: true,
                                title:wishlistEntity[index].title,
                                image:  (wishlistEntity[index].image!="")?s3Amazonaws+ wishlistEntity[index].image:null,
                                onTap: () {
                                  goTo(
                                      context,
                                          (context) =>  ProductPage(
                                        title:  wishlistEntity[index].title, id: wishlistEntity[index].apiId,
                                      ));
                                }, addProductToFavParams:
                              AddProductToFavParams(
                                  apiId: wishlistEntity[index].apiId,
                                  title: wishlistEntity[index].title,
                                  image: s3Amazonaws+ wishlistEntity[index].image),

                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color:Theme.of(context).cardColor,
                                    borderRadius: BorderRadius.circular(size.width),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: FavoriteButton(
                                      iconSize: 35,
                                      isFavorite:true,
                                      valueChanged: (_isFavorite) {
                                        BlocProvider.of<WishlistBloc>(context).add(DeleteFromFavEvent(id:
                                        wishlistEntity[index].apiId
                                        ));


                                      },
                                    ),
                                  ),
                                ),
                              ),

                            ],
                          );
                        }),
                  )
              ),
            ),
          );
        }));



  }
}
