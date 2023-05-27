import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hi_erbil_mobile/features/wishlist/presentation/pages/bloc/bloc.dart';

import '../../../../core/globals.dart';
import '../../../../core/widgets/app_bar_type3.dart';
import '../../../../core/widgets/app_bar_widget.dart';
import '../../../../core/widgets/empty_state_widget.dart';
import '../../../../core/widgets/fav_widget.dart';
import '../../../../core/widgets/product_widget.dart';
import '../../../home/presentation/widgets/global_style.dart';
import '../../../../injection_container.dart';
import '../../../../core/pages/product_page.dart';
import '../../domain/entities/wishlist_entity.dart';
import '../../domain/usecase/add_to_wishlist_usecase.dart';
import 'bloc/wishlist_bloc.dart';
import 'bloc/wishlist_state.dart';

class WishlistPage extends StatefulWidget {
   WishlistPage({Key? key}) : super(key: key);

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool _isExpanded = true;

  List<WishlistEntity> wishlistEntity=[];


  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
    );
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut);
    // Delay execution of _toggleContainer by 1 second
    Future.delayed(Duration(milliseconds: 100), () {
      _toggleContainer();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleContainer() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

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
            body: Container(
              height: size.height,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      height: _isExpanded ? 0.0 : size.height - 100,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                      ),
                      child: SingleChildScrollView(
                        child:(wishlistEntity.isNotEmpty)? GridView.builder(
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
                                    image:  (wishlistEntity[index].image!="")?wishlistEntity[index].image:null,
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
                            }):
                        EmptyStateWidget(svg: 'assets/svg/NoWishlist.svg', text1: 'You don’t have any wishlists yet!',),
                      )
                  ),
                ],
              ),
            ),
          );
        }));



  }
}
