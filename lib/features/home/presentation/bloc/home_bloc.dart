import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hi_erbil_mobile/features/home/presentation/bloc/success_error/either_success_or_error.dart';

import '../../domain/usecase/get_all_products_usecase.dart';
import '../../domain/usecase/get_banners_usecase.dart';
import '../../domain/usecase/get_categories_usecase.dart';
import '../../domain/usecase/get_map_item_usecase.dart';
import '../../domain/usecase/get_newest_products_usecase.dart';
import '../../domain/usecase/get_place_by_id_usecase.dart';
import '../../domain/usecase/get_places_usecase.dart';
import '../../domain/usecase/get_product_by_id_usecase.dart';
import '../../domain/usecase/get_products_by_sub_cat_id_usecase.dart';
import '../../domain/usecase/get_sub_category.dart';
import '../../domain/usecase/get_tags_usecase.dart';
import 'bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetBannersUseCase getBannersUseCase;
  final GetCategoriesUseCase getCategoriesUseCase;
  final GetPlacesUseCase getPlacesUseCase;
  final GetTagsUseCase getTagsUseCase;
  final GetPlaceByIdUseCase getPlaceByIdUseCase;
  final GetMapItemsUseCase getMapItemsUseCase;
  final GetSubCategoryUseCase getSubCategoryUseCase;
  final GetProductsBySubCatIdUseCase getProductsBySubCatIdUseCase;
  final GetProductsByIdUseCase getProductsByIdUseCase;
  final GetNewestProductsUseCase getNewestProductsUseCase;
  final GetAllProductsUseCase getAllProductsUseCase;

  HomeBloc({
    required GetBannersUseCase concreteGetBannersUseCase,
    required GetCategoriesUseCase concreteGetCategoriesUseCase,
    required GetPlacesUseCase concreteGetPlacesUseCase,
    required GetTagsUseCase concreteGetTagsUseCase,
    required GetPlaceByIdUseCase concreteGetPlaceByIdUseCase,
    required GetMapItemsUseCase concreteGetMapItemsUseCase,
    required GetSubCategoryUseCase concreteGetSubCategoryUseCase,
    required GetProductsBySubCatIdUseCase concreteGetProductsBySubCatIdUseCase,
    required GetProductsByIdUseCase concreteGetProductsByIdUseCase,
    required GetNewestProductsUseCase concreteGetNewestProductsUseCase,
    required GetAllProductsUseCase concreteGetAllProductsUseCase,

  })  : assert(
               concreteGetBannersUseCase != null,
        ),
        getBannersUseCase = concreteGetBannersUseCase,
        getCategoriesUseCase = concreteGetCategoriesUseCase,
        getPlacesUseCase = concreteGetPlacesUseCase,
        getTagsUseCase = concreteGetTagsUseCase,
        getPlaceByIdUseCase = concreteGetPlaceByIdUseCase,
        getMapItemsUseCase = concreteGetMapItemsUseCase,
        getSubCategoryUseCase = concreteGetSubCategoryUseCase,
        getProductsBySubCatIdUseCase = concreteGetProductsBySubCatIdUseCase,
        getProductsByIdUseCase = concreteGetProductsByIdUseCase,
        getNewestProductsUseCase = concreteGetNewestProductsUseCase,
        getAllProductsUseCase = concreteGetAllProductsUseCase,

        super(Empty());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {

    if(event is GetBannersEvent){
      yield Loading();
      final failureOrPhysician = await getBannersUseCase("");
      yield* SuccessGetBannersOrErrorState(failureOrPhysician);
    }
    else if(event is GetCategoriesEvent){
      yield Loading();
      final failureOrPhysician = await getCategoriesUseCase("");
      yield* SuccessGetCategoriesOrErrorState(failureOrPhysician);
    }
    else if(event is GetPlacesEvent){
      yield Loading();
      final failureOrPhysician = await getPlacesUseCase(event.params);
      yield* SuccessGetPlacesOrErrorState(failureOrPhysician);
    }
    else if(event is GetTagsEvent){
      yield Loading();
      final failureOrPhysician = await getTagsUseCase(event.catId);
      yield* SuccessGetTagsOrErrorState(failureOrPhysician);
    }
    else if(event is GetPlaceEvent){
      yield Loading();
      final failureOrPhysician = await getPlaceByIdUseCase(event.id);
      yield* SuccessGetPlaceOrErrorState(failureOrPhysician);
    }
    else if(event is GetMapItemsEvent){
      yield Loading();
      final failureOrPhysician = await getMapItemsUseCase(0);
      yield* SuccessGetMapItemsOrErrorState(failureOrPhysician);
    }
    else if(event is GetSubCategoryEvent){
      yield Loading();
      final failureOrPhysician = await getSubCategoryUseCase(event.id);
      yield* SuccessGetSubCategoryOrErrorState(failureOrPhysician);
    }
    else if(event is GetProductsBySubCatIdEvent){
      yield Loading();
      final failureOrPhysician = await getProductsBySubCatIdUseCase(event.id);
      yield* SuccessGetProductsBySubCatIdOrErrorState(failureOrPhysician);
    }
    else if(event is GetProductsByIdEvent){
      yield Loading();
      final failureOrPhysician = await getProductsByIdUseCase(event.id);
      yield* SuccessGetProductsByIdOrErrorState(failureOrPhysician);
    }
    else if(event is GetNewestProductsEvent){
      yield Loading();
      final failureOrPhysician = await getNewestProductsUseCase(null);
      yield* SuccessGetNewestProductsOrErrorState(failureOrPhysician);
    }
    else if(event is GetAllProductsEvent){
      yield Loading();
      final failureOrPhysician = await getAllProductsUseCase(null);
      yield* SuccessGetAllProductsOrErrorState(failureOrPhysician);
    }


  }
}
