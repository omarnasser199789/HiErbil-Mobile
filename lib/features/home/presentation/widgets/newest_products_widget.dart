import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hi_erbil_mobile/core/globals.dart';
import 'package:hi_erbil_mobile/features/home/presentation/bloc/bloc.dart';

import '../../../../Locale/locale.dart';
import '../../../../Theme/style.dart';
import '../../../../core/widgets/app_bar_widget.dart';
import '../../../../core/widgets/cached_net_work_image.dart';
import '../../../../core/widgets/waiting_widget.dart';
import 'history_widget.dart';
import '../../../../injection_container.dart';
import '../pages/product_page.dart';
import '../../data/models/places_model.dart';
import '../../domain/usecase/get_places_usecase.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_state.dart';

class NewestProductsWidget extends StatelessWidget {
  NewestProductsWidget({Key? key}) : super(key: key);

  List<Widget> widgetList = [];
  List<Widget> rowList = [];

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return BlocProvider(
        create: (BuildContext context) => sl<HomeBloc>(),
        child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
          if (kDebugMode) {
            print("Categories State IS $state");
          }
          if (state is Empty) {
              BlocProvider.of<HomeBloc>(context).add(GetNewestProductsEvent());
          }
          if(state is Loading){
            return const WaitingWidget();
          }

          if (state is SuccessGetNewestProductsEntity) {
            for(var item in state.list){
                rowList.add(GestureDetector(
                  onTap: (){
                    goTo(context, (context) =>  ProductPage(title: item.titleEn, id: item.id,));
                  },
                  child: NewestProductsItemList(
                    image:(item.attachments.isNotEmpty)? s3Amazonaws+item.attachments[0].path:null,
                    title: item.titleEn,
                    address: "",
                  ),
                ));
            }
            widgetList.add(Text("Newest products",style: poppinsSemiBoldTextStyle(fontSize: 15,context: context),));
            widgetList.add(Padding(
              padding: const EdgeInsets.only(top:16),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:rowList,
                ),
              ),
            ));
          }
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 17),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: widgetList,
                ),
              ),


            ],
          );
        }));



  }
}

class NewestProductsItemList extends StatelessWidget {
  const NewestProductsItemList({Key? key,this.image, required this.title,required this.address}) : super(key: key);
  final String ? image;
  final String  title;
  final String  address;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 17),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 187,
            width: 182,
            child: CachedNetWorkImage(borderRadius: BorderRadius.circular(10),
              boxFit: BoxFit.fill,url: image,),
          ),

          Padding(
            padding: const EdgeInsets.only(top:9,bottom: 3),
            child: Text(title,style: poppinsMediumTextStyle(fontSize: 16, context: context),),
          ),
          Text(address,style: poppinsMediumTextStyle(fontSize: 14, context: context),),
        ],
      ),
    );
  }
}

