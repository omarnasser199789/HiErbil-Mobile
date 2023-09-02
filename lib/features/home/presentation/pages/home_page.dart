import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hi_erbil_mobile/core/widgets/waiting_widget.dart';
import 'package:hi_erbil_mobile/features/home/presentation/widgets/places_to_go_widget.dart';
import 'package:hi_erbil_mobile/features/home/presentation/widgets/newest_products_widget.dart';
import '../../../../core/globals.dart';
import '../../../../core/widgets/app_bar_widget.dart';
import '../../../../core/widgets/product_widget.dart';
import '../../../../injection_container.dart';
import 'product_page.dart';
import '../../../wishlist/domain/usecase/add_to_wishlist_usecase.dart';
import '../../domain/usecase/get_places_usecase.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../bloc/home_state.dart';
import '../widgets/banner_widget.dart';
import '../widgets/categories_widget.dart';
import '../widgets/header_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   TextEditingController  controller = TextEditingController();
   bool allowSearch=false;
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    Size size =MediaQuery.of(context).size;

    return BlocProvider(
        create: (BuildContext context) => sl<HomeBloc>(),
        child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
          if (kDebugMode) {
            print("Home State IS $state");
          }

          if(controller.text != ""){
            print(controller.text);
          }

          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  HeaderWidget(
                    controller: controller,
                    onFieldSubmitted: (value) {
                      BlocProvider.of<HomeBloc>(context).add(GetPlacesEvent(params: GetPlacesParams(text: "")));
                    },),
                  Container(
                    height: size.height-85,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                         if(controller.text=="")
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Padding(
                                  padding:  EdgeInsets.only(top:18),
                                  child: BannerWidget(padding:  EdgeInsets.only(left: 17,right: 17),height: 200,borderRadius: BorderRadius.circular(10),),
                                ),

                                CategoriesWidget(),
                                NewestProductsWidget(),
                                AllProductsWidget(),
                                const SizedBox(height: 100,),
                              ],
                            ),

                          if(controller.text!=""&& state is SuccessGetPlaces)
                            GridView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                padding: const EdgeInsets.only(left: 17, right: 17, top: 31),
                                shrinkWrap: true,
                                gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 210, //210
                                  childAspectRatio:
                                  (orientation == Orientation.landscape) ? 0.83 : 0.9,
                                  crossAxisSpacing: 17,
                                  mainAxisSpacing: 17,
                                ),
                                itemCount: state.placesEntity.data.length,
                                itemBuilder: (BuildContext ctx, index) {
                                  return ProductWidget(
                                    enableFav: true,
                                    addProductToFavParams:
                                    AddProductToFavParams(
                                        apiId:  state.placesEntity.data[index].id,
                                        title:  state.placesEntity.data[index].title,
                                        image:  ( state.placesEntity.data[index].attachments.isNotEmpty)? s3Amazonaws+  state.placesEntity.data[index].attachments[0].path:""
                                    ),
                                    title: state.placesEntity.data[index].title,
                                    image: ( state.placesEntity.data[index].attachments.isNotEmpty)? s3Amazonaws+  state.placesEntity.data[index].attachments[0].path:null,
                                    onTap: () async{
                                      var v =  await   goTo(
                                          context,
                                              (context) =>  ProductPage(
                                            title:  state.placesEntity.data[index].title,
                                            id:  state.placesEntity.data[index].id,
                                          ));

                                      // BlocProvider.of<HomeBloc>(context).add(GetTagsEvent(catId: catId));/// => SuccessGetBlogCategories

                                    },
                                  );
                                }),

                          if(controller.text!=""&& state is Loading)
                            Center(child: WaitingWidget()),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }));

  }
}
