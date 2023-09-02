import 'package:get_it/get_it.dart';
import 'package:hi_erbil_mobile/features/wishlist/data/data_source/local_data_sourse/wishlist_local_data_source.dart';
import 'package:hi_erbil_mobile/features/wishlist/domain/repositories/wishlist_repository.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'core/globals.dart';
import 'features/home/data/data_source/remot_data_sourse/home_remot_data_source.dart';
import 'features/home/data/repositories/home_repository_impl.dart';
import 'features/home/domain/repositories/home_repository.dart';
import 'features/home/domain/usecase/get_all_products_usecase.dart';
import 'features/home/domain/usecase/get_banners_usecase.dart';
import 'features/home/domain/usecase/get_categories_usecase.dart';
import 'features/home/domain/usecase/get_map_item_usecase.dart';
import 'features/home/domain/usecase/get_newest_products_usecase.dart';
import 'features/home/domain/usecase/get_place_by_id_usecase.dart';
import 'features/home/domain/usecase/get_places_usecase.dart';
import 'features/home/domain/usecase/get_product_by_id_usecase.dart';
import 'features/home/domain/usecase/get_products_by_sub_cat_id_usecase.dart';
import 'features/home/domain/usecase/get_sub_category.dart';
import 'features/home/domain/usecase/get_tags_usecase.dart';
import 'features/home/presentation/bloc/home_bloc.dart';
import 'features/posts/data/data_source/remot_data_sourse/posts_remot_data_source.dart';
import 'features/posts/data/repositories/posts_repository_impl.dart';
import 'features/posts/domain/repositories/posts_repository.dart';
import 'features/posts/domain/usecase/get_blog_categories_usecase.dart';
import 'features/posts/domain/usecase/get_post_useccacse.dart';
import 'features/posts/presentation/bloc/posts_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'features/wishlist/data/repositories/wishlist_repository_impl.dart';
import 'features/wishlist/domain/usecase/add_to_wishlist_usecase.dart';
import 'features/wishlist/domain/usecase/delete_from_fav_usecase.dart';
import 'features/wishlist/domain/usecase/get_all_wishlist_usecase.dart';
import 'features/wishlist/domain/usecase/is_fav_usecase.dart';
import 'features/wishlist/presentation/pages/bloc/wishlist_bloc.dart';


final sl = GetIt.instance;

Future<void> init() async {
  ///Bloc
  sl.registerFactory(
    () => HomeBloc(
      concreteGetBannersUseCase: sl(),
      concreteGetCategoriesUseCase: sl(),
      concreteGetPlacesUseCase: sl(),
      concreteGetTagsUseCase:  sl(),
      concreteGetPlaceByIdUseCase: sl(),
      concreteGetMapItemsUseCase: sl(),
      concreteGetSubCategoryUseCase: sl(),
      concreteGetProductsBySubCatIdUseCase: sl(),
      concreteGetProductsByIdUseCase: sl(),
      concreteGetNewestProductsUseCase: sl(),
      concreteGetAllProductsUseCase: sl(),
    ),
  );
  sl.registerFactory(
    () => PostsBloc(
      concreteGetBlogCategoriesUseCase: sl(),
      concreteGetPostByIdUseCase:  sl(),
    ),
  );

  sl.registerFactory(
        () => WishlistBloc(
          concreteAddToWishlistUseCase: sl(),
          concreteGetWishlistUseCase: sl(),
          concreteIsFavUseCase: sl(),
          concreteDeleteFromFavUseCase: sl(),
    ),
  );


  ///Use cases
  sl.registerLazySingleton(() => GetNewestProductsUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetAllProductsUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetProductsByIdUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetProductsBySubCatIdUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetSubCategoryUseCase(repository: sl()));
  sl.registerLazySingleton(() => DeleteFromFavUseCase(repository: sl()));
  sl.registerLazySingleton(() => IsFavUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetWishlistUseCase(repository: sl()));
  sl.registerLazySingleton(() => AddToWishlistUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetPlaceByIdUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetTagsUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetBannersUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetPlacesUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetCategoriesUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetBlogCategoriesUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetPostByIdUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetMapItemsUseCase(repository: sl()));


  ///Repository
  sl.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(homeRemoteDataSource: sl(),),
  );

  sl.registerLazySingleton<PostsRepository>(
        () => PostsRepositoryImpl(postsRemoteDataSource: sl(),),
  );
  sl.registerLazySingleton<WishlistRepository>(
        () => WishlistRepositoryImpl(wishlistLocalDataSource: sl(),),
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

  sl.registerLazySingleton<WishlistLocalDataSource>(
        () => WishlistLocalDataSourceImpl(),
  );




  /// External

  database = openDatabase(
    /**
     * ? Set the path to the database. Note: Using the `join` function from the
     * ? `path` package is best practice to ensure the path is correctly
     * ? constructed for each platform.
     */
    join(await getDatabasesPath(), 'database.db'),
    onCreate: (db, version) {
      ///Create cart table
      return db.execute(
        'CREATE TABLE wishlist(id INTEGER PRIMARY KEY,apiID INTEGER unique, title TEXT,image TEXT)',
      );

    },
    /**
     * ? Set the version. This executes the onCreate function and provides a
     * ? path to perform database upgrades and downgrades.
     */
    version: 3,
  );
  globalSH = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => globalSH);

  sl.registerLazySingleton(() => http.Client());



}
