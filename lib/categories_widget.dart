import 'package:flutter/material.dart';

import 'Theme/style.dart';
import 'core/widgets/cached_net_work_image.dart';


class CategoriesWidget extends StatelessWidget {
   CategoriesWidget({Key? key}) : super(key: key);


  List<Widget> widgetList = [];
  List<Widget> gridViewList = [];

  @override
  Widget build(BuildContext context) {
    gridViewList.add( CategoriesListItem(title: "Restaurants",));
    gridViewList.add( CategoriesListItem(title: "Malls",));
    gridViewList.add( CategoriesListItem(title: "Real Estate",));
    gridViewList.add( CategoriesListItem(title: "Mechanic",));
    gridViewList.add( CategoriesListItem(title: "Hospitals",));
    gridViewList.add( CategoriesListItem(type2: true,));




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
  }
}

class CategoriesListItem extends StatelessWidget {
  const CategoriesListItem({Key? key,this.type2, this.title}) : super(key: key);
  final bool ? type2;
  final String  ?title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 110,
          height: 110,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(10)
          ),


          child: (type2==null)?CachedNetWorkImage(borderRadius: BorderRadius.circular(10),
            boxFit: BoxFit.fill,url: null,):
          Center(child: Text("More",style: poppinsRegularTextStyle(fontSize: 16, context: context,color: Theme.of(context).primaryColor),)),
        ),

        if(type2==null)
        Padding(
          padding: const EdgeInsets.only(top:5),
          child: Text(title!,style: poppinsMediumTextStyle(fontSize: 12,context: context),),
        )
      ],
    );
  }
}

