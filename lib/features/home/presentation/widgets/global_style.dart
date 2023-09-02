import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hi_erbil_mobile/features/home/presentation/pages/product_page.dart';
import '../../../../core/globals.dart';
import '../../../../core/widgets/app_bar_widget.dart';
import '../../../../core/widgets/product_widget.dart';
import '../../../../core/widgets/waiting_widget.dart';
import '../../../../injection_container.dart';
import '../bloc/bloc.dart';
import '../../../wishlist/domain/usecase/add_to_wishlist_usecase.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../pages/common.dart';

class GlobalStyle extends StatelessWidget {
  const GlobalStyle({Key? key, required this.subCatId}) : super(key: key);
  final int subCatId;

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return BlocProvider(
        create: (BuildContext context) => sl<HomeBloc>(),
        child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
          if (kDebugMode) {
            print("Categories State IS $state");
          }

          if (state is Empty) {
            BlocProvider.of<HomeBloc>(context).add(GetProductsBySubCatIdEvent(id: subCatId));
          }

          else if (state is Loading) {
            return const WaitingWidget();
          }

          else if(state is SuccessGetProductsBySubCatIdEntity){
            return SingleChildScrollView(
              child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.only(left: 17, right: 17, top: 31),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 180, //210
                    childAspectRatio: 1,
                    crossAxisSpacing: 17,
                    mainAxisSpacing: 17,
                  ),
                  itemCount: state.list.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return ProductWidget(
                      enableFav: true,
                      addProductToFavParams:
                      AddProductToFavParams(
                          apiId: state.list[index].id,
                          title: state.list[index].titleEn,
                          image:  (state.list[index].attachments.isNotEmpty)? s3Amazonaws+ state.list[index].attachments[0].path:""
                      ),
                      title:state.list[index].titleEn,
                      image: (state.list[index].attachments.isNotEmpty)? s3Amazonaws+ state.list[index].attachments[0].path:null,
                      onTap: () async{
                        var v =  await   goTo(
                            context, (context) =>  ProductPage(
                            title: state.list[index].titleEn,
                            id: state.list[index].id
                        ));
                        // BlocProvider.of<HomeBloc>(context).add(GetTagsEvent(catId: catId));/// => SuccessGetBlogCategories
                      },
                    );
                  }),
            );
          }

          return Container();
        }
        )
    );
  }
}