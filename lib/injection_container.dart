import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'core/globals.dart';




final sl = GetIt.instance;

Future<void> init() async {
  ///Bloc
  // sl.registerFactory(
  //   () => AuthBloc(concreteLoginUseCase: sl(),
  //   ),
  // );
  // sl.registerFactory(
  //   () => TransactionBloc(concreteTransactionUseCase: sl(),
  //   ),
  // );

  ///Use cases

  // sl.registerLazySingleton(() => LoginUseCase(repository: sl()));
  // sl.registerLazySingleton(() => GetTransactionStatementsUseCase(repository: sl()));


  ///Repository

  // sl.registerLazySingleton<AuthRepository>(
  //   () => AuthRepositoryImpl(authRemoteDataSource: sl(),),
  // );
  // sl.registerLazySingleton<TransactionRepository>(
  //       () => TransactionRepositoryImpl(transactionRemoteDataSource: sl(),),
  // );



  ///Core




  ///Data sources


  // sl.registerLazySingleton<AuthRemoteDataSource>(
  //   () => AuthRemoteDataSourceImpl( client: sl(),
  //   ),
  // );
  //
  // sl.registerLazySingleton<TransactionRemoteDataSource>(
  //       () => TransactionRemoteDataSourceImpl( client: sl(),
  //   ),
  // );




  /// External

  globalSH = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => globalSH);

  sl.registerLazySingleton(() => http.Client());



}
