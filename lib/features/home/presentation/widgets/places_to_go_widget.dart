import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hi_erbil_mobile/core/globals.dart';

import '../../../../Theme/style.dart';
import '../../../../core/widgets/app_bar_widget.dart';
import '../../../../core/widgets/cached_net_work_image.dart';
import '../../../../core/widgets/product_widget.dart';
import '../../../../core/widgets/waiting_widget.dart';
import '../../../../product_page.dart';
import '../../../wishlist/domain/usecase/add_to_wishlist_usecase.dart';
import '../../data/models/places_model.dart';
import '../../domain/usecase/get_places_usecase.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../bloc/home_state.dart';
import '../../../../history_widget.dart';
import '../../../../injection_container.dart';

class PlacesToGoWidget extends StatelessWidget {
   PlacesToGoWidget({Key? key}) : super(key: key);
   Datum mainItem = Datum(id: -1, lat: 0.0, long: 0.0, type: '',
      createdAt: DateTime.now(), isMain: true, attachments: [], address: '', title: '', description: '');
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    final orientation = MediaQuery.of(context).orientation;


    return BlocProvider(
        create: (BuildContext context) => sl<HomeBloc>(),
        child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
          if (kDebugMode) {
            print("Categories State IS $state");
          }

          if (state is Empty) {
            BlocProvider.of<HomeBloc>(context).add(GetPlacesEvent(params:GetPlacesParams(type:"Place")));
          }
          if(state is Loading){
            return const WaitingWidget();
          }


          if (state is SuccessGetPlaces) {

            for(var item in state.placesEntity.data){
              if(item.isMain==true){
                mainItem = item;
              }
            }

            return Column(
              children: [
                if(mainItem.id!=-1)
                HistoryWidget(mainItem: mainItem),
                Padding(
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
                          itemCount: state.placesEntity.data.length,
                          itemBuilder: (BuildContext ctx, index) {

                            return  ProductWidget(enableFav: false,onTap: (){
                              goTo(context, (context) =>  ProductPage(title: state.placesEntity.data[index].title,
                                id: state.placesEntity.data[index].id,));
                            },
                              title:state.placesEntity.data[index].title,
                              image: (state.placesEntity.data[index].attachments.isNotEmpty)?s3Amazonaws+ state.placesEntity.data[index].attachments[0].path:null,
                              addProductToFavParams:AddProductToFavParams(
                                  apiId: state.placesEntity.data[index].id,
                                  title: state.placesEntity.data[index].title,
                                  image:(state.placesEntity.data[index].attachments.isNotEmpty)?
                                  s3Amazonaws+state.placesEntity.data[index].attachments[0].path:""),);


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
