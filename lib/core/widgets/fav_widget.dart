import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hi_erbil_mobile/features/wishlist/presentation/pages/bloc/bloc.dart';

import '../../features/wishlist/domain/usecase/add_to_wishlist_usecase.dart';
import '../../injection_container.dart';

class FavWidget extends StatelessWidget {
   FavWidget({Key? key, this.bgColor,required this.addProductToFavParams}) : super(key: key);
  final Color ? bgColor;
  final AddProductToFavParams  addProductToFavParams;

  bool fav =false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
        create: (BuildContext context) => sl<WishlistBloc>(),
        child: BlocBuilder<WishlistBloc, WishlistState>(builder: (context, state) {
          if (kDebugMode) {
            print("State IS $state");
          }
          if(state is Empty){
            BlocProvider.of<WishlistBloc>(context).add(IsFavEvent(id:
            addProductToFavParams.apiId
            ));
          }
          if(state is SuccessGetIsFav){
          fav= state.fav==200?true:false;
            return Container(
                decoration: BoxDecoration(
                  color:bgColor?? Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(size.width),
                ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FavoriteButton(
                  iconSize: 35,
                  isFavorite:fav,
                  valueChanged: (_isFavorite) {
                    if(fav==false){
                      BlocProvider.of<WishlistBloc>(context).add(AddToWishlistEvent(params:
                      addProductToFavParams
                      ));
                    }else{
                      BlocProvider.of<WishlistBloc>(context).add(DeleteFromFavEvent(id:
                      addProductToFavParams.apiId
                      ));
                    }

                  },
                ),
              ),
            );
          }

          if(state is SuccessDeleteFromFav){
            return Container(
              decoration: BoxDecoration(
                color:bgColor?? Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(size.width),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FavoriteButton(
                  iconSize: 35,
                  isFavorite:false,
                  valueChanged: (_isFavorite) {
                      BlocProvider.of<WishlistBloc>(context).add(AddToWishlistEvent(params:
                      addProductToFavParams
                      ));


                  },
                ),
              ),
            );
          }

          if( state is SuccessAddToWishlist){
            return Container(
              decoration: BoxDecoration(
                color:bgColor?? Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(size.width),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FavoriteButton(
                  iconSize: 35,
                  isFavorite:true,
                  valueChanged: (_isFavorite) {

                      BlocProvider.of<WishlistBloc>(context).add(DeleteFromFavEvent(id:
                      addProductToFavParams.apiId
                      ));


                  },
                ),
              ),
            );
          }
          return Container();


        }));



  }
}
