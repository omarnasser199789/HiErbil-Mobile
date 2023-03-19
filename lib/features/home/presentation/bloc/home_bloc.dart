import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hi_erbil_mobile/features/home/presentation/bloc/success_error/either_success_or_error.dart';

import '../../domain/usecase/get_banners_usecase.dart';
import '../../domain/usecase/get_categories_usecase.dart';
import '../../domain/usecase/get_places_usecase.dart';
import 'bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetBannersUseCase getBannersUseCase;
  final GetCategoriesUseCase getCategoriesUseCase;
  final GetPlacesUseCase getPlacesUseCase;




  HomeBloc({
    required GetBannersUseCase concreteGetBannersUseCase,
    required GetCategoriesUseCase concreteGetCategoriesUseCase,
    required GetPlacesUseCase concreteGetPlacesUseCase,




  })  : assert(
               concreteGetBannersUseCase != null,
        ),
        getBannersUseCase = concreteGetBannersUseCase,
        getCategoriesUseCase = concreteGetCategoriesUseCase,
        getPlacesUseCase = concreteGetPlacesUseCase,



        super(Empty());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {

    if(event is GetBannersEvent){
      yield Loading();
      final failureOrPhysician = await getBannersUseCase("");
      yield* SuccessGetBannersOrErrorState(failureOrPhysician);
    }
    if(event is GetCategoriesEvent){
      yield Loading();
      final failureOrPhysician = await getCategoriesUseCase("");
      yield* SuccessGetCategoriesOrErrorState(failureOrPhysician);
    }
    if(event is GetPlacesEvent){
      yield Loading();
      final failureOrPhysician = await getPlacesUseCase(event.params);
      yield* SuccessGetPlacesOrErrorState(failureOrPhysician);
    }


  }
}
