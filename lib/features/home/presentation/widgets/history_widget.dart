// import 'package:flutter/material.dart';
// import 'package:hi_erbil_mobile/Theme/style.dart';
// import 'package:hi_erbil_mobile/core/widgets/custom_botton.dart';
// import 'package:hi_erbil_mobile/core/pages/product_page.dart';
//
// import '../../../../core/globals.dart';
// import '../../../../core/widgets/app_bar_widget.dart';
// import '../../../../core/widgets/cached_net_work_image.dart';
// import '../../data/models/places_model.dart';
//
// class HistoryWidget extends StatelessWidget {
//
//   const HistoryWidget({Key? key,required this.mainItem}) : super(key: key);
//
//   final Datum mainItem;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(top:34),
//       child: Stack(
//         children: [
//           Container(
//             height: 502,
//             width: double.infinity,
//             child: CachedNetWorkImage(borderRadius: BorderRadius.circular(0),
//               boxFit: BoxFit.fill,url: (mainItem.attachments.isNotEmpty)?s3Amazonaws+mainItem.attachments[0].path:null,),
//           ),
//           Container(
//             height: 502,
//             width: double.infinity,
//             decoration:  BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//
//                 colors: <Color>[
//                   Theme.of(context).primaryColor.withOpacity(0.1),
//                   Theme.of(context).primaryColor.withOpacity(0.2),
//                   Theme.of(context).primaryColor.withOpacity(0.3),
//                   Theme.of(context).primaryColor.withOpacity(0.4),
//                   Theme.of(context).primaryColor.withOpacity(0.5),
//                   Theme.of(context).primaryColor.withOpacity(0.6),
//                   Theme.of(context).primaryColor.withOpacity(0.7),
//
//                 ],
//                 tileMode: TileMode.mirror,
//               ),
//             ),
//
//             child:Padding(
//               padding: const EdgeInsets.only(left: 17,right: 17),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(top:250),
//                     child: Text(mainItem.title,style: poppinsSemiBoldTextStyle(fontSize: 32, context: context,color: Colors.white),),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top:10),
//                     child: Text(mainItem.description,maxLines: 2,style: poppinsRegularTextStyle(fontSize: 14, context: context,color: Colors.white),),
//                   ),
//
//                    Padding(
//                     padding: EdgeInsets.only(top:25),
//                     child: CustomButton(width: 120,title: "Read More",color: Colors.white,
//                       textColor: Colors.black,borderRadius: 50,
//                     onTap: (){
//                       goTo(context, (context) =>  ProductPage(title: mainItem.title,
//                         id: mainItem.id,));
//                     },),
//                   ),
//                 ],
//               ),
//             ) ,
//           ),
//         ],
//       ),
//     );
//   }
// }
