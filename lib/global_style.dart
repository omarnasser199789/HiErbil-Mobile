import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hi_erbil_mobile/product_page.dart';

import 'core/globals.dart';
import 'core/widgets/app_bar_widget.dart';
import 'core/widgets/product_widget.dart';
import 'features/home/data/models/tags_model.dart';
import 'features/home/presentation/bloc/bloc.dart';
import 'features/wishlist/domain/usecase/add_to_wishlist_usecase.dart';

class GlobalStyle extends StatelessWidget {
  const GlobalStyle({Key? key, required this.tagPlaces,required this.catId}) : super(key: key);
  final List<TagPlace> tagPlaces;
  final int catId;
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return    SingleChildScrollView(
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
          itemCount: tagPlaces.length,
          itemBuilder: (BuildContext ctx, index) {
            return ProductWidget(
              enableFav: true,
              addProductToFavParams:
              AddProductToFavParams(
                  apiId: tagPlaces[index].place.id,
                  title: tagPlaces[index].place.title,
                  image:  (tagPlaces[index].place.attachments.isNotEmpty)? s3Amazonaws+ tagPlaces[index].place.attachments[0].path:""
              ),
              title:tagPlaces[index].place.title,
              image: (tagPlaces[index].place.attachments.isNotEmpty)? s3Amazonaws+ tagPlaces[index].place.attachments[0].path:null,
              onTap: () async{
             var v =  await   goTo(
                    context,
                        (context) =>  ProductPage(
                      title: tagPlaces[index].place.title,
                          id: tagPlaces[index].place.id,
                    ));

             BlocProvider.of<HomeBloc>(context).add(GetTagsEvent(catId: catId));/// => SuccessGetBlogCategories

              },
            );
          }),
    );
  }
}