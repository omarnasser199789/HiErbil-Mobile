import 'package:flutter/material.dart';

import '../../../../Theme/style.dart';
import 'category_page.dart';
import '../../../posts/presentation/pages/posts_page.dart';
import '../../../../core/widgets/app_bar_widget.dart';
import '../../../../core/widgets/cached_net_work_image.dart';
import '../../../../core/widgets/custom_botton.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    final orientation = MediaQuery.of(context).orientation;
    return Padding(
      padding: const EdgeInsets.only(top:31),
      child: Column(
        children: [
          GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              gridDelegate:    SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: (orientation==Orientation.landscape)?130:170,//210
                childAspectRatio:(orientation==Orientation.landscape)?0.9:0.85,
                crossAxisSpacing: 17,
                mainAxisSpacing: 17,
              ),
              itemCount: 9,
              itemBuilder: (BuildContext ctx, index) {
                return GestureDetector(
                  onTap: (){
                    goTo(context, (context) => CategoryPage(title:"Restaurants", id: -1,));
                  },
                  child: Column(

                    children: [
                      SizedBox(
                        width: 110,
                        height: 110,
                        child: CachedNetWorkImage(borderRadius: BorderRadius.circular(10),
                          boxFit: BoxFit.fill,url: null,),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top:5),
                        child: Text("Restaurants",style: poppinsMediumTextStyle(fontSize: 10, context: context),),
                      ),


                    ],
                  ),
                );


              }),
          Padding(
            padding: const EdgeInsets.only(top:23),
            child: SizedBox(
              width: double.infinity,
              height: 192,


              child: Stack(
                // alignment: Alignment.bottomLeft,
                children: [
                  CachedNetWorkImage(borderRadius: BorderRadius.circular(10),
                    boxFit: BoxFit.fill,url: null,),


                  Padding(
                    padding: const EdgeInsets.only(left: 21,right: 21,bottom: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Up to 50% Discount",style: poppinsSemiBoldTextStyle(fontSize: 18, context: context,color: Colors.white),),

                        const Padding(
                          padding: EdgeInsets.only(top: 30),
                          child: CustomButton(title: "Read More",width: 112,color: Colors.white,textColor: Colors.black,borderRadius: 50,),
                        ),

                      ],
                    ),
                  )

                ],
              ),

            ),
          )
        ],
      ),
    );
  }
}
