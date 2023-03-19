import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hi_erbil_mobile/categories_page.dart';
import 'package:hi_erbil_mobile/core/globals.dart';
import 'package:hi_erbil_mobile/core/widgets/app_bar_widget.dart';

import '../../../../Theme/style.dart';
import '../../../../category_page.dart';
import '../../../../core/widgets/cached_net_work_image.dart';
import '../../../../injection_container.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../bloc/home_state.dart';


class CategoriesWidget extends StatelessWidget {
   CategoriesWidget({Key? key}) : super(key: key);


  List<Widget> widgetList = [];
  List<Widget> gridViewList = [];

  @override
  Widget build(BuildContext context) {


    return BlocProvider(
        create: (BuildContext context) => sl<HomeBloc>(),
        child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
          if (kDebugMode) {
            print("Categories State IS $state");
          }

          if (state is Empty) {

            BlocProvider.of<HomeBloc>(context).add(GetCategoriesEvent());
          }
          if(state is SuccessGetCategories ){
            for(var item in state.categoriesEntity.data){
              gridViewList.add(
                  CategoriesListItem(
                    title: item.title,
                    image:(item.attachments.isNotEmpty)? s3Amazonaws+item.attachments[0].path:null,
                    onTap: (){goTo(context, (context) => CategoryPage(title:item.title ,from: 1,));},));

            }
            // gridViewList.add( CategoriesListItem(title: "Malls",onTap: (){goTo(context, (context) => CategoryPage(title:"Malls" ,from: 1));},));
            // gridViewList.add( CategoriesListItem(title: "Real Estate",onTap: (){goTo(context, (context) => CategoryPage(title:"Real Estate" ,from: 1,));},));
            // gridViewList.add( CategoriesListItem(title: "Mechanic",onTap: (){goTo(context, (context) => CategoryPage(title:"Mechanic" ,from: 1,));},));
            // gridViewList.add( CategoriesListItem(title: "Hospitals",onTap: (){goTo(context, (context) => CategoryPage(title:"Hospitals",from: 1 ,));},));
            //
            gridViewList.add( CategoriesListItem(type2: true,onTap: (){
              goTo(context, (context) =>  const CategoriesPage());
            },));



            widgetList.add(Text("Categories",style: poppinsSemiBoldTextStyle(fontSize: 15,context: context),));

            widgetList.add(
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: GridView.builder(
                      padding: const EdgeInsets.all(0),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 140,
                          childAspectRatio: 0.9,
                          crossAxisSpacing: 0,
                          mainAxisSpacing: 0),
                      itemCount: gridViewList.length,
                      itemBuilder: (BuildContext context, index){
                        return gridViewList[index];
                      }
                  ),
                )
            );


          }

          return Padding(
            padding: const EdgeInsets.only(top:26,left: 17,right: 17),
            child: SizedBox(
              width: double.infinity,

              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widgetList,
              ),
            ),
          );
        }));


  }
}

class CategoriesListItem extends StatelessWidget {
  const CategoriesListItem({Key? key,this.type2, this.title,this.image,required this.onTap}) : super(key: key);
  final bool ? type2;
  final String  ?title;
  final String  ?image;
  final Function () onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 110,
            height: 110,
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(10)
            ),


            child: (type2==null)?CachedNetWorkImage(borderRadius: BorderRadius.circular(10),
              boxFit: BoxFit.fill,url: image,):
            Center(child: Text("More",style: poppinsRegularTextStyle(fontSize: 16, context: context,color: Theme.of(context).primaryColor),)),
          ),

          if(type2==null)
          Padding(
            padding: const EdgeInsets.only(top:5),
            child: Text(title!,style: poppinsMediumTextStyle(fontSize: 12,context: context),),
          )
        ],
      ),
    );
  }
}

