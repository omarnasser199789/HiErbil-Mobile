import 'package:flutter/material.dart';
import 'package:hi_erbil_mobile/core/globals.dart';
import '../../../../Locale/locale.dart';
import '../../../../Theme/style.dart';
import '../../../../core/widgets/app_bar_widget.dart';
import '../../../../core/widgets/cached_net_work_image.dart';
import '../../domain/entities/categories_entity.dart';
import 'category_page.dart';
import '../../../../core/widgets/app_bar_type3.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key, required this.categoriesEntity}) : super(key: key);
  final   CategoriesEntity categoriesEntity;

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    final orientation = MediaQuery.of(context).orientation;
    var locale = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: appBarWidgetType3(locale.categories!,context,true,[],null),
      body: Padding(
        padding: const EdgeInsets.only(top:10),
        child: Container(
          height: size.height,
          decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
            borderRadius: const BorderRadius.only(topLeft:Radius.circular(20),topRight: Radius.circular(20), )
          ),
          child:        Padding(
            padding: const EdgeInsets.only(top: 17),
            child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                gridDelegate:    SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: (orientation==Orientation.landscape)?130:170,//210
                  childAspectRatio:(orientation==Orientation.landscape)?0.9:0.85,
                  crossAxisSpacing: 17,
                  mainAxisSpacing: 17,
                ),
                itemCount: categoriesEntity.data.length,
                itemBuilder: (BuildContext ctx, index) {
                  return GestureDetector(
                    onTap: (){
                      goTo(context, (context) => CategoryPage(title:categoriesEntity.data[index].title, id: categoriesEntity.data[index].id,));
                    },
                    child: Column(

                      children: [
                        SizedBox(
                          width: 110,
                          height: 110,
                          child: CachedNetWorkImage(borderRadius: BorderRadius.circular(10),
                            boxFit: BoxFit.fill,url: (categoriesEntity.data[index].attachments.isNotEmpty)?s3Amazonaws+categoriesEntity.data[index].attachments[0].path:null,),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top:5),
                          child: Text(categoriesEntity.data[index].title,style: poppinsMediumTextStyle(fontSize: 10, context: context),),
                        ),


                      ],
                    ),
                  );


                }),
          ),
        ),
      ),
    );
  }
}
