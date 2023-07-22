import 'package:flutter/material.dart';
import 'package:hi_erbil_mobile/Theme/style.dart';
import 'package:hi_erbil_mobile/core/widgets/empty_state_widget.dart';
import '../../../../Locale/locale.dart';
import '../../../../core/functions.dart';
import '../../../../core/globals.dart';
import '../../../../core/widgets/app_bar_widget.dart';
import '../../../../core/widgets/cached_net_work_image.dart';
import '../../../../core/pages/product_page.dart';
import '../../data/models/blog_categories_model.dart';
import '../pages/post_page.dart';


class PostsStyle extends StatelessWidget {

   PostsStyle({Key? key,required this.posts}) : super(key: key);

   final List<Post> posts;
  List<Widget> childrenList = [];

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    childrenList = [];
    for(var item in posts){
      childrenList.add(
        GestureDetector(
          onTap: (){
            goTo(
                context,
                    (context) =>  PostPage(
                  title: "Fine Dining", id: item.id,
                ));
          },
          child: Padding(
            padding: const EdgeInsets.only(top:30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height:size.height*0.3,
                  child: CachedNetWorkImage(borderRadius: BorderRadius.circular(10),
                    boxFit: BoxFit.fill,url:(item.attachments.isNotEmpty)? s3Amazonaws+item.attachments[0].path:null,),
                ),

                Padding(
                  padding: const EdgeInsets.only(top:8,bottom: 10),
                  child: Text(item.title,style: poppinsMediumTextStyle(fontSize: 14, context: context),),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text(getTimeAgo(item.createdAt),style: poppinsRegularTextStyle(fontSize: 12, context: context,color: iconsColor),),
                  Text(item.createdByUser.username,style: poppinsRegularTextStyle(fontSize: 12, context: context,color: iconsColor),),
                ],),

              ],
            ),
          ),
        )
      );
    }

    childrenList.add(const SizedBox(height: 100,));
    var locale = AppLocalizations.of(context)!;
    return    SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 17,right: 17),
        child: (posts.isNotEmpty)?Column(
          children: childrenList
        ):EmptyStateWidget(svg: 'assets/svg/EmptyStatePhotoEditor.svg', text1: locale.sorryThereIsNoPlace!,),
      ),
    );
  }
}
