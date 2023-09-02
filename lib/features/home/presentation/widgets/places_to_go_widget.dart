import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hi_erbil_mobile/core/globals.dart';
import '../../../../Locale/locale.dart';
import '../../../../Theme/style.dart';
import '../../../../core/widgets/app_bar_widget.dart';
import '../../../../core/widgets/product_widget.dart';
import '../../../../core/widgets/waiting_widget.dart';
import '../pages/product_page.dart';
import '../../../wishlist/domain/usecase/add_to_wishlist_usecase.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../bloc/home_state.dart';
import '../../../../injection_container.dart';

class AllProductsWidget extends StatelessWidget {
  AllProductsWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    final orientation = MediaQuery.of(context).orientation;
    return BlocProvider(
        create: (BuildContext context) => sl<HomeBloc>(),
        child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
          if (kDebugMode) {
            print("Categories State IS $state");
          }

          if (state is Empty) {
            BlocProvider.of<HomeBloc>(context).add(GetAllProductsEvent());
          }
          if(state is Loading){
            return const WaitingWidget();
          }


          if (state is SuccessGetAllProductsEntity) {

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 17,right: 17),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top:28,bottom: 15),
                        child: Text("All products",style: poppinsSemiBoldTextStyle(fontSize: 15,context: context),),
                      ),
                      GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          gridDelegate:   SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 210,//210
                            childAspectRatio:(orientation==Orientation.landscape)?0.83:0.89,
                            crossAxisSpacing: 17,//
                            mainAxisSpacing: 17,
                          ),
                          itemCount: state.productListEntity.data.length,
                          itemBuilder: (BuildContext ctx, index) {

                            return  ProductWidget(enableFav: false,onTap: (){
                              goTo(context, (context) =>  ProductPage(title: state.productListEntity.data[index].titleEn,
                                id:state.productListEntity.data[index].id,));
                            },
                              title:state.productListEntity.data[index].titleEn,
                              image: (state.productListEntity.data[index].attachments.isNotEmpty)?s3Amazonaws+ state.productListEntity.data[index].attachments[0].path:null,
                              addProductToFavParams:AddProductToFavParams(
                                  apiId: state.productListEntity.data[index].id,
                                  title: state.productListEntity.data[index].titleEn,
                                  image:(state.productListEntity.data[index].attachments.isNotEmpty)?
                                  s3Amazonaws+state.productListEntity.data[index].attachments[0].path:""),);


                          }),
                    ],
                  ),
                ),
              ],
            );
          }

        return Container();

        }));



  }
}
