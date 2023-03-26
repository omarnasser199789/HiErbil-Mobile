import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'core/globals.dart';
import 'features/home/data/data_source/remot_data_sourse/home_remot_data_source.dart';
import 'features/home/data/repositories/home_repository_impl.dart';
import 'features/home/domain/repositories/home_repository.dart';
import 'features/home/domain/usecase/get_banners_usecase.dart';
import 'features/home/domain/usecase/get_categories_usecase.dart';
import 'features/home/domain/usecase/get_places_usecase.dart';
import 'features/home/presentation/bloc/home_bloc.dart';
import 'features/posts/data/data_source/remot_data_sourse/posts_remot_data_source.dart';
import 'features/posts/data/repositories/posts_repository_impl.dart';
import 'features/posts/domain/repositories/posts_repository.dart';
import 'features/posts/domain/usecase/get_blog_categories_usecase.dart';
import 'features/posts/presentation/bloc/posts_bloc.dart';




final sl = GetIt.instance;

Future<void> init() async {
  ///Bloc
  sl.registerFactory(
    () => HomeBloc(
      concreteGetBannersUseCase: sl(),
      concreteGetCategoriesUseCase: sl(),
      concreteGetPlacesUseCase: sl(),
    ),
  );
  sl.registerFactory(
    () => PostsBloc(
      concreteGetBlogCategoriesUseCase: sl(),
    ),
  );


  ///Use cases
  sl.registerLazySingleton(() => GetBannersUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetPlacesUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetCategoriesUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetBlogCategoriesUseCase(repository: sl()));


  ///Repository

  sl.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(homeRemoteDataSource: sl(),),
  );

  sl.registerLazySingleton<PostsRepository>(
        () => PostsRepositoryImpl(postsRemoteDataSource: sl(),),
  );



  ///Core




  ///Data sources


  sl.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl( client: sl(),
    ),
  );
  sl.registerLazySingleton<PostRemoteDataSource>(
        () => PostsRemoteDataSourceImpl( client: sl(),
    ),
  );

  // sl.registerLazySingleton<TransactionRemoteDataSource>(
  //       () => TransactionRemoteDataSourceImpl( client: sl(),
  //   ),
  // );




  /// External

  globalSH = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => globalSH);

  sl.registerLazySingleton(() => http.Client());



}
